BEGIN {
    a[1]=2
    f()
}
function f() {
    for (e in a)
        exit 1
}
