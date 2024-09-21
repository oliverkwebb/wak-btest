BEGIN{
    print "a\\e" ~ /a\\e/
    print "a\\e" ~ /a\\\\e/
    print "a\bc" ~ /a\bc/
    print "a\\bc" ~ /a\\bc/
}
