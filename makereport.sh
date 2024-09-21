#!/usr/bin/env bash

TESTDIR=`pwd`
: "${AWK:=awk}"
mkdir -p "${1:-report}"/raw

$AWK -f joinr.awk pass=1 ${2:-out}/outx-gawk pass=0\
  ${2:-out}/outx-{gawk,nawk,mawk,goawk,bbawk,tbawk,muwak} > "${1:-report}"/raw/unproc
cd ${1:-report}/raw
rm -f set*
$AWK -f $TESTDIR/splitr.awk unproc
wc -l set*
cd ..
for i in $(find raw/ -name "set*"); do
  sort $i | $AWK -f $TESTDIR/cleanr.awk > "$(basename $i)"
done

