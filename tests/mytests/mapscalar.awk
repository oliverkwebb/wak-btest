# While compiling f() the type of b is unknown, and when called with one
# arg, b is an uninitialized local. Is it a scalar? It is, when passed to
# g, so passed by value.  Is it an array? It is, when passed to h and i,
# so passed by reference, and b[1] is retained between h(b) and i(b).
function f(a, b) { if (a) g(b); else {h(b); i(b)} }
function g(x) { print "x: (" x ")", "(" x + 0 ")" }
function h(x) { x[1] = 67 }
function i(x) { print "x[1]: (" x[1] ")" }
BEGIN { f(1); f(0) }
