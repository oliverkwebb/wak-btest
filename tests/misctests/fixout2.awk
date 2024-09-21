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

/=versions=/ { pgm = substr($0, 31, 8) }

/======= =======/ {if (!n) {print; n=NR}}
NR==n+1
NR==n+2 {print;print ""}

substr($0, 39) ~ "^(" pgm ")+$"  {print substr($0, 1, 38);next}
substr($0, 39) ~ /^(    pass)+$/ {print substr($0, 1, 38);next}
#length() <= 30 {next}

#                     nawk    gawk    mawk   bbawk   goawk     wak    wakm
#/nawk    gawk    mawk   bbawk   goawk     wak    wakm/ {next}
#/nawk    nawk    nawk    nawk    nawk    nawk/ {next}
#substr($0, 39) ~ /^(    nawk)+$/ {next}
/^Test /
