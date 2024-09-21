
#BEGIN {s = "abcdefg"; k = sub(/c\
#de/, "foo&bar", s); print s;print k}
#BEGIN {s = "abcdefg"; k = sub(/cde/, "foo&bar", s); print s;print k}
BEGIN {
    s = "abcdefg"
    print "(" s ")"
    print RSTART, RLENGTH
    print match(s, /cde/)
    print RSTART, RLENGTH
    k = sub(/cde/, "foo&bar", s)
    print s
    print k
}
