#define these test3
#define These Test3

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