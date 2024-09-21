#BEGIN{a = 3; b = 7; c = a++ +++b;  # This is an error
BEGIN{a = 3; b = 7; c = a+++ ++b;
printf("%s %s %s\n", a,b,c)
}
