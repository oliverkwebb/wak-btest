#BEGIN { $0="abc"; print NF; for (i=1; i<=NF; i++) print "(" $i ")" }
#BEGIN { $0 = "1 2 3 4 5"; print $3, $3 == 3; OFS = "abc"; print $0; $3 = 3; print $3 == 3; print $0 }
BEGIN { $0 = "1 2 3 4 5"; print $3, $3 == 3; OFS = "abc"; print $0; print $3 = 3 }
