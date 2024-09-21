# Concatenation has higher precedence than IO.
BEGIN {
"echo " "date" | getline
print
}
