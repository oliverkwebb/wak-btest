BEGIN{
    #/ab\v\t\\\/c\101d\be/
    #"ab\v\t\\\/c\101d\be"
    #"ab\vc\td\\e\/f\101g\bh"
    #/ab\vc\td\\e\/f\101g\bh/
    #print "a\\e" > "rrbb"
    print "ab\vc\td\\e\/f\101g\bh" ~ /ab\vc\td\\e\/f\101g\bh/
    print "ab\vc\td\\e\/f\101g\bh" ~ /ab\vc\td\\\\e\/f\101g\bh/
    print "a\\b" ~ /a\\b/
    print "a\\e" ~ /a\\e/
    print "a\\e" ~ /a\\\\e/
}
