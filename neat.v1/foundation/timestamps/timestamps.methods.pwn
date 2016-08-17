#define these timestamps // b3
#define These Timestamps // B3
#define this timestamp
#define This Timestamp

// ----------------------------------------------------------------------

is.create(this = -1)
{
	if (this < 0)
	{
		return gettime();
	}

	return this;
}

is.toString(this, _format[] = "")
{
	new string[strings.MaxStringLength + 1];

	if (_format[0] == EOS)
	{
		return integers.(this).toString();
	}

	string.copyFrom(mysql.timestampFormat(this, _format));
	return string;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This