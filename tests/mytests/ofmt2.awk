BEGIN {
    #OFMT = "foo"
    print OFMT
    print 123.456, 123.456 ""

    OFMT = 789
    OFMT = "foo"
    print OFMT
    print 123.456, 123.456 ""

}
