BEGIN {RS=""}
#BEGIN {RS="";FS=","}
#{for (i=1;i<NF;i++){print "==", i, "==";printf " <%s>", $i; print ""}}
#{print "==", i, $0, NF; printf "<%s>", $2}
{print "==", NF; print "{" $0 "}"; for(i=1;i<=NF;i++)printf "(%d) <%s>\n", i, $i;print"ENDREC"}
END{print NR, FNR, NF}
