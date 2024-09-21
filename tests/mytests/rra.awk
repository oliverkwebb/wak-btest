BEGIN{
    #/ab\v\t\\\/c\101d\be/
    #"ab\v\t\\\/c\101d\be"
    #"ab\vc\td\\e\/f\101g\bh"
    #/ab\vc\td\\e\/f\101g\bh/
    print "ab\vc\td\\e\/f\101g\bh" ~ /ab\vc\td\\e\/f\101g\bh/
    print "ab\vc\td\\e" ~ /ab\vc\td\\e/
    print "ab\vc\td\\e/f\101g\bh" ~ /ab\vc\td\\e\/f\101g\bh/
}
