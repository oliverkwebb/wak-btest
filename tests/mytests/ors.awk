BEGIN {
    #ORS = "foo"
    print ORS
    print 123.456
    print 789.234

    ORS = "foo"
    ORS = 789
    print ORS
    print 123.456
    print 789.234
    print ORS
}
