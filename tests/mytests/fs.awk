BEGIN {
    a = "  	 asdf qewr	def "
    $0 = a
    p()
    FS = "[ \t]+"
    p()
    $0 = a
    p()
}
function p() {
    print "(" FS ")"
    for (i = 1; i <= NF; i++)
        print i, "(" $i ")"
    print
}
