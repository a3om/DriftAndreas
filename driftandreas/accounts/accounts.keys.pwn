#define these accounts // a2
#define These Accounts // A2
#define this account
#define This Account

// ----------------------------------------------------------------------

k(player, key, up, down)
{
	if (up)
	{
		return;
	}
	
	if (player.hasAccount())
	{
		return;
	}

	if (!player.hasWindows())
	{
		return;
	}

	new window = player.getWindows().getLastInteger();

	if (window.isShown())
	{
		return;
	}
	
	player.showWindow();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This