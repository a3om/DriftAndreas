#define these gamemode // a0
#define These Gamemode // A0

// ----------------------------------------------------------------------

on.initialize()
{
	if (call(#these.@start, ""))
	{
		log("������������� ���� �������� � ������");
		return;
	}

	new errno = mysql.connect();

	if (errno != 0)
	{
		log("�� ������� ������������ � ������� MySQL // errno = %d", errno);
		return;
	}

	SSCANF_Init(MAX_PLAYERS, INVALID_PLAYER_ID, MAX_PLAYER_NAME);
	vectors.initialize();
	maps.initialize();

	/*
		- �������� �������
	*/
	
	if (!these.initialize())
	{
		log("������ �������������");
		return;
	}

	if (call(#these.@end, ""))
	{
		log("������������� ���� �������� � �����");
		return;
	}

	log("������� ���� �������������������");
}

// ----------------------------------------------------------------------

#undef these
#undef These