BEGIN {
    print 123.456
    OFMT = "%2000.20f"
    print 123.456
    a = "this is a test"
    print a, 123.456, a
}
