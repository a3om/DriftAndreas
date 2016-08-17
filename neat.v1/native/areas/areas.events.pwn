#define these areas // b5
#define These Areas // B5
#define this area
#define This Area

// ----------------------------------------------------------------------

on.playerEnter(player, area)
{
	this = fi(Area, area);
	
	if (!this.exists())
	{
		err("Территории не существует");
		return;
	}

	new playerAreas = player.getAreas();

	if (vectors.(playerAreas).hasInteger(area))
	{
		err("Игрок уже находится в территории");
		return;
	}

	vectors.(playerAreas).addInteger(area);
	area.getPlayers().addInteger(player);
	emit(players, #enterArea, M:i(player).i(this));
}

on.playerLeave(player, area)
{
	this = fi(Area, area);
	
	if (!this.exists())
	{
		return;
	}

	new playerAreas = player.getAreas();

	if (!vectors.(playerAreas).hasInteger(area))
	{
		return;
	}

	vectors.(playerAreas).removeInteger(area);
	area.getPlayers().removeInteger(player);
	emit(players, #leaveArea, M:i(player).i(this));
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This