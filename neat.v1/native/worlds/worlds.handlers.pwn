#define these worlds // bd
#define These Worlds // BD
#define this world
#define This World

// ----------------------------------------------------------------------

handlers
{
	h.(players).create:
	{
		i.player;
		player.setWorld(these.Default);
		return 0;
	}

	h.(players).destroy:
	{
		return 0;
	}

	h.(players).enterWorld:
	{
		i.player;
		i.world;
		new string[256];
		string.format("»грок %d вошел в мир %d", player, world);
		log("%s", string);
		player.sendMessage(#00ff00, string);
		return 0;
	}

	h.(players).leaveWorld:
	{
		i.player;
		i.world;
		new string[256];
		string.format("»грок %d вышел из мира %d", player, world);
		log("%s", string);
		player.sendMessage(#00ff00, string);
		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This