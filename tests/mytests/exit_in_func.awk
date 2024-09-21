function f(s) {if (NR > 10) exit}
#$1 > 5000	{ next }
#$1 > 5000	{ f($1) }
{ f($1) }
{ print }
