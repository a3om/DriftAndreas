#define these commands // b1
#define These Commands // B1
#define this command
#define This Command

// ----------------------------------------------------------------------

on.command(player, cmdtext[])
{
	new command[128 + 1], params[128 + 1];
	sscanf(cmdtext[1], "s[129]s[129]", command, params);

	if (emit(players, #command, M:i(player).s(command).s(params)))
	{
		return 1;
	}
	
	if (these.emit(player, command, params))
	{
		return 1;
	}

	player.sendMessage(these.NotFoundColor, these.NotFoundText);
	return 1;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This