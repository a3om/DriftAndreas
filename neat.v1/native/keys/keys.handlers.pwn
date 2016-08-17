#define these keys // b0
#define These Keys // B0
#define this key
#define This Key

// ----------------------------------------------------------------------

handlers
{
	h.(players).update:
	{
		i.player;
		new playerKeys = player.getKeys();
		new newkeys, updown, leftright;
		GetPlayerKeys(player, newkeys, updown, leftright);

		for (new this = 0; this < these.Max; ++this)
		{
			if ((newkeys >> key) & 1 == 0)
			{
				if (!vectors.(playerKeys).hasInteger(key))
				{
					continue;
				}

				vectors.(playerKeys).removeInteger(key);
				these.emit(player, key, true, false);
				continue;
			}
			
			if (vectors.(playerKeys).hasInteger(key))
			{
				continue;
			}
			
			vectors.(playerKeys).addInteger(key);
			these.emit(player, key, false, true);
		}

		switch(updown)
		{
			case KEY_UP:
			{
				if (!vectors.(playerKeys).hasInteger(keys.Up))
				{
					vectors.(playerKeys).addInteger(keys.Up);
					these.emit(player, keys.Up, false, true);
				}

				if (vectors.(playerKeys).hasInteger(keys.Down))
				{
					vectors.(playerKeys).removeInteger(keys.Down);
					these.emit(player, keys.Down, true, false);
				}
			}
			case KEY_DOWN:
			{
				if (!vectors.(playerKeys).hasInteger(keys.Down))
				{
					vectors.(playerKeys).addInteger(keys.Down);
					these.emit(player, keys.Down, false, true);
				}

				if (vectors.(playerKeys).hasInteger(keys.Up))
				{
					vectors.(playerKeys).removeInteger(keys.Up);
					these.emit(player, keys.Up, true, false);
				}
			}
			default:
			{
				if (vectors.(playerKeys).hasInteger(keys.Up))
				{
					vectors.(playerKeys).removeInteger(keys.Up);
					these.emit(player, keys.Down, true, false);
				}

				if (vectors.(playerKeys).hasInteger(keys.Down))
				{
					vectors.(playerKeys).removeInteger(keys.Down);
					these.emit(player, keys.Up, true, false);
				}
			}
		}
		
		switch(leftright)
		{
			case KEY_LEFT:
			{
				if (!vectors.(playerKeys).hasInteger(keys.Left))
				{
					vectors.(playerKeys).addInteger(keys.Left);
					these.emit(player, keys.Left, false, true);
				}

				if (vectors.(playerKeys).hasInteger(keys.Right))
				{
					vectors.(playerKeys).removeInteger(keys.Right);
					these.emit(player, keys.Right, true, false);
				}
			}
			case KEY_RIGHT:
			{
				if (!vectors.(playerKeys).hasInteger(keys.Right))
				{
					vectors.(playerKeys).addInteger(keys.Right);
					these.emit(player, keys.Right, false, true);
				}

				if (vectors.(playerKeys).hasInteger(keys.Left))
				{
					vectors.(playerKeys).removeInteger(keys.Left);
					these.emit(player, keys.Left, true, false);
				}
			}
			default:
			{
				if (vectors.(playerKeys).hasInteger(keys.Left))
				{
					vectors.(playerKeys).removeInteger(keys.Left);
					these.emit(player, keys.Left, true, false);
				}
				
				if (vectors.(playerKeys).hasInteger(keys.Right))
				{
					vectors.(playerKeys).removeInteger(keys.Right);
					these.emit(player, keys.Right, true, false);
				}
			}
		}

		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This