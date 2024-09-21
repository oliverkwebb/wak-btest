# Input file named like gawk_in etc.
# Output files like: 
#   gawk_in_ok  col 6 matches cols 1 and 2
#   gawk_in_1   col 6 matches col 1 but not 2
#   gawk_in_2   col 6 matches col 2 but not 1
#   gawk_in_3   col 6 matches col 3 but not 1 or 2
#   gawk_in_4   col 6 matches col 4 but not 1, 2, 3
#   gawk_in_5   col 6 matches col 5 but not 1, 2, 3, 4
#   gawk_in_y   col 6 matches col 7 but none to left
#   gawk_in_x   anything else


BEGIN {
#===versions====                 nnawk    gawk    mawk   goawk   bbawk   asawk   aswak
#===versions====>>>>              gawk   nnawk    mawk   goawk   bbawk   tbawk   muwak

    col_first = 31

    infn = ARGV[1]          # assumed form is .../testsetname/out
    rptdir = ARGV[2]
    ARGC--;
    #sub(/\/[^/]*$/, "", infn)      # bad posix rx?
    sub(/\/[^\/]*$/, "", infn)      # now is .../testsetname
    sub(/.*\//, "", infn)           # now is testsetname
    ###fn = rptdir "/" infn
    fn = rptdir "/set"
    hdr = ""
#est unterm.awk                   FAIL    FAIL    FAIL    FAIL    FAIL    FAIL    FAIL
    allfail = "    FAIL    FAIL    FAIL    FAIL    FAIL    FAIL    FAIL"
    allpass = "    pass    pass    pass    pass    pass    pass    pass"
    gawkonly = "    FAIL    pass    FAIL    FAIL    FAIL    FAIL    FAIL"
    gawkonly = "    pass    FAIL    FAIL    FAIL    FAIL    FAIL    FAIL"
    split("y x ok k 1 2 3 4 5 pass passx fail allpass allfail badpass badfail odd", a)

oddt["Test argcasfile.awk           "] = 1
oddt["Test iolint.awk               "] = 1
oddt["Test longwrds.awk             "] = 1
oddt["Test arrayind1.awk            "] = 1
oddt["Test arryref2.awk             "] = 1
oddt["Test commas.awk               "] = 1
oddt["Test fnarydel.awk             "] = 1
oddt["Test fnparydl.awk             "] = 1
oddt["Test getline.awk              "] = 1
oddt["Test pid.awk                  "] = 1
oddt["Test sortfor2.awk             "] = 1
oddt["Test commas.awk               "] = 1
oddt["Test delarpm2.awk             "] = 1
oddt["Test mpfrsort.awk             "] = 1
oddt["Test sortfor.awk              "] = 1
oddt["Test echo_date_getline.awk    "] = 1
oddt["Test insdel.awk               "] = 1
oddt["Test showenv.awk              "] = 1
oddt["Test split.awk                "] = 1
oddt["Test split2.awk               "] = 1
oddt["Test tmapiter.awk             "] = 1
oddt["Test p.43                     "] = 1
oddt["Test p.48b                    "] = 1
oddt["Test r.arrdel                 "] = 1
oddt["Test t.in2                    "] = 1
oddt["Test t.intest2                "] = 1
oddt["Test t.randk                  "] = 1

}

/======= =======/ {if (!hdr) hdr = $0}
/=versions=/ {
    if (!v) {v++; hdr = hdr "\n" $0}
    for (col = 1; col < 8; col++) {
        pgm[col] = substr($0, col_first + (col - 1) * 8, 8)
        if (col > 1) pgm[col] = toupper(pgm[col])
        #print "(" pgm[col] ")"
    }
}
/====    ====/ {if (!w){w++; hdr = hdr "\n" $0; }}

function ph(h) {
    for (e in a) {
        if (h == a[e]) {
            print "========== " infn " ==========" >> (fn "_" h)
            #print hdr >> fn "_" h      # nnawk says syntax error
            print hdr >> (fn "_" h)     # nnawk is OK with this
            delete a[e]
            break
        }
    }
    print >> (fn "_" h)
}

/^Test / {
    testname = substr($0, 1, 30)
##     if (testname in oddt) {
##         ph("odd")
##         #next
##     }
    for (col = 1; col < 8; col++) {
        x[col] = substr($0, col_first + (col - 1) * 8, 8)
        #print FILENAME, NR, x[col]
    }
    cols = substr($0, col_first)
    wak = x[6]
    # put file redirection targets in parens to make nnawk happy
    # y is col 7 differs from col 6 (tb awk != standalone wak)
    # ok is col 6 and 2 match 1 (we match nnawk and gawk)
    if (x[7] != pgm[6] && x[7] != wak) {ph("y")}
    else if (infn ~ /allfail_inok/) {
        if (cols != allfail) ph("badfail")  #; else ph("allfail")
    }
    else if (infn ~ /allpass_inok/) {
        if (cols != allpass) ph("badpass")  #; else ph("allpass")
    }
    else if (infn ~ /gawkonly_inok/) {
        if (cols != gawkonly) ph("badgawkonly")
    }
    else if (infn ~ /_inok/ && (cols == allpass || cols == allfail)) {
        if (cols == allpass) ph("badpass")  #; else ph("allpass")
        if (cols == allfail) ph("badfail")  #; else ph("allfail")
    }
    else if (cols ~ /  FAIL|  pass|  Pass/) {
        if (wak ~ /FAIL/) {
            ph("fail")
        }
        else if (wak ~ /pass/) {
            if (x[1] ~ /pass/ && x[2] ~ /pass/) ph("ok")
            else if (x[1] ~ /pass/) ph("1")
            else if (x[2] ~ /pass/) ph("2")
            else ph("pass")
        } else ph("passx")
    }
    else if (wak == pgm[1] && x[2] == pgm[1]) {ph("ok")}
    else if (wak == pgm[1]) {ph("1")}
    else if (wak == pgm[2]) {ph("2")}
    else if (wak == pgm[3]) {ph("3")}
    else if (wak == pgm[4]) {ph("4")}
    else if (wak == pgm[5]) {ph("5")}
    else {ph("x")}
}
