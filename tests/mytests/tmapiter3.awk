BEGIN { a[1] = 2; a[3] = 4; a[5] = 6
    h(a)
}
function h(a, x) {
    g(x)
    print "huh", x[1];
    f(a, x);
}
function g(x) { x[1] = 2 }
function f(a, x) {
    delete a[3]
    #x[1] = 3;
    for (x in a) {
        print "x:", x;
        delete a[x]
    }
    print "more"
    for (x in a) {
        print "xx:", x;
        delete a[x]
    }
}
