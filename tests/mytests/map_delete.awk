BEGIN {
    a[1]="2"
    #delete a
    a[3]="4"
    #delete a
    a[5]="6"
    #delete a
    for (e in a) print e, a[e]
    #delete a
    delete a[3]

    print ""
    delete a
    print ""

    for (e in a) print e, "<" a[e] ">"
}

