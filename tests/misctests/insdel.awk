BEGIN {
    for (i = 0; i < 20; i++ ) a[i] = i
    #for (i in a) print i, a[i]
    for (i = 11; i < 16; i++ ) delete a[i]
    print "==="
    #for (i in a) print i, a[i]
    a[13] = "foo"
    for (i = 11; i < 16; i++ ) a[i] = 20+i
    print "==="
    for (i in a) print i, a[i]
}
