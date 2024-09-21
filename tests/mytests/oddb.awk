BEGIN { n = 3; 0 ? 3 : n *= 4; print n " ternary" }
BEGIN { n = 3; 1 ? 3 : n *= 4; print n " ternary" }
#BEGIN { n = 3; 0 ? n *= 4 : 3; print n " ternary" }
#BEGIN { n = 3; 1 ? n *= 4 : 3; print n " ternary" }
