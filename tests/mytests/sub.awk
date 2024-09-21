BEGIN { $0 = "xcdey" }
BEGIN {s = "abcdef1g"; k = sub(/cde/, "foo&bar", s); print s;print k}
BEGIN {s = "abcdef1g"; k = sub(/cde/+0, "foo&bar", s); print s;print k}
BEGIN {s = "abcdef1g"; k = sub(/cde/ "", "foo&bar", s); print s;print k}
