#BEGIN { a = 1; if (a == 1 && a = 2) print "a: " a; else print "fail"} # bbawk prints fail; others print 2
#BEGIN { a = 3; if (a = 4 || a == 2) print "a: " a } # all print 1
#BEGIN { a = 3; if (a = 4 && a == 3) print "a: " a } # all print 1

#BEGIN { a = 3; b = 5; if (a < b = a-1); print "b:", b} # all print 2 except bbawk prints 5

#BEGIN { a = 3; b = 5; if (a > (b = a-1)) print "true"; else print "false"; print "b:", b} # all print true,b: 2
#BEGIN { a = 3; b = 5; if (a > b = a-1) print "true"; else print "false"; print "b:", b} # all print true,b: 2 exc bbawk (false,b: 5)
#BEGIN { a = 3; b = 5; if (a < b = a-1) print "true"; else print "false"; print "b:", b} # all print false,b: 2 exc bbawk (false,b: 5)

#BEGIN { a = 3; print a b = 5 } # bbawk prints nothing; others all say syntax error
#BEGIN { a = 3; print a > b = 5; print a, b } # nnawk, gawk say syntax error; others print 3 5
#BEGIN { a = 3; print a + b = 5; print a, b } # bbawk prints '\n3 \n', others syntax error
#BEGIN { a = 3; -b = 5; print a, b } # bbawk prints 3, others syntax error
#BEGIN { a = 3; +b = 5; print a, b } # bbawk prints 3, others syntax error
#BEGIN { a = 3; +(b = 5); print a, b } # all print 3 5
#BEGIN { print (1 < 2 < 3) } # nnawk gawk goawk syntax error; others print 1
#BEGIN { print (1 > 2 < 3) } # nnawk gawk goawk syntax error; others print 1
#BEGIN { print (1 < 2 > 3) } # nnawk gawk goawk syntax error; others print 0

#BEGIN { a = 3; b = 2; print a ^ b = 5; print a, b } # bbawk prints 3 2, others syntax error
#BEGIN { a = 3; b = 7; print ++ b = 5; print a, b } # bbawk prints 3 8 (!!), others syntax error

#BEGIN { a = 1; if (a > 0 && a = 2) print "a: " a; else print "fail"} # bbawk prints fail; others print 2
#BEGIN { a = 1; if (a++ > 0 && a++) print "a: " a; else print "fail"} # all print 3
#BEGIN { a = 1; if (a++ > 0 || a++) print "a: " a; else print "fail"} # all print 2

#BEGIN { a = 1; if (a > 1 || a = 2) print "a: " a; else print "fail"} # bbawk prints fail; others print 2

#BEGIN { a = 1; b = 7; print a > 1 ? b = 8 : b = 9; print b } #nnawk/gawk syntax err at '?'; bbawk "Possible syntax error"; others 8
#BEGIN { a = 1; b = 7; print a < 1 ? b = 8 : b = 9; print b } #nnawk syntax err at '?'; bbawk "Possible syntax error"; others 9
#BEGIN { a = 1; b = 7; print a == 1 ? b = 8 : b = 9; print b } #nnawk syntax err at '?'; bbawk "Possible syntax error"; others 8
#BEGIN { a = 1; b = 7; print a > 1 ? b = 8 : b = 9 } #nnawk/gawk syntax err at '?'; bbawk "Possible syntax error"; others nothing
#BEGIN { a = 1; b = 7; print (1>2)} # all print 0 (all print 1 for print (1<2))
#BEGIN { a = 1; b = 7; print (a > 1 ? b = 8 : b = 9); print b } # bbawk "Possible syntax error"; others 9,9
#BEGIN { a = 1; b = 7; print (a < 1 ? b = 8 : b = 9); print b } # bbawk "Possible syntax error"; others 9,9
BEGIN { a = 1; b = 7; print (a == 1 ? b = 8 : b = 9); print b } # bbawk "Possible syntax error"; others 8,8
