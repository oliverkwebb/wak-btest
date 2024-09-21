BEGIN {$0="25 200"; print $1<$2; OFS=25; print OFS; print OFS<$2; $1=26; print $0, $1, $2; print OFS; print OFS<$2; print ""}
BEGIN {$0="25 200"; print $1<$2; OFS="25"; print OFS; print OFS<$2; $1=26; print $0, $1, $2; print OFS; print OFS<$2; print ""}
BEGIN {$0="25 200"; print $1<$2; OFS="025"; print OFS; print OFS<$2; $1=24; print $0, $1, $2; print OFS; print OFS<$1}
