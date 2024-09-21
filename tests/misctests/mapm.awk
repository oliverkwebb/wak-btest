BEGIN{f(1); f(0)}
function f(a, b){if (a) g(b); else {h(b); i(b)}}
function g(x){print x}
function h(x){x[1] = 37}
function i(x){print x[1]}
