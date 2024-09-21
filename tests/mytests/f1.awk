BEGIN { a=f(1,2,3); exit 37; }; function g() {}; function f(a,b,c) { a=b+c; return a }
