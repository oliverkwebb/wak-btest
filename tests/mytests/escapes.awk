BEGIN {
    a = b = \ c =
    a = b = "where\\-for"
    gsub(/\\-/, "(hyphen)", b)
    print a, b
}
