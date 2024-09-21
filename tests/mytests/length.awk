BEGIN {
    s = "123"
    $0 = " \t \t\t    a  \t b c\td\t  "
    print NF
    for (i=1; i<=NF; i++) printf "%d (%s)\n", i, $i
    FS = "[ \t]+"
    $0 = " \t \t\t    a  \t b c\td\t  "
    print NF
    for (i=1; i<=NF; i++) printf "%d (%s)\n", i, $i
    print length
    print length()
    print length($0)
    print length(s)
}
