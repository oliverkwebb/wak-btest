#! /usr/bin/python3
# vim: set fileencoding=utf-8

"""test_awk.py -- test awk

Usage:
    test_awk.py awk_files -p awks -d dir -i input -o out_prefix -m method -f file_list

    awk_files is a file spec, wildcards ok, for test files, e.g. d/t*.awk
    -p awks         one or more awk programs to test
        default is 'nnawk gawk mawk goawk bbawk tbawk asawk'
    -d dir          dir/ will be prepended to each awk_file
    -i input        data file to be used with files under test
        default is testdir/test.data
    -o out_prefix   path prefix for output files, e.g. out/test_
        the awk program name will be appended to form dir name,
        e.g. out/test_gawk
    -m method       test method, see below (default t)
    -f file_list    file with list of above test specs
        specs on cmd line will be default for -f tests
    -t timeout_seconds

    methods:
    t   (after bwk's t.* tests) -- uses testdir/test.data
    p   (after bwk's p.* tests) -- uses testdir/test.countries
        Both t and p report a hash value of the output for the first column
        (i.e. the first awk version tested). In subsequent columns, if the
        hash is different from the first column, that hash is listed; but if
        hash matches a hash from a previous column then the awk version is
        listed, and if it differs from the first column it is up-cased.
    tt  (after bwk's tt.* timing tests) -- uses testdir/foo.td default input
        A time in milliseconds is reported for each test. If the result
        matches the result (not the time!) from the first column, just
        the time is reported. If the result matches the result from a
        another previous column, the time is preceded by the column
        number (1-based) of the column whose awk version it matches.
        If the result does not match any previous result, it is preceded
        by an exclamation point!
    inok    -- assumes presence of file.awk, file.in, file.ok
    ok      -- assumes presence of file.awk, file.ok
"""

"""
Notes from bwk's README.TESTS in the OTA testdir dir:
- About 160 small tests called t.* that constitute a random
sampling of awk constructions collected over the years.
Not organized, but they touch almost everything.

- About 60 small tests called p.* that come from the first
two chapters of The AWK Programming Language.  This is
basic stuff -- they have to work.

These two sets are intended as regression tests, to be sure
that a new version produces the same results as a previous one.
...
- About 20 files called tt.* that are used as timing tests;
they use the most common awk constructions in straightforward
ways, against a large input file constructed by Compare.tt.
"""

import sys
import os
import getopt
import glob
import re
import subprocess
import hashlib
import time

def gethash(s):
    if len(s):
        return hashlib.md5(s).hexdigest()
    return '0' * 32

def printf(fmt, *args):
    sys.stdout.write(fmt % args)

def readsb(fn):
    with open(fn, 'rb') as f:
        return f.read()


"""
subprocess.run(args, *, stdin=None, input=None, stdout=None, stderr=None, capture_output=False, shell=False, cwd=None, timeout=None, check=False, encoding=None, errors=None, text=None, env=None, universal_newlines=None, **other_popen_kwargs)
"""
def run_prog(args, inp=None, timeout=3):
    ###print(f'{args=} {inp=}')
    try:
        r = subprocess.run(args, stdin=inp, capture_output=True, timeout=timeout)
    except subprocess.TimeoutExpired as e:
        err = 'Timeout exception on subprocess: %s' % repr(e.args)
        return 777, b'Timeout!', err.encode(errors='backslashreplace')
    except Exception as e:
        err = 'Exception on subprocess: %s' % repr(e.args)
        return 777, b'Excp', err.encode(errors='backslashreplace')
    #print('args:', r.args)
    #print('retcode:', r.returncode)
    #print('stdout:', r.stdout)
    #print('stderr:', r.stderr)
    return r.returncode, r.stdout, r.stderr


# 'args', 'check_returncode', 'returncode', 'stderr', 'stdout'

isfile = os.path.isfile

def makedirs(dname):
    os.makedirs(os.path.abspath(dname), exist_ok=True)


def run_test_prog(prog, testname, awkfn, infn, timeout=1):  ## !!!!FIXME
    #print(f'runtestprog {prog=} {testname=} {awkfn=} {infn=}')
    #return 47, b'', b''
####    args = ['-f', awkfn, infn]
####    if infn is None:
####        args = ['-f', awkfn]
####    args = [prog] + args
    args = [prog, '-f', awkfn]
    ## !! Hack to deal with bbawk binary being named 'busybox'
    ## !! (Cannot invoke it directly as bbawk)
    if prog == 'bbawk':
        args = ['busybox', 'awk', '-f', awkfn]
    if prog == 'gawkc':     # gawk traditional mode (like nawk)
        args = ['gawk', '-c', '-f', awkfn]
    elif prog == 'gawkp':   # gawk POSIX mode
        args = ['gawk', '-P', '-f', awkfn]
    if infn:
        args.append(infn)
    ###print(f'runtestprog {args=}')
    ret, out, err = run_prog(args, timeout=timeout)
    out = out.replace(b'\r', b'')        ## TEMP? FIX CRs
    return ret, out, err


def test_one_file(fn, optns, errs, info):
    progs, inputfile = optns.progs, optns.inputfile
    method, timeout = optns.method, optns.timeout
    #print(f'{fn=} {prog=} {inputfile=} {out_prefix=} {method=}')
    #return

    def write_out(prog, testname):
        if not out:
            return
        outdir = os.path.join(optns.out_prefix, testname)
        makedirs(outdir)
        outfn = os.path.join(outdir, prog)
        
        with open(outfn, 'wb') as f:
            f.write(out)

    def get_errs():
        if ret:
            errs.append('RET: %s: %d\n' % (prog, ret))
        if err:
            try:
                errs.append('ERR: %s: %s\n' % (prog, err.decode('utf8')))
            except UnicodeDecodeError as e:
                errs.append('ERR: %s: EXCP%s\n(EXCP:%s)\n' % (prog,
                    err.decode('latin1'), str(e.args)))

    def ckawkok():
        get_errs()
        ok = readsb(okfn)
        if out == ok and not err and not ret:
            #printf('    %s', 'pass')
            printf('%8s', 'pass')
        elif out == ok:
            #printf('    %s', 'pass')
            printf('%8s', 'Pass?')
            #print('ret', ret, 'err:', err)
        else:
            #printf('    %s', 'FAIL')
            printf('%8s', 'FAIL')
        if out != ok:
            write_out(prog, testname)

    def ck_t_p():
        #xhash = hsh
        if err and ret: xhash = f'!!{hsh[2:]}' 
        elif err: xhash = f'!{hsh[1:]}'
        elif ret: xhash = f'{hsh[0]}!{hsh[2:]}'
        else: xhash = hsh
        info.append(xhash)
        if len(info) == 1:
            printf('%8s', xhash[:7])
            write_out(prog, testname)
        else:
            for k in range(len(info)-1):
                if xhash == info[k]:
                    printf('%8s', progs[k].upper() if k else progs[k])
                    break
            else:
                printf('%8s', xhash[:7])
                write_out(prog, testname)


    def ck_tt():
        info.append(hsh)
        if len(info) == 1:
            #printf('%8s', hsh[:7])
            printf('%8d', int(tim/1000000))
            write_out(prog, testname)
        else:
            for k in range(len(info)-1):
                if hsh == info[k]:
                    #printf('%8s', progs[k].upper() if k else progs[k])
                    if k:
                        printf(' %d %5d', k+1, int(tim/1000000))
                    else:
                        printf('%8d', int(tim/1000000))
                    break
            else:
                #printf('%8s', hsh[:7])
                printf(' !%6d', int(tim/1000000))
                write_out(prog, testname)

    def timr():
        return time.monotonic_ns()
        return time.process_time_ns()

    dirname = os.path.dirname(fn)
    noawkname = fn.replace('.awk', '')
    testname = os.path.basename(noawkname)
    #print(f'{dirname=} {testname=}')
    awkfn, infn, okfn = noawkname + '.awk', noawkname + '.in', noawkname + '.ok'
    if not isfile(okfn):
        okfn = noawkname + '.good'

    #print(f'{awkfn, infn, okfn=}')
    #return
    if method in 'inok awkinok'.split():
        if not isfile(awkfn): print(f'No file {awkfn}')
        #elif not isfile(infn): return   # pass     # print(f'No file {infn}')
        elif not isfile(infn): infn = inputfile
        elif not isfile(okfn): print(f'No file {okfn}')
        else:
            for prog in progs:
                ret, out, err = run_test_prog(prog, testname, awkfn, infn, timeout=timeout)
                ckawkok()
        return

    if method in 'ok awkok'.split():
        if not isfile(okfn): return
        for prog in progs:
            ret, out, err = run_test_prog(prog, testname, awkfn, inputfile, timeout=timeout)
            ckawkok()
        return

    if method == 'in':
        # Must have .awk and .in; .ok or .good ignored
        # Test with .in but don't report pass/fail
        if not isfile(infn):
            infn = inputfile
        if isfile(awkfn) and isfile(infn):
            #timeout = 10
            for prog in progs:
                #ret, out, err = run_test_prog(prog, testname, awkfn, infn)
                ret, out, err = run_test_prog(prog, testname, awkfn, infn, timeout=timeout)
                get_errs()
                hsh = gethash(out)
                ck_t_p()
        return

    if method == 'tryinok':
        if isfile(awkfn):
            if isfile(infn) and isfile(okfn):
                for prog in progs:
                    ret, out, err = run_test_prog(prog, testname, awkfn, infn, timeout=timeout)
                    ckawkok()
            elif isfile(okfn):
                for prog in progs:
                    ret, out, err = run_test_prog(prog, testname, awkfn, inputfile, timeout=timeout)
                    ckawkok()
            else:
                if not isfile(infn):
                    infn = inputfile
                for prog in progs:
                    ret, out, err = run_test_prog(prog, testname, awkfn, infn, timeout=timeout)
                    get_errs()
                    hsh = gethash(out)
                    ck_t_p()
        return

    #if method == 'smallp' or method == 'smallt' or method == 't':

    if not isfile(awkfn): awkfn = awkfn.replace('.awk', '')

    if method in 't smallt p smallp'.split():
        ###print(f'infn1: {infn}')
        if not isfile(infn):
            infn = inputfile
        ###print(f'infn2: {infn}')
        for prog in progs:
            ret, out, err = run_test_prog(prog, testname, awkfn, infn, timeout=timeout)
            get_errs()
            #hsh = hashlib.md5(out).hexdigest()
            hsh = gethash(out)
            ck_t_p()

    if method in 'tt smalltt'.split():
        #infn = os.path.join(dirname, 'foo.td')
        #infn = os.path.join(dirname, 'big.td')
        if not isfile(infn):
            infn = inputfile

        #timeout = 30 if testname == 'tt.big' else 15
        #timeout = 120
        #timeout = 300
        #timeout = 60*40

        for prog in progs:
            tim = timr()
            ret, out, err = run_test_prog(prog, testname, awkfn, infn, timeout=timeout)
            tim = timr() - tim
            #print('time: ', tim/1000000, ' msec')
            get_errs()
            #hsh = hashlib.md5(out).hexdigest()
            hsh = gethash(out)
            #ck_t_p()
            ck_tt()

def test_files(fns, optns):
    #print(f'{fns=} {optns.progs=} {inputfile=} {out_prefix=} {method=}')
    #return
    k = 0
    while fns:
        fn = fns.pop(0)
        ext = os.path.splitext(fn)[1]
        if ext in '.in .ok .good .bad'.split():     # ignore these
            continue
        if isfile(fn + '.awk'):
            fn = fn + '.awk'
        if not isfile(fn):
            continue
        k += 1

        errs = []
        info = []
        printf("%s", f"Test {optns.method}_{fn[6:]}")
        test_one_file(fn, optns, errs, info)
        print()
        if errs:
            print(''.join(errs))
    print()


def usage_exit(msg=''):
    if msg and not msg.endswith('\n'):
        msg += '\n'
    sys.exit('%s%s' % (msg, __doc__))


def get_arg(s, args):
    try:
        k = args.index(s)
        v = args[k+1]
        del args[k:k+2]
        return v
    except (ValueError, IndexError):
        return None


#test_awk.py awk_files -p awk_programs -i input -o out_prefix -m method -f file_list
def get_args(a, optns):
    #print(f'{a=}')
    #print(f'{a}')
    progs = get_arg('-p', a)
    if progs is not None:
        if ' ' in progs:
            optns.progs = progs.split()
        else:
            optns.progs = [progs]
    pdir = get_arg('-d', a)
    if pdir is not None:
        optns.pdir = pdir
    out_prefix = get_arg('-o', a)
    if out_prefix is not None:
        optns.out_prefix = out_prefix
    method = get_arg('-m', a)
    if method is not None:
        optns.method = method
    timeout = get_arg('-t', a)
    if timeout is not None:
        optns.timeout = float(timeout)
    inputfile = get_arg('-i', a)
    if inputfile is not None:
        optns.inputfile = inputfile
    elif optns.method in 'p smallp'.split():
        optns.inputfile = 'tests/testdir/test.countries'
    elif optns.method in 'tt smalltt'.split():
        optns.inputfile = 'tests/testdir/foo.td'

    #print(f'{a=}')
    fns = []
    for arg in a:
        if optns.pdir:
            arg = os.path.join(optns.pdir, arg)
        x = [fn for fn in glob.glob(arg) if os.path.isfile(fn)]
        fns.extend(x if x else [arg])
    return fns


def do_args(a, optns):
    fns = get_args(a, optns)
    test_files(fns, optns)


def main():
    # Maybe useful to see the actual version used.
    #print('Python %s' % sys.version)
    args = sys.argv[1:]
    if not args:
        usage_exit('No args.')
    #print(' '.join(sys.argv))
    optns = type('optns', (), {})()
    optns.progs =  'gawk nnawk mawk goawk bbawk tbawk muwak'.split()
    optns.pdir = ''
    optns.inputfile = 'tests/testdir/test.data'
    optns.out_prefix = 'out/'
    optns.method = 't'
    optns.timeout = 5
    f = None
    if '-f' in args:
        f = get_arg('-f', args)
        assert(f)
        fns = get_args(args, optns)
        if fns:
            sys.exit(f'{fns=} Cannot have testfiles with -f option')
    #print(f'{f=}')
    if f is not None:
        with open(f) as fp:
            for a in fp:
                if not a.strip().startswith('#'):
                    do_args(a.split(), optns)
    else:
        do_args(args, optns)
    print('==Finished.==')


main()
