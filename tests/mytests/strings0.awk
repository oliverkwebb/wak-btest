BEGIN {
    s = "This is a test"
    ss = "is a"
    k = sub(ss, "foo", s)
    print k, "(" s ")"
    k = sub(ss, "foo")
    print k, "(" s ")"
if (0) {
    RSTART = "foo"
    print match(s, ss), RSTART, RLENGTH;
    print match(s, /tes/), RSTART, RLENGTH;
    print match(s, /foo/), RSTART, RLENGTH;

    print index(s, "foo")
    print index(s, ss)
    x = substr(s, 6, 4)
    printf "(%s)\n", x
    x = substr(s, 6, -4)
    printf "(%s)\n", x
    x = substr(s, -6, 4)
    printf "(%s)\n", x
    x = substr(s, 6, 0)
    printf "(%s)\n", x
    }
    }
