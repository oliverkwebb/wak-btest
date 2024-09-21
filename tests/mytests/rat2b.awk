BEGIN {
    $0 = 3.14
    OFMT = "%e"
    print
    OFMT = "%f"
    print
}
