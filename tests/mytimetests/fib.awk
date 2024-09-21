BEGIN {
    #if (n == "") n = 5
    if (n == "") n = 35
    print "fib(" n ") =", fib(n)
}
function fib(n) {
    #return n < 2 ? 1 : fib(n-2) + fib(n-1)
    return n < 2 ? n : fib(n-2) + fib(n-1)
}
