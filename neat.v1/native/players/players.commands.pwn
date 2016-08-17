#define these players // ae
#define These Players // AE
#define this player
#define This Player

// ----------------------------------------------------------------------

c(player, command[], params[])
{
	command (#gmx, #restart)
	{
		gamemode.restart();
		return 1;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This