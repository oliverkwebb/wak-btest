#BEGIN { a = /tes\.   ting/ }
#/bar/ { barcnt++; }
#END { print "(" barcnt ")"}
BEGIN { a = "tes\
    ting" 
print "(" a ")"
    print "ates    tingb" ~ a
    print "ates    tingb" ~  /tes\
    ting/ 
}
