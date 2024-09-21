#BEGIN { a = /tes\.   ting/ }
#/bar/ { barcnt++; }
#END { print "(" barcnt ")"}
BEGIN { ab\
c = "tes\
    ting" 
print "(" abc ")"
    print "ates    tingb" ~ abc
    print "ates    tingb" ~  /tes\
    ting/ 
}
