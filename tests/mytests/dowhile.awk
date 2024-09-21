BEGIN {
    k = 5;
    do {
        print k;
        print k==2;
        if (k==2) break;
        if (k==3) continue;
        print k;
    } while (--k)
    print 123;
}
