BEGIN { f() }

function f(a) { g(a) }

#function g(d) { print "hi"; d = 0 }  # bad 'array in scalar context' error -- on 'line 7'?

function g(d, x) { d = 0 }  # mem leak
#
#
