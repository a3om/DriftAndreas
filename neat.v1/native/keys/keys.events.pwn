#define these keys // b0
#define These Keys // B0
#define this key
#define This Key

// ----------------------------------------------------------------------

on.stateChange(player, newkeys, oldkeys)
{
	new playerKeys = player.getKeys();

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
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This