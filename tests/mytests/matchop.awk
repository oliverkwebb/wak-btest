BEGIN {
    $0 = "abc"
    print 1+/abc/
    print "abc"~/abc/
    print "abc"~(/abc/)
    print "1"~(/abc/)
}
