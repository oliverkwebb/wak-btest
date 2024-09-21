BEGIN {
    a = 123;
    b[4] = 567;
    $8 = 9;
    print a, b[4], $8, NF
    a *= b[4];
    b[4] -= 5;
    $8 += 4;
    print a, b[4], $8, NF
    --a; $8 += b[4]++; $8--;
    print a, b[4], $8, NF
}
