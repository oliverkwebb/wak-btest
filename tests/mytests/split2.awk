BEGIN {
    s = "32   a \n b c   "
    #FS="[ \t]*"
    FS="[ ]"
    a[1] = "abc"
    a[2] = "def"
    #RS=""
    n = split(s, a, "")
    n = split(s, a, //)    # bbawk == wak but differ from others
    #n = split(s, a, /()/)   # goawk differs; mawk does not compile
    #n = split(s, a, /b/)
    #n = split(s, a, "b")   # nawk differs
    #n = split(s, a, /./)   # goawk differs
    #n = split(s, a, ".")   # nawk differs
    print n
    for (e in a) print e, "<" a[e] ">"
}
