#input: testname,gawk,nnawk,mawk,goawk,bbawk,tbawk,muwak
BEGIN{FS=","}
{
  if ($NF != $(NF-1)) print > "set_musl"
  else if ($1 ~ /allfail\// && /pass|PASS/) print > "set_badfail"
  else if ($1 ~ /allpass\// && /fail|FAIL/) print > "set_badpass"
  else if ($1 ~ /^tryinok/ && $NF ~ /fail|FAIL/) print > "set_fail"
  else if ($NF == $2 && $NF == $3) print > "set_ok"
  else if ($NF == $2) print > "set_gawk"
  else if ($NF == $3) print > "set_nawk"
  else if ($NF == $4) print > "set_mawk"
  else if ($NF == $5) print > "set_goawk"
  else if ($NF == $6) print > "set_bbawk"
  else print > "set_oops"
}
