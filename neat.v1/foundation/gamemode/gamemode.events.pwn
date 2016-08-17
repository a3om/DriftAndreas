#define these gamemode // a0
#define These Gamemode // A0

// ----------------------------------------------------------------------

on.initialize()
{
	if (call(#these.@start, ""))
	{
		log("Инициализация была прервана в начале");
		return;
	}

	new errno = mysql.connect();

	if (errno != 0)
	{
		log("Не удалось подключиться к серверу MySQL // errno = %d", errno);
		return;
	}

	SSCANF_Init(MAX_PLAYERS, INVALID_PLAYER_ID, MAX_PLAYER_NAME);
	vectors.initialize();
	maps.initialize();

	/*
		- Загрузка система
	*/
	
	if (!these.initialize())
	{
		log("Ошибка инициализации");
		return;
	}

	if (call(#these.@end, ""))
	{
		log("Инициализация была прервана в конце");
		return;
	}

	log("Система была проинициализирована");
}

// ----------------------------------------------------------------------

#undef these
#undef These