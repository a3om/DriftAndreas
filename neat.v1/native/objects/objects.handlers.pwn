#define these objects
#define These Objects
#define this object
#define This Object

// ----------------------------------------------------------------------

handlers
{
	h2.(players).connect:
	{
		i.player;
		log("Игрок подключился к серверу.. // player = %d", player);
		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This