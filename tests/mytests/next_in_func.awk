function f(s) {if (s > 5000) next}
#$1 > 5000	{ next }
#$1 > 5000	{ f($1) }
{ f($1) }
{ print }
