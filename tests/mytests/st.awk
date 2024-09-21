BEGIN {
    s = "This is a test"
    k = sub(/.i./, "fo&oba&r", s)
    print k, "(" s ")"
    s = "This is a test"
    k = gsub(/.i./, "fo&oba&r", s)
    print k, "(" s ")"
}
