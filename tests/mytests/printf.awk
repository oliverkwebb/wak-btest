BEGIN {
    a = "this"
    b = 234.56
    c = "is"
    d = 789
    e = "a test"
    fmt = "foo %-12.2s %e %s %d %-s %% bar\n"
    printf(fmt, a, b, c, d, e)
    fmt = "foo %% bar\n"
    printf(fmt)
    printf(fmt, a, b, c, d, e)
    #fmt = "foo %-12.2s  %% bar\n"
    #printf(fmt, a)
    #printf(fmt, a, b, c, d, e)
}
