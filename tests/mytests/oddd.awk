# Cases where awk allows an assignment as right operand
BEGIN {
    n = 3; 0 ? 2 : n = 4; print n " ternary"
    n = 3; 1 ? 2 : n = 4; print n " ternary"
    n = 3; 0 ? n = 4 : 2; print n " ternary"
    n = 3; 1 ? n = 4 : 2; print n " ternary"
    n = 3; 0 || n = 4; print n " or"
    n = 3; 1 && n = 4; print n " and"
    n = 3; "13" ~ n = 4; print n " match"
    n = 3; print "12" ~ n = 4; print n " match"

    n = 3; print (2 < n = 4); print n " less"
    n = 3; print (12 == n = 4); print n " equal"

    #n = 3; print "12" n *= 4; print n " concat" # error
    #n = 3; print 12 / n *= 4; print n " div" # error
    #n = 3; print 12 - n *= 4; print n " minus" # error
    #n = 3; print 12 ^ n *= 4; print n " pow" # error
}
