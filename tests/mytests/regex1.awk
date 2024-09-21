BEGIN{
    print "a\8c" ~ /a\8c/
    print "a\bc" ~ /a\bc/
    print "a\\bc" ~ /a\\bc/
    print "a\\e" ~ /a\\e/
    print "a\\e" ~ /a\\\\e/
    #print "a\e" ~ /a\e/
}
