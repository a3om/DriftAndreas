#define these test3
#define These Test3

// ----------------------------------------------------------------------

dependencies()
{
	d(test2);
	d(test1);
}

initialize()
{
	log("�������������� ����� test2");
	return true;
}

// ----------------------------------------------------------------------

#undef these
#undef These