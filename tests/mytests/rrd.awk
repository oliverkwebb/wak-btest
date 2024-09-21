BEGIN{
    print "a\bc" ~ /a\bc/
    #print "ab\vc\td\\e\/f\101g\bh" ~ /ab\vc\td\\e\/f\101g\bh/
    #print "ab\vc\td\\e/f\101g\bh" ~ /ab\vc\td\\e\/f\101g\bh/
    #print "ab\vc\td\\e/f\101g\bh" ~ /ab\vc\td\\e\/f\101g\bh/
    #print "ab\vc\td\\e/f\101g" ~ /ab\vc\td\\e\/f\101g/
    #print "ab\vc\td\\e" ~ /ab\vc\td\\e/
}
