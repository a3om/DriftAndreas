#define these integers // a3
#define These Integers // A3
#define this integer
#define This Integer

// ----------------------------------------------------------------------

is.toString(this)
{
	new string[strings.MaxStringLength + 1];
	format(string, sizeof string, "%d", this);
	return string;
}

is.toHexString(this)
{
	new string[strings.MaxHexStringLength + 1];
	format(string, sizeof string, "%h", this);

	for (new i = 0, count = strlen(string); i < count; ++i)
	{
		string[i] = tolower(string[i]);
	}
	
	return string;
}

is.print(this)
{
	printf("[int]\t%d", this);
	return this;
}

ip.isEven(this)
{
	return this % 2 == 0;
}

is.parsePositiveFromString(string[], &integer, maxRank = -1)
{
	integer = 0;
	new count = 0;

	for (new i = 0; string[i] != EOS && (maxRank < 0 || count < maxRank); ++i)
	{
		if (string[i] >= '0' && string[i] <= '9')
		{
			integer = integer * 10 + (string[i] - '0');
			++count;
			continue;
		}

		return count;
	}

	return count;
}

is.swap(&this, &integer0)
{
	new temp = this;
	this = integer0;
	integer0 = temp;
	return this;
}

// ----------------------------------------------------------------------

is.random(max)
{
	return MRandom(max);
}

is.randomRange(min, max)
{
	return MRandRange(min, max);
}

// ----------------------------------------------------------------------

@is.(strings).isNumeric(string[])
{
	if (string[0] == EOS)
	{
		return false;
	}

	new i = 0;

	if (string[0] == '-')
	{
		++i;
	}

	for ( ; string[i] != EOS; ++i)
	{
		if (string[i] >= '0' && string[i] <= '9')
		{
			continue;
		}

		return false;
	}

	return true;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This