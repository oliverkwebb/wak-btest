BEGIN {
    b = 7; b / = 2; print b
    b = 7; b / ^= 2; print b
    b = 7; b / %= 2; print b
    b = 7; b / *= 2; print b
    b = 7; b / += 2; print b
    b = 7; b / -= 2; print b
    #b = 7; b / /= 2; print b # syntax error
}
