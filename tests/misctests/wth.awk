#BEGIN { $0 = "2 3 4"; $$0++; print }

#BEGIN { $0 = "2 3 4"; $0++; print }
#BEGIN { $0 = "2 3 4"; $$0; print }
#BEGIN {$0="3 4 5 6 7 8 9"; a=3; print $$a++++; print}

#BEGIN { a[1] = 2; b = 2; $0 = "33 44 55 66 77"; print $b; $b++; print $0; print $a[1]; $a[1]++; print a[1]; print $0 }
BEGIN {a = 2; b[1] = 2; $0 = "33 44"; print $a; $a++; print; print $b[1]; $b[1]++; print b[1]; print}

#BEGIN {a = 5; b= ++a}

#BEGIN { OFS=":"; $0 = "2 3 4"; $$0++; print;print NF }
#BEGIN { OFS=":"; $0 = "2 3 4"; x=$$0++; print;print 12 x 34 }
#BEGIN { $0 = "2 3 4"; print $0++;print }
#BEGIN { $0 = "2 3 4"; print $($0) }
