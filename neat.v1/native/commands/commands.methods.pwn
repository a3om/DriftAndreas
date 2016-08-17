#define these commands // b1
#define These Commands // B1
#define this command
#define This Command

// ----------------------------------------------------------------------

is.condition(condition) return condition;

is.empty(command[], params[])
{
	if (command[0] == 1 && command[1] == EOS)
	{
		command[0] = EOS;
	}

	if (params[0] == 1 && params[1] == EOS)
	{
		params[0] = EOS;
	}

	return false;
}

is.emit(player, command[], params[])
{
	new callback[emitter.MaxCallbackLength + 1];

	vectors.(gamemode.Classes.Address).each(address, index)
	{
		format(callback, sizeof callback, "%s__@commands", integers.(address).toHexString());

		if (funcidx(callback) < 0)
		{
			continue;
		}

		if (command[0] == EOS)
		{
			command[0] = 1;
			command[1] = EOS;
		}

		if (params[0] == EOS)
		{
			params[0] = 1;
			params[1] = EOS;
		}

		if (call(callback, "iss", player, command, params))
		{
			return 1;
		}
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This