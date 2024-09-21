BEGIN {
    f()
}
function f() {
    for (i=1;i<4;i++)
        return 1;
}
