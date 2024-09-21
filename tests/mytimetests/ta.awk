#BEGIN { a[1]; a[2]=3; }
BEGIN {
    n = 100000;
    n = 5;
    n = 10000000;
    print n
    for (k=n;k--;)
        a[k] = (k+3) ""
        #a[k] = k+3
        #x = k+3
        ;
    print k
    #exit
    for (k=5;k--;)
        print k, a[k]
}
