# a b f v r t n \ " / \ddd \c       awk escapes
# . [ \ ( ) * + ? { } | ^ $         regex special chars

BEGIN {
#print "x\"y", "x\\"y", "x\"y" ~ "x\\"y"
print "x\.y", "x\\.y", "x\.y" ~ "x\\.y"
print "x\[y", "x\\[y", "x\[y" ~ "x\\[y"
print "x\(y", "x\\(y", "x\(y" ~ "x\\(y"
print "x\)y", "x\\)y", "x\)y" ~ "x\\)y"
print "x\*y", "x\\*y", "x\*y" ~ "x\\*y"
print "x\+y", "x\\+y", "x\+y" ~ "x\\+y"
print "x\?y", "x\\?y", "x\?y" ~ "x\\?y"
print "x\{y", "x\\{y", "x\{y" ~ "x\\{y"
print "x\}y", "x\\}y", "x\}y" ~ "x\\}y"
print "x\|y", "x\\|y", "x\|y" ~ "x\\|y"
print "x\^y", "x\\^y", "x\^y" ~ "x\\^y"
print "x\$y", "x\\$y", "x\$y" ~ "x\\$y"

print "x\ay", "x\\ay", "x\ay" ~ "x\\ay"
print "x\by", "x\\by", "x\by" ~ "x\\by"
print "x\fy", "x\\fy", "x\fy" ~ "x\\fy"
print "x\vy", "x\\vy", "x\vy" ~ "x\\vy"
print "x\ry", "x\\ry", "x\ry" ~ "x\\ry"
print "x\ty", "x\\ty", "x\ty" ~ "x\\ty"
print "x\ny", "x\\ny", "x\ny" ~ "x\\ny"
print "x\\y", "x\\\\y", "x\\y" ~ "x\\\\y"
print "x\\y", "x\\\y", "x\\y" ~ "x\\\y"
    }
