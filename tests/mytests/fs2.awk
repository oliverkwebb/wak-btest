BEGIN {
    a = "  	 asdf qewr	def "
    a = "adsfzcxvqweradsf"
    $0 = a
    p()
    FS = "[a-m]"
    #p()
    $0 = a
    p()
}
function p() {
    print "(" FS ")"
    for (i = 1; i <= NF; i++)
        print i, "(" $i ")"
    print
}
