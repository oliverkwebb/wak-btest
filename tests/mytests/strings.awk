BEGIN {
    s = "This is a test"
    ss = "is a"
    k = sub(ss, "foo", s)
    print k, "(" s ")"
    k = sub(ss, "foo")
    print k, "(" s ")"
}
