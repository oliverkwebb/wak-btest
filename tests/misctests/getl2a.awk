BEGIN {
	x = y = "!"
	cmd = "echo A"; a = ((cmd | getline x) y); close(cmd); print a, x
	cmd = "echo B"; a = ((cmd | getline x) (+ 1)); close(cmd); print a, x
	cmd = "echo C"; a = ((cmd | getline x) (- 2)); close(cmd); print a, x
}
