BEGIN { a=f(1,2,3); print "a:", a; exit 37 }
function g() {}
function h() {}
function f(a,b,c) { a=b+c; return a }
