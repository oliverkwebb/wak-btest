BEGIN {
    s = "x1"
    s = "0x1x2"
    print "(" s ")"
    print match(s, /[0-9]*|x/)
    k = gsub(/[0-9]*|x/, "!", s);
    print k
    print "(" s ")"
}
