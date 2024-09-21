BEGIN {
$0 = "123abcdef456abcxyz7890ghi"
print gsub("a.c", "a!c")
print
$0 = "123abcdef456abcxyz7890ghi"
print sub("a.c", "a!c")
print
$0 = "123abcdef456abcxyz7890ghi"
print sub(/a.c/, "a!c")
print
$0 = "123abcdef456abcxyz7890ghi"
print sub((/a.c/), "a!c")
print
}
