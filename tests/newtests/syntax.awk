BEGIN { a[1] = 2; b = 2; $0 = "33 44 55 66 77"; print $b; $b++; print $0; print $a[1]; $a[1]++; print a[1]; print $0 }
