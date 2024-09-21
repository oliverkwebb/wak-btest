# Demonstrate that OTA (nawk) imputes a ';' before a '}'.
# mawk also works; others fail to parse.
BEGIN { {for (;i<42;i++);} print i } # OK
BEGIN { {for (;i<42;i++) } print i } # Note no ';' after for(...)
