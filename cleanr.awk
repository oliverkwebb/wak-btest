BEGIN {
  FS=","; OFS=" ";
  impl[2] = "gawk"; impl[3] = "nnawk"; impl[4] = "mawk"; impl[5] = "goawk";
  impl[6] = "bbawk"; impl[7] = "tbawk"; impl[8] = "muwak";
}
{
  delete n; delete g
  for (i = 1; i <= NF; i++) if ($i in g) $i = g[$i]; else g[$i] = impl[i]; # backrefer
  setname = $1
  sub("/[^/]*$", "", setname)
  if (oldset != setname) {
    oldset = setname
    printf("\n===\n= %s\n===%s", setname, sprintf("%17s", ""))
    for (i = 2; i <= 8; i++) printf(" %-7s", toupper(impl[i]));
    printf "\n"
  }
  sub(".*/", "", $1) # basename
  printf("%-20s", $1)
  for (i = 2; i <= 8; i++) printf(" %-7s", $i);
  print ""
}
