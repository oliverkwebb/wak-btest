BEGIN {
    a[3] = 1
    y = 3
    #x = y in a + 2
    x = y in a && 2
    print x
}
