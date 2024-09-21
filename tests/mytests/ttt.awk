BEGIN {
    s = "this is "
    s = "this is %% a test %*.*s of regex"
    s = " a test %*.*s of regex"
    s = " a test %s of regex"
    s = " a test %.*s of regex"
    s = " a test %*.*s of regex"
    s = " a test %**s of regex"
    s = " a test %.*s of regex"
    s = "this is %% a test %*.*s of regex"
    rx = "([^%]|%%)+"
    rx = "([^%]|%%)+[^sdo]*[sdo]"
    rx = "([^%]|%%)*%[^aAdiouxXfFeEgGcs]*[aAdiouxXfFeEgGcs]"
    rx = "([^%]|%%)*%[^*aAdiouxXfFeEgGcs]*[aAdiouxXfFeEgGcs]"
    rx = "[^%]*%[^aAdiouxXfFeEgGcs%]*[aAdiouxXfFeEgGcs]"      # any number of *
    #rx = "[^%]*%[^*aAdiouxXfFeEgGcs%]*[*][^*]*[aAdiouxXfFeEgGcs%]"      # one *
    #rx = "[^%]*%[^*aAdiouxXfFeEgGcs%]*[*][^*]*[*][^*]*[aAdiouxXfFeEgGcs%]"      # two *
    rx = "[^%]*%[^*aAdiouxXfFeEgGcs%]*[aAdiouxXfFeEgGcs]"      # no *
    rx = "[^%]*%[^*aAdiouxXfFeEgGcs%]*[*][^*aAdiouxXfFeEgGcs%]*[*][^*aAdiouxXfFeEgGcs%]*[aAdiouxXfFeEgGcs]"      # two *
    rx = "[^%]*%[^*aAdiouxXfFeEgGcs%]*[*][^*aAdiouxXfFeEgGcs%]*[aAdiouxXfFeEgGcs]"      # one *
    rx = "[^%]*%%"      # 
    print match(s, rx), RSTART, RLENGTH, "<" substr(s, RSTART, RLENGTH) ">"
}
