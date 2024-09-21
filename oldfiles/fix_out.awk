# BEGIN {
# #print "                  ======= ======= ======= ======= ======= ======= ======="
# #print "                     nawk    gawk    mawk   bbawk   goawk     wak    wakm"
# #print "                     ====    ====    ====    ====    ====    ====    ===="
# print "                               ======= ======= ======= ======= ======= ======= ======="
# print "====versions====                  nawk    gawk    mawk   bbawk   goawk     wak   mwakm"
# print "                                  ====    ====    ====    ====    ====    ====    ===="
# 
# print
# }
BEGIN {
    col_first = 32
    col_second = 40
    col_goawk = 56
    col_bbawk = 64
    col_tbawk = 72
    col_asawk = 80

    col_first = 31
    col_second = 39
    col_goawk = 55
    col_bbawk = 63
    col_tbawk = 71
    col_asawk = 79
    if (p == "go") p = col_goawk
    else if (p == "bb") p = col_bbawk
    else if (p == "tb") p = col_tbawk
    else if (p == "as") p = col_asawk
    }
#/=versions=/ { pgm = substr($0, 31, 8); pgm1 = substr($0, 32, 8); pgm2 = substr($0, 40, 8); print "{" pgm2 "}" }
/=versions=/ { pgm = substr($0, 31, 8); pgm1 = substr($0, 32, 8); pgm2 = toupper(substr($0, 39, 8)) }

/======= =======/ {if (!n) {print; n=NR}}
#/======= =======/ {print; n=NR}
NR==n+1
NR==n+2 {print;print ""}

### The main idea is to skip "uninteresting" rows
# If awk version is spec'd via 'p', then skip if:
#   p column is 'pass'
#   p column matches pgm from first or second column
#   all columns match first column
####DEBUG p {print "p:", p, pgm, pgm2}
(p && /^Test / && (substr($0, p, 8) == "    pass")) {next}
(p && /^Test / && (substr($0, p, 8) == pgm || substr($0, p, 8) == pgm2)) {next}
####DEBUG {print "!!^(" substr($0, 31, 8) ")+$"}
(p && /^Test / && substr($0, 39) ~ "^(" substr($0, 31, 8) ")+$")  {next}
#(p && substr($0, 39) ~ "^(" pgm ")+$")  {next}
#(p && substr($0, 31) ~ /^(    pass)+$/) {next}

# If all columns match first column or all are 'pass', print only first column
/^Test / && substr($0, 39) ~ "^(" pgm ")+$"  {print substr($0, 1, 38);next}
/^Test / && substr($0, 31) ~ /^(    pass)+$/ {print substr($0, 1, 38);next}

#(p && (substr($0, p, 7) == pgm1 || substr($0, p, 7) == pgm2)) {print}
#!p
#{next}

#length() <= 30 {next}

#                     nawk    gawk    mawk   bbawk   goawk     wak    wakm
#/nawk    gawk    mawk   bbawk   goawk     wak    wakm/ {next}
#/nawk    nawk    nawk    nawk    nawk    nawk/ {next}
#substr($0, 39) ~ /^(    nawk)+$/ {next}
/^Test /
