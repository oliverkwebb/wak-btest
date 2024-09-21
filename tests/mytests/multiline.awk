BEGIN {RS=""}
#{for (i=1;i<NF;i++){print "==", i, "==";printf " <%s>", $i; print ""}}
#{print "==", i, $0, NF; printf "<%s>", $2}
{print "==", i, NF; for(i=1;i<=NF;i++)printf "<%s>", $i;print""}
