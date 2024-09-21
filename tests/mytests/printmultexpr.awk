# bbawk and goawk print 1 2; others reject
BEGIN { a[1,2] = 3; print ((1,2)) }
