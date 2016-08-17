#define these test1
#define These Test1

// ----------------------------------------------------------------------

handlers
{
	h.(players).connect:
	{
		i.player;
		log("Игрок подключился к серверу.. // player = %d", player);
		return 0;
	}

	h.(test0).test:
	{
		log("Тестовое событие...");
		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These