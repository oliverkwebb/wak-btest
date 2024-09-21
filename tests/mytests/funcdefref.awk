BEGIN { foo(); if (never) bar(); }
function foo() {}
function baz() {}
