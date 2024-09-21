BEGIN {
    a = 123; print a; print a++; print a++; print a
    print ""
    b[2] = 123; print b[2]; print b[2]++; print b[2]++; print b[2]
    print ""
    $0 = 123; print $0; print $0++; print $0++; print $0
}
