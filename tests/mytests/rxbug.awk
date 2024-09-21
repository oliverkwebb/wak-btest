BEGIN {
    print "abc" ~ /abc/
    print "abc" ~ /abc/ + 2
    print "abc" ~ 2 + /abc/
}
