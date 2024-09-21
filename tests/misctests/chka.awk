!/^Test/ {next}
length($0) < 78 {next}
substr($0, 31, 8) == substr($0, 39, 8) {next}
#{print substr($0, 71, 8)}
#substr($0, 71, 8) != substr($0, 31, 8) && substr($0, 71, 8) != substr($0, 39, 8) {next}
substr($0, 71, 8) != nnawk && substr($0, 71, 8) != GAWK {next}
#{print substr($0, 71, 8)}
#{print substr($0, 39, 8)}
1
