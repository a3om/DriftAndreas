#define these floats // a4
#define These Floats // A4
#define this float
#define This Float

// ----------------------------------------------------------------------

fs.randomRange(Float:min, Float:max)
{
	new Float:result;
	MRandFloatRange(min, max, result);
	return result;
}

is.toString(Float:this)
{
	new string[strings.MaxStringLength + 1];
	format(string, sizeof string, "%f", this);
	return string;
}

fs.print(Float:this)
{
	printf("[flt]\t%f", this);
	return this;
}

is.floor(Float:this)
{
	return floatround(this, floatround_floor);
}

is.ceil(Float:this)
{
	return floatround(this, floatround_ceil);
}

is.round(Float:this)
{
	return floatround(this);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This