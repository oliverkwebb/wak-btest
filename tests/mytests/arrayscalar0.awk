BEGIN { x = 23; y[1] = 45; f(1, x); f(0, y) }
function f(a, b) { if (a) print b; else print b[1] }
