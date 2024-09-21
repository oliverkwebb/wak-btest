BEGIN { f(a); print length(a) }
function f(x) { print split("a b c", x) }
