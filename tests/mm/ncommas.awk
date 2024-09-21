BEGIN {
    if(x) x=0+"123"
	printf("%'d\n",123456789)
	printf("%'f\n",123456789)
    if(e)for (e in ENVIRON) { printf "%s=%s\n", e, ENVIRON[e] }
}
