#define these chat // bf
#define These Chat // BF

// ----------------------------------------------------------------------

on.text(player, text[])
{
	if (!player.exists())
	{
		return 0;
	}

	chat.replaceExpressSymbols(text);

	if (chat.isEmpty(text))
	{
		return 0;
	}

	if (emit(players, #text, M:i(player).s(text), .breakable = true, .inverse = true))
	{
		return 0;
	}

	new string0[players.MaxNameLength + 1 + 3 + 1 + 1];
	string0.format("%s(%d)", player.getName(), player);

	new map = Map() \
		.ss(#titleColor, player.getColor()) \
		.ss(#title, string0) \
		.ss(#textColor, #ffffff) \
		.s(text) \
		.si(#receivers, players.existent());

	emit(players, #chat, M:i(player).i(map), .breakable = true, .inverse = true);
	new vector = map.gi(#receivers);

	if (!vector.exists())
	{
		err("Вектора получателей не существует");
		return 0;
	}

	if (vector.length() == 0)
	{
		return 0;
	}

	if (chat.isEmpty(map.gs(#text)))
	{
		return 0;
	}

	new string1[128 + 1 + 1 + 8 + 2240 + 1];
	string1.format("%s: {ffffff}%s", map.gs(#title), map.gs(#text));
	new notFoundPlayer = these.format(string1, map.gs(#textColor));

	if (notFoundPlayer > -1)
	{
		new string2[128];
		string2.format("Игрока с ID: %d нет в игре", notFoundPlayer);
		player.sendServerMessage(colors.Warning, string2);
		return 0;
	}

	new countOfPortions = these.sever(string1, map.gs(#titleColor));

	for(new i = 0, c, l = 0; ; ++i)
	{
		c = string1[l];
		++l;
		
		while (string1[l] == ' ')
		{
			++l;
		}
		
		vector.each(player1, index)
		{
			SendClientMessage(player1, c, string1[l]);
		}

		if(i >= countOfPortions)
		{
			break;
		}
		
		l += strlen(string1[l]) + 1;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These