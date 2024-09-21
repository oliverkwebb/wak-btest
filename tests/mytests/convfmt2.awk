BEGIN {
    CONVFMT = "%2.2f"
    a = 12.0
    b = a ""
    print b
}
BEGIN {if (0) {
    #CONVFMT = "foo"
    print CONVFMT
    print 123.456, 123.456 ""

    CONVFMT = 789
    CONVFMT = "foo"
    print CONVFMT
    print 123.456, 123.456 ""
    print CONVFMT
    }
}
