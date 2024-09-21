BEGIN {
    for (k = 5; k; k--) {
    #for (k = 5; --k; ) {
    #for (k = 5;; --k) {
        print k;
        print k==2;
        if (k==2) break;
        if (k==3) continue;
        print k;
    }
    continue;
    break;
    print 123;
}
