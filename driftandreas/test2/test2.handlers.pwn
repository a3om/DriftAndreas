#define these test2
#define These Test2

// ----------------------------------------------------------------------

handlers
{
	h.(players).connect:
	{
		i.player;
		log("����� ����������� � �������.. // player = %d", player);
		return 0;
	}

	h.(test0).test:
	{
		log("�������� �������...");
		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These