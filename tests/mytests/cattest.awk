# nawk is OK with these:
BEGIN { print "b == b", ("b" == "b")  }
BEGIN { print "b != b", ("b" != "b")  }
BEGIN { print "b <  b", ("b" <  "b")  }
BEGIN { print "b <= b", ("b" <= "b")  }
BEGIN { print "b >  b", ("b" >  "b")  } # mawk accepts through this line
BEGIN { print "b >= b", ("b" >= "b")  } # gawk accepts through this line


# WARNING: overwrites any file named b
# nawk rejects all these:
BEGIN { print "b == b", "b" == "b"  }
BEGIN { print "b != b", "b" != "b"  }
BEGIN { print "b <  b", "b" <  "b"  }
BEGIN { print "b <= b", "b" <= "b"  }
BEGIN { print "b >  b", "b" >  "b"  } # mawk accepts through this line
#BEGIN { print "b >= b", "b" >= "b"  } # gawk accepts through this line
# nawk rejects all above

BEGIN { print "ac" < "a"  }
BEGIN { print "ac" < "a" "b" }
BEGIN { print "ac" < "a" "d" }

#BEGIN { print "ac" >= "a"  }
#BEGIN { print "ac" >= "a" "b" }
#BEGIN { print "ac" >= "a" "d" }

#BEGIN { print "ac" > "a"  }
#BEGIN { print "ac" > "a" "b" }
#BEGIN { print "ac" > "a" "d" }
