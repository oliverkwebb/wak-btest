#BEGIN { a[1]=1; print a[1] }
#BEGIN { a[1]; a }
BEGIN { a[1]=2; a=3; print a, a[1] }
