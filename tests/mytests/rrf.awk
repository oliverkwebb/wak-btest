#BEGIN{print "a\\bc"}
BEGIN{print "a\bc" ~ /a\bc/}
BEGIN{print "a\bc" ~ /a\\bc/}
BEGIN{print "a\\bc" ~ /a\\bc/}      # gawk 1
BEGIN{print "a\\bc" ~ /a\\\\bc/}    # gawk 0
