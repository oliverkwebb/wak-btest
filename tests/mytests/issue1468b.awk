# Test for awk issue 1468 a different way. This will try to find an empty match
# at end of string, but that's not allowed. Should end with NF == 1 and $1 == "bbb".
# bbawk fails this; shows NF==2 and empty $2.
BEGIN {FS="[^b]*$"; $0="bbb"; print NF; for (i=1;i<=NF;i++)print i, "(" $i ")"}
