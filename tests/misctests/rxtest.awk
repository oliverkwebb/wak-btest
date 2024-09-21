BEGIN {
    s = "a’’b"
    print s ~ /.*/
    print s ~ /a..b/
    print s ~ /a’.b/
    print s ~ /a’+b/
    print length(s), s
}
