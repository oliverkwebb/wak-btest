BEGIN { }
{ print; if (NR==2) exit 99987 }
END { print NR, "end!"; exit 47 }
