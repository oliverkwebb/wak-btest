# btest, simple test infrastructure for wak

To test all awks, run:

`./runtests.sh; ./makereport.sh`

To tests one awk, run:

`./runtests.sh [awk...]; ./makereport.sh`

You will need:

* goawk
* mawk
* nawk
* gawk
* wak (toybox awk)
* wak linked with musl (as muwak in the path)

All files are under 0BSD unless another LICENSE file exists in their directory
