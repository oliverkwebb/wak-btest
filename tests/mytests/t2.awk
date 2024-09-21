BEGIN{
    a = 3; b = 7; c = a b; print a, b, c                # 3 7 37
    a = 3; b = 7; c = a+b; print a, b, c                # 3 7 10
    a = 3; b = 7; c = a++b; print a, b, c               # 4 7 37
    a = 3; b = 7; c = (a)++b; print a, b, c             # 3 8 38 (4 7 37 from goawk, bbawk)
    a = 3; b = 7; c = a+++b; print a, b, c              # 4 7 10
    a = 3; b = 7; c = a++++b; print a, b, c             # 4 8 38
    a = 3; b = 7; c = a+++ ++b; print a, b, c           # 4 8 11
    a = 3; b = 7; c = a+++ + ++b; print a, b, c         # 4 8 11
    a = 3; b = 7; c = a+++ + +b; print a, b, c          # 4 7 10
}
