#bbawk fails
BEGIN{$0="1 2"; NF==2 && $0 = $2; print}
