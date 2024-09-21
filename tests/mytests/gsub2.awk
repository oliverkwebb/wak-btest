#BEGIN { s="fooabcbaradqwercbaz"; n = gsub("a[^c]c", "xy", s); print n, s }
#BEGIN { s="fooabcbaradqwercbaz"; n = gsub("a[^c]*c", "xy", s); print n, s }
#BEGIN { s="fooabcbaradcbaz"; n = gsub("a.c", "xy", s); print n, s }
#BEGIN { s="fooabcbaradcbaz"; n = gsub("a.c", "x&y&z", s); print n, s }
BEGIN { s="fooabcbaradcbaz"; n = gsub("a.c", "x&y&z\&\\\y", s); print n, s }
BEGIN { s="fooabcbaradcbaz"; n = gsub("a.c", "x&y&z\\&\\\y", s); print n, s }
