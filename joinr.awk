# Use: awk -f [This file] pass=1 out/outx-[implementation] pass=0 out/outx-*
/^Test/ && pass { # Get testnames
  if (!($2 in a)) a[$2] = $2;
}
/^Test/ && !pass { # Accumulate Results into CSV list
  a[$2] = a[$2] "," $3;
}
END {for (i in a) print a[i];}
