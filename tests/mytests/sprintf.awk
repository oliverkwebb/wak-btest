BEGIN {
    a = "this"
    b = 234.56
    c = "is"
    d = 789
    e = "a test"
    fmt = "foo %-*s %e %s %d %-s %% bar\n"
    s = sprintf(fmt, 12, a, b, c, d, e)
    print "(" s ")"
    }
