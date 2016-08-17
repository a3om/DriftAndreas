#define these worlds // bd
#define These Worlds // BD
#define this world
#define This World

// ----------------------------------------------------------------------

initialize()
{
	these.Default = World(); // создаем мир по-умолчанию
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create()
{
	new this = create();
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (this == these.Default)
	{
		err("Нельзя удалить мир по-умолчанию");
		return;
	}

	destroy();
}

// ----------------------------------------------------------------------

is.getPlayers(this)
{
	if (!this.exists())
	{
		err("Мира не существует");
		return -1;
	}

	return gv(Players);
}

// ----------------------------------------------------------------------

is.getClass(this)
{
	if (!this.exists())
	{
		err("Мира не существует");
		return -1;
	}

	return gi(Class);
}

is.setClass(this, class)
{
	if (!this.exists())
	{
		err("Мира не существует");
		return -1;
	}

	si(Class, class);
	return this;
}

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Мира не существует");
		return -1;
	}

	return gi(Index);
}

is.setIndex(this, index)
{
	if (!this.exists())
	{
		err("Мира не существует");
		return -1;
	}

	si(Index, index);
	return this;
}

// ----------------------------------------------------------------------

@is.(players).getWorld(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(World, player);
}

@is.(players).hasWorld(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return player.getWorld() > -1;
}

@is.(players).setWorld(player, world)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	@si.(Players).(World, player, world);
	return player;
}

@is.(players).moveToWorld(player, world)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (!world.exists())
	{
		err("Мира не существует");
		return player;
	}

	new world1 = player.getWorld();

	if (world1.exists())
	{
		if (world1 == world)
		{
			return player;
		}

		world1.getPlayers().removeInteger(player);
		emit(players, #leaveWorld, M:i(player).si(#world, world1));
	}

	SetPlayerVirtualWorld(player, world);
	player.setWorld(world);
	world.getPlayers().addInteger(player);
	emit(players, #enterWorld, M:i(player).si(#world, world));

	if (world1.exists())
	{
		emit(players, #changeWorld, M:i(player).si(#world0, world1).si(#world1, world));
	}

	return player;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This