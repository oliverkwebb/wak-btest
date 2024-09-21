BEGIN {
    $0 = " 2 3 4 "
    print $2
    OFS = " abc "
    print $0
    $2 = "3"
    print $0
}
