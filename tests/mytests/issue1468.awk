BEGIN { FS="[^,]*"; $0 = "x,,y"; 
    for (i=1;i<=NF;i++) print i, "<"$i">"}
