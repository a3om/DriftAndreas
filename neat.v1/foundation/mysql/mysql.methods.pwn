#define these mysql // a8
#define These Mysql // A8

// ----------------------------------------------------------------------

is.connect()
{
	mysql_log();
	mysql_connect(these.host, these.login, these.database, these.password);

	if (mysql_errno() == 0)
	{
		mysql_set_charset("cp1251");
	}
	
	return mysql_errno();
}

// ----------------------------------------------------------------------

is.md5(string[])
{
	new md5[32 + 1];
	mysql_escape_string(string, these.BigString);
	format(these.BigString, sizeof these.BigString, "SELECT MD5('%s') AS `md5`", these.BigString);
	mysql_query(1, these.BigString);
	cache_get_row(0, 0, md5);
	these.BigString[0] = EOS;
	return md5;
}

is.timestampFormat(timestamp, _format[])
{
	new result[128];
	format(these.BigString, sizeof these.BigString, "SELECT DATE_FORMAT(FROM_UNIXTIME(%d), '%s') AS `result`", timestamp, _format);
	mysql_query(1, these.BigString);
	cache_get_row(0, 0, result);
	these.BigString[0] = EOS;
	return result;
}

is.query(query[])
{
	if (these.debug)
	{
		printf("[sql]\t%s", query);
	}

	return _:mysql_query(1, query);
}

// ----------------------------------------------------------------------

#undef these
#undef These