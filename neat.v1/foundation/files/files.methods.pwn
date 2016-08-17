#define these files // c2
#define These Files // C2
#define this file
#define This File

// ----------------------------------------------------------------------

is.open(path[])
{
	return _:fopen(path);
}

is.readLine(this, string[], stringSize = sizeof string)
{
	return fread(File:this, string, stringSize);
}

is.write(this, string[])
{
	fwrite(File:this, string);
	return this;
}

is.writeLine(this, string[])
{
	format(these.Buffer, sizeof these.Buffer, "%s\r\n", string);
	fwrite(File:this, these.Buffer);
	return this;
}

is.close(this)
{
	return fclose(File:this);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This