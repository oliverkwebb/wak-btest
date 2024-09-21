# Test compare empty field to numeric. $1 s/b uninit value and should compare low (as string compare)?
#BEGIN { FS="\t"; $0="\t\t"; print NF, ($1 < 10), ($1 < -10), ($1 "" < -10), ($1+0 < -10) }
BEGIN { FS="\t"; $0="\t\t"; print NF, ($1 < 10), ($1 "" < 10), ($1+0 < 10), ($1 < -10), ($1 "" < -10), ($1+0 < -10) }


# BEGIN { FS="\t"; $0="\t\t"; print NF
# print ($1 < 10)
# print ($1 "" < 10)
# print ($1+0 < 10)
# print ($1 < -10)
# print ($1 "" < -10)
# print ($1+0 < -10) }
