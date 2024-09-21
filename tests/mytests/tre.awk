BEGIN {
    #rx = /\d*|x/
    #s = "x1"
    rx = /x/
    s = "0x1x2"
    print "(" s ")"
    #print match(s, /\d*|x/)
    #k = sub(rx, "!", s);
    print k
    print "(" s ")"
}
