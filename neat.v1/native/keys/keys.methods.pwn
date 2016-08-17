#define these keys // b0
#define These Keys // B0
#define this key
#define This Key

// ----------------------------------------------------------------------

is.emit(player, key, up, down)
{
	new callback[emitter.MaxCallbackLength + 1];
	
	vectors.(gamemode.Classes.Address).each(address, index)
	{
		format(callback, sizeof callback, "%s__@keys", integers.(address).toHexString());

		if (funcidx(callback) < 0)
		{
			continue;
		}

		if (call(callback, "iiiii", player, key, up, down, player.getKeys()))
		{
			return 1;
		}
	}

	return 0;
}

// ----------------------------------------------------------------------

@is.(players).getKeys(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gv.(Players).(Keys, player);
}

@is.(players).isKeyDown(player, key)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return player.getKeys().hasInteger(key);
}

@is.(players).isKeyUp(player, key)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return !player.getKeys().hasInteger(key);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This