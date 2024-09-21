#BEGIN { a[1]; a[2]=3; }
BEGIN {
    n = 100000;
    n = 5;
    n = 10;
    for (k=n;k--;)
        a[k] = k+3;
    print k
    for (k=5;k--;)
        print k, a[k]
}
