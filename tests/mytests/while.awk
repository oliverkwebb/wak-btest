BEGIN {
    k = 5;
    while (--k) {
        print k;
        print k==2;
        if (k==2) break;
        if (k==3) continue;
        print k;
    }
    print 123;
}
