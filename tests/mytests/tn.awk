#BEGIN {s = "abcdefg"; k = sub(/c\
#de/, "foo&bar", s); print s;print k}


BEGIN {k = 3;
    if (k==2)
        {print "NO"}

    else
        
        print "OK"
    exit
    }    # OK

BEGIN {k = 3; if (k==2);else print "OK"}    # OK
BEGIN {k = 3; if (k==2){}else print "OK"}    # OK
BEGIN {k = 3; if (k==2){;;;}else print "OK"}    # OK
BEGIN {k = 3; if (k==2) print "NO";else print "OK"}    # OK
BEGIN {k = 3; if (k==2){print "NO"}else print "OK"}    # OK
#BEGIN {k = 3; if (k==2);;else print "OK"}    # error
#BEGIN {k = 3; if (k==2){};else print "OK"}    # error
