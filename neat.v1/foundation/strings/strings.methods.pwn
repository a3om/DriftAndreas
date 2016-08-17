#define these strings
#define These Strings
#define this string
#define This Stirng

// ----------------------------------------------------------------------

is.indexOf(this[], string1[], position = 0, bool:ignoreCase = false)
{
	if (string1.isEmpty())
	{
		return -1;
	}

	while (position < 0)
	{
		position += this.getLength();
	}

	if (position >= this.getLength())
	{
		return -1;
	}

	return strfind(this, string1, ignoreCase, position);
}

is.lastIndexOf(this[], string1[], position = -1)
{
	if (string1.isEmpty())
	{
		return -1;
	}
	
	while (position < 0)
	{
		position += this.getLength();
	}

	if (position >= this.getLength())
	{
		return -1;
	}

	for (new index, i = position; i >= 0; --i)
	{
		index = this.indexOf(string1, i);

		if (index < 0)
		{
			continue;
		}

		return index;
	}

	return -1;
}

is.isEmpty(this[])
{
	return this[0] == EOS;
}

is.getLength(this[])
{
	return strlen(this);
}

is.compire(this[], string1[], ignorecase = true)
{
	new a_length = strlen(this);
	new b_length = strlen(string1);

	if (a_length == 0 || b_length == 0)
	{
		return (a_length > b_length) ? 1 : -1;
	}

	return strcmp(this, string1, bool:ignorecase);
}

is.is(this[], string1[], ignorecase = true)
{
	return this.compire(string1, ignorecase) == 0;
}

is.toLowerCase(string1[])
{
	new this[these.MaxStringLength + 1];

	for (new i = 0, count = strlen(string1); i < count && i < these.MaxStringLength; ++i)
	{
		this[i] = tolower(string1[i]);
	}

	return this;
}

is.toUpperCase(string1[])
{
	new this[these.MaxStringLength + 1];

	for (new i = 0, count = strlen(string1); i < count && i < these.MaxStringLength; ++i)
	{
		this[i] = toupper(string1[i]);
	}

	return this;
}

is.concat(string1[], string2[], string3[] = "", string4[] = "", string5[] = "")
{
	new this[these.MaxStringLength + 1];
	strcat(this, string1);
	strcat(this, string2);

	if (!string3.isEmpty())
	{
		strcat(this, string3);
	}

	if (!string4.isEmpty())
	{
		strcat(this, string4);
	}

	if (!string5.isEmpty())
	{
		strcat(this, string5);
	}

	return this;
}

is.charAt(string1[], index)
{
	new this[these.MaxStringLength + 1];

	if (index < 0 || index >= string1.getLength())
	{
		return this;
	}

	this[0] = string1[index];
	this[1] = EOS;
	return this;
}

is.charCodeAt(string1[], index)
{
	if (index < 0 || index >= string1.getLength())
	{
		return -1;
	}

	return string1[index];
}

is.slice(string1[], begin, end = 0)
{
	new this[these.MaxStringLength + 1];

	if (string1.isEmpty())
	{
		return this;
	}

	while(begin < 0)
	{
		begin += string1.getLength();
	}

	if (begin > string1.getLength())
	{
		return this;
	}

	while(end <= 0)
	{
		end += string1.getLength();
	}

	if (end > string1.getLength())
	{
		end = string1.getLength();
	}

	new tempChar = string1[end];
	string1[end] = EOS;
	strcat(this, string1[begin]);
	string1[end] = tempChar;
	return this;
}

is.substr(string1[], begin, length = 0)
{
	new this[these.MaxStringLength + 1];

	if (string1.isEmpty())
	{
		return this;
	}

	while(begin < 0)
	{
		begin += string1.getLength();
	}

	if (begin > string1.getLength())
	{
		return this;
	}

	strcat(this, string1.slice(begin, (length > 0) ? begin + length : 0));
	return this;
}

is.replace(string1[], string2[], string3[], count = 0, position = 0)
{
	new this[these.MaxStringLength + 1];

	if (string1.isEmpty())
	{
		return this;
	}

	if (string2.isEmpty())
	{
		strcat(this, string1);
		return this;
	}

	while (position < 0)
	{
		position += string1.getLength();
	}

	if (position >= string1.getLength())
	{
		strcat(this, string1);
		return this;
	}

	if (position > 0)
	{
		strcat(this, string1.slice(0, position));
	}

	for (new i = 0; count <= 0 || i < count; ++i)
	{
		new index = string1.indexOf(string2, position);
		
		if (index < 0)
		{
			break;
		}

		strcat(this, string1.slice(position, index));
		position = index;

		if (!string3.isEmpty())
		{
			strcat(this, string3);
		}

		position += string2.getLength();
	}

	strcat(this, string1[position]);
	return this;
}

is.split(string1[], string2[] = "", skipEmptyParts = false)
{
	if (string1.isEmpty())
	{
		return Vector();
	}

	new vector = Vector();

	if (string2.isEmpty())
	{
		for (new i = 0, length = string1.getLength(); i < length; ++i)
		{
			vector.addString(string1.charAt(i), false);
		}

		return vector;
	}

	new position = 0;

	for (;;)
	{
		new index = string1.indexOf(string2, position);
		
		if (index < 0)
		{
			break;
		}

		if (skipEmptyParts && position == index)
		{
			++position;
			continue;
		}

		vector.addString(string1.slice(position, index), false);
		position = index;
		position += string2.getLength();
	}

	vector.addString(string1[position], false);
	return vector;
}

is.clone(this[])
{
	new string1[these.MaxStringLength + 1];
	strcat(string1, this);
	return string1;
}

is.toInteger(this[])
{
	return strval(this);
}

is.containsChars(this[], chars[], chars_size = sizeof chars)
{
	for (new i = 0, length = this.getLength(); i < length; ++i)
	{
		for (new j = 0; j < chars_size; ++j)
		{
			if (this[i] != chars[j])
			{
				continue;
			}

			return true;
		}
	}

	return false;
}

is.print(this[])
{
	printf("[str]\t%s", this);
}

is.copyFrom(this[], string1[], this_size = sizeof this)
{
	this[0] = EOS;
	strcat(this, string1, this_size);
}

is.makeFromRepeatingChar(c, repeatCount)
{
	new this[these.MaxStringLength + 1];

	if (repeatCount > these.MaxStringLength)
	{
		repeatCount = these.MaxStringLength;
	}

	for (new i = 0; i < repeatCount; ++i)
	{
		this[i] = c;
	}

	return this;
}

#if defined _regex_included

is.test(this[], expression[])
{
	return regex_match(this, expression);
}

#endif

is.trim(this[])
{
	new string0[these.MaxStringLength + 1];
	new length = strlen(this);
	new b = 0, e = length - 1;

	for ( ; b < length; ++b)
	{
		switch (this[b])
		{
			case ' ', '\t', '\n', '\r':
			{
				continue;
			}
		}

		break;
	}

	for ( ; e >= 0; --e)
	{
		switch (this[e])
		{
			case ' ', '\t', '\n', '\r':
			{
				continue;
			}
		}

		break;
	}

	new t = this[e + 1];
	this[e + 1] = EOS;
	strcat(string0, this[b]);
	this[e + 1] = t;
	return string0;
}

is.hexify(this[], count = 4)
{
	new length = floor(this.length() / count);
	new vector = Vector();

	for (new i = 0; i < length; ++i)
	{
		new integer;
		new t = this[i * count + count];
		this[i * count + count] = EOS;
		sscanf(this[i * count], "h", integer);
		vector.addInteger(integer, false);
		this[i * count + count] = t;
	}

	return vector;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This