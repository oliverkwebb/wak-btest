BEGIN {
	x = y = "!"
	a = (getline x y); print a, x
	a = (getline x + 1); print a, x
	a = (getline x - 2); print a, x
}
