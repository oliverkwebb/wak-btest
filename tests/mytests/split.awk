BEGIN {
    s = "32   a b c   "
    #FS="[ \t]*"
    FS="[ ]"
    a[1] = "abc"
    a[2] = "def"
    n = split(s, a, "")
    print n
    for (e in a) print e, "<" a[e] ">"
}
