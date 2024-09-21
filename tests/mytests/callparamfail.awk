# 20240206 rdg  Modified from gawk test callparam.awk
BEGIN { f() }

function b() {}

function f(	a, b)
{
	a = b()
}
