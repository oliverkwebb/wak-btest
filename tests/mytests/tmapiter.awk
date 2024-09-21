BEGIN { a[1] = 2; a[3] = 4; a[5] = 6
    delete a[3]
    for (x in a)
        print "x:", x;
}
