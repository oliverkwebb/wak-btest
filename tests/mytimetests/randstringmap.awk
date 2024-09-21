function mksym() {
    minlen = 5; maxlen = 11
    minlen = 1; maxlen = 12
    slen = minlen + int((maxlen - minlen + 1) * rand())
    #print slen
    # 62 characters
    s = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    v = ""
    for (k = 0; k < slen; k++)
        v = v substr(s, 1 + int(62*rand()), 1)
    return v

    return "abc"
}
BEGIN {
    nsym = 8388608 + 2;
    nsym = 1024*400
    nsym = 1024*1024
    nsym = 4*1024*1024
    #nsym = 16*1024*1024
    for (i = 0; i < nsym; i++) {
        s = mksym()
        while (s in a)
            s = mksym()
        a[s] = ""
        #print s
    }
}
