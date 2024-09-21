BEGIN {
    f()
}
function f() {
    for (i=1;i<4;i++)
        exit 1
}
