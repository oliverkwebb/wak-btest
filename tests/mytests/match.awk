BEGIN {
    RSTART = "foo"
    k = match("this is a test", /te/)
    print k, RSTART, RLENGTH
}
