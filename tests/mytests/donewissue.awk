function do_new_issue()
{
	Last_number = Number
	if (HTML)
	{
		if (Last_volume != Volume)
		{
			Last_volume = Volume
			print_line(prefix(2) "<BR>")
		}
		html_end_toc()
		html_begin_issue()
        print "foo"
		print_line(prefix(2) Journal "<BR>")
        print "bar"
	}
	else
	{
		print_line("")
		print_line(Journal)
	}

	print_line(strip_html(vol_no_month_year()))

	if (HTML)
	{
		html_end_issue()
		html_toc_entry()
		html_begin_toc()
	}
	else
		print_line("")
}
