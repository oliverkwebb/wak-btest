#!/usr/bin/env bash

f() {
    # parms are testpathspec testmode outdirname [extra parms]
    # e.g. gawktests/allpass/*.awk tryinok allpass_inok
TESTS=tests/$1
MODE=$2
OUTDIR=out/$3
if ! [ -d out ];
then
    mkdir out
fi
echo mode: $MODE
echo tests: "$TESTS"
echo make outdir: mkdir $OUTDIR
mkdir $OUTDIR
#time -f '%e %C' python3 test_awk.py "$TESTS" -m $MODE -o $OUTDIR > $OUTDIR/out $4 $5 $6 $7 $8 $9
time ./test_awk.py "$TESTS" $P ${PRO:-"$PRO"}-m $MODE -o $OUTDIR > $OUTDIR/out $4 $5 $6 $7 $8 $9
awk -f fix_out.awk $OUTDIR/out > $OUTDIR/outx
}

#f testdir/tt.* tt tt -i tests/testdir/foo.td -t 2400
#f mytimetests/*.awk tt mytimetests -t 2400
#exit
#f mm/*.awk t mm
#exit
f testdir/p.* p p
f testdir/t.* t t
#exit
f gawktests/*.awk in gawk_in
f gawktests/*.awk tryinok gawk_inok
f gawktests/gawkonly/*.awk in gawkonly_in
f gawktests/gawkonly/*.awk tryinok gawkonly_inok
f gawktests/allfail/*.awk in allfail_in
f gawktests/allfail/*.awk tryinok allfail_inok
f gawktests/allpass/*.awk in allpass_in
f gawktests/allpass/*.awk tryinok allpass_inok
f mytests/*.awk t mytests
f misctests/*.awk t misctests
f newtests/*.awk t newtests
f beebe_only/*.awk t beebe_only
f tests_r/r.* t r
exit
exit
### TIME TESTS
f testdir/tt.* tt tt -i tests/testdir/foo.td -t 2400
f mytimetests/*.awk tt mytimetests -t 2400
exit
f testdir/p.* p p
exit
f testdir/tt.* tt tt -i tests/testdir/foo.td -t 2400
f mytimetests/*.awk tt mytimetests -t 2400
f mytimetests/fib.awk tt mytimetests -t 24
exit
exit
exit



beebe_only
mytimetests
tests_r


f nntests/*.awk in nntests
f reg/*.awk in reg
f reg/*.awk in reg
f gawktests/*.awk in gawk_in
f gawktests/gawkonly/*.awk in gawkonly_in
f gawktests/allfail/*.awk in allfail_in
f gawktests/allpass/*.awk in allpass_in
f gawktests/*.awk tryinok gawk_inok
f gawktests/gawkonly/*.awk tryinok gawkonly_inok
f gawktests/allfail/*.awk tryinok allfail_inok
f gawktests/allpass/*.awk tryinok allpass_inok
f mytests/*.awk t mytests
f newtests/*.awk t newtests
f tests_r/r.* t r


f a/*.awk in a
f testdir/*.awk in testdir
f gawktests/*.awk in gawk_in
f gawktests/gawkonly/*.awk in gawkonly_in
f gawktests/allfail/*.awk in allfail_in
f gawktests/allpass/*.awk in allpass_in
f gawktests/*.awk tryinok gawk_inok
f gawktests/gawkonly/*.awk tryinok gawkonly_inok
f gawktests/allfail/*.awk tryinok allfail_inok
f gawktests/allpass/*.awk tryinok allpass_inok

f testdir/p.* p p
f testdir/t.* t t


f gawktests/allpass/*.awk tryinok allpass_inok
f gawktests/allpass/*.awk in allpass_in

exit
f testdir/tt.* tt tt -i tests/testdir/foo.td
f mytimetests/*.awk tt mytimetests
exit
