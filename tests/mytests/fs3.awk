BEGIN {
    a = "  	 asdf qewr	def "
    a = "adsfzcxvqweradsf"
    a = "adsf"
    $0 = a
    p()
    FS = ""
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
