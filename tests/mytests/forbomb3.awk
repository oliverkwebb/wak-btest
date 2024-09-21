BEGIN {
    a[1]=2
    b[3]=4
    f()
}
function f() {
    for (e in a)
        for (c in b)
            return 1
}
