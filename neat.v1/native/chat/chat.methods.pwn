#define these chat // bf
#define These Chat // BF

// ----------------------------------------------------------------------

is.replaceExpressSymbols(text[])
{
	for (new i = 0; text[i] != EOS; ++i)
	{
		if (text[i] > 0 && text[i] <= 32 || text[i] == 152)
		{
			text[i] = ' ';
		}
	}
}

is.isEmpty(text[])
{
	for (new i = 0; text[i] != EOS; ++i)
	{
		if (text[i] == ' ')
		{
			continue;
		}

		return false;
	}

	return true;
}

is.sever(text[], color[], size = sizeof text)
{
	if (!color.isValid())
	{
		err("Неправильный цвет");
		return 0;
	}

	new countOfPortions = 0, length = strlen(text);
	strins(text, " ", 0, size);
	text[0] = color.toRGBA(0xFF);
	
	if (text[1] == '{' && (8 < length) && text[8] == '}')
	{
		text[8] = EOS;

		if (colors.isValid(text[1]))
		{
			text[0] = colors.toRGBA(text[1], 0xFF);
		}

		text[8] = '}';
		strdel(text[1], 0, 8);
		length -= 8;
	}

	new countOfChars = 0;
	new countOfSymbols = 0;
	new lastSpaceChar = -1;
	new lastColor = text[0];

	for (new i = 1; i < length; )
	{
		switch (text[i])
		{
			case '{':
			{
				if (i + 7 >= length || text[i + 7] != '}')
				{
					++countOfChars;
					++countOfSymbols;
					++i;
					continue;
				}

				text[i + 7] = EOS;

				if (!colors.isValid(text[i + 1]))
				{
					text[i + 7] = '}';
					++countOfChars;
					++countOfSymbols;
					++i;
					continue;
				}

				lastColor = colors.(text[i + 1]).toRGBA(0xFF);
				++countOfChars;

				if (countOfChars > 144)
				{
					text[i] = EOS;
					text[i + 1] = lastColor;

					for (new j = i + 2, z = 2; z < 8; ++j, ++z)
					{
						text[j] = ' ';
					}

					countOfChars = 0;
					countOfSymbols = 0;
					lastSpaceChar = -1;
					++countOfPortions;
					i += 8;
					continue;
				}

				text[i + 7] = '}';
				i += 8;
				continue;
			}
			case ' ':
			{
				lastSpaceChar = i;
			}
			case '\n':
			{
				lastSpaceChar = i;
				countOfSymbols = 128;
			}
		}

		++countOfChars;
		++countOfSymbols;

		if (countOfSymbols > 128)
		{
			if (lastSpaceChar > -1 && i - lastSpaceChar <= 32)
			{
				text[lastSpaceChar] = EOS;
				// log("lastSpaceChar = %d, size = %d", lastSpaceChar, size - lastSpaceChar);
				strins(text[lastSpaceChar + 1], "?", 0, size - lastSpaceChar - 1);
				length += 1;
				text[lastSpaceChar + 1] = lastColor;
				countOfChars = 0;
				countOfSymbols = 0;
				i = lastSpaceChar + 2;
				lastSpaceChar = -1;
				++countOfPortions;
				continue;
			}

			// log("i = %d, countOfSymbols = %d", i, countOfSymbols);
			strins(text[i], "??", 0, size - i);
			length += 2;
			text[i] = EOS;
			text[i + 1] = lastColor;
			countOfChars = 0;
			countOfSymbols = 0;
			i += 2;
			lastSpaceChar = -1;
			++countOfPortions;
			continue;
		}

		if (countOfChars > 144)
		{
			if (lastSpaceChar > -1 && i - lastSpaceChar <= 36)
			{
				text[lastSpaceChar] = EOS;
				strins(text[lastSpaceChar + 1], "?", 0, size - lastSpaceChar - 1);
				length += 1;
				text[lastSpaceChar + 1] = lastColor;
				countOfChars = 0;
				countOfSymbols = 0;
				i = lastSpaceChar + 2;
				lastSpaceChar = -1;
				++countOfPortions;
				continue;
			}

			strins(text[i], "??", 0, size - i);
			length += 2;
			text[i] = EOS;
			text[i + 1] = lastColor;
			countOfChars = 0;
			countOfSymbols = 0;
			i += 2;
			lastSpaceChar = -1;
			++countOfPortions;
			continue;
		}

		++i;
	}

	return countOfPortions;
}

is.format(text[], color[], size = sizeof text)
{
	new notFoundPlayer = chat.addPlayers(text, color, size);

	if (notFoundPlayer > -1)
	{
		return notFoundPlayer;
	}

	chat.livenUpPercentChars(text, size);
	chat.replaceSpaceChars(text);
	chat.removeExpressColors(text);
	chat.removeExpressSpaces(text);
	chat.removeSideSpaces(text);
	chat.removeSideColor(text);
	chat.removeSideSpaces(text);
	chat.removeDoubleColors(text);
	return -1;
}

is.addPlayers(text[], color[], size = sizeof text)
{
	new map = Map();

	for (new string[8 + players.MaxNameLength + 1 + 3 + 1 + 1], i = strfind(text, "#", false, 0); i > -1; i = strfind(text, "#", false, i))
	{
		new player;
		new count = integers.parsePositiveFromString(text[i + 1], player);

		if (count < 1)
		{
			i += 1;
			continue;
		}

		if (!player.exists())
		{
			i += (1 + count);
			return player;
		}

		map.ss(#name, player.getName());
		map.ss(#color, player.getColor());
		emit(chat, #interlocutor, M:i(player).i(map), .breakable = true);
		string.format("{%s}%s(%d){%s}", map.gs(#color), map.gs(#name), player, color);
		strdel(text, i, i + 1 + count);
		strins(text, string, i, size);
		i += string.length();
	}

	return -1;
}

is.livenUpPercentChars(text[], size = sizeof text)
{
	for (new i = strfind(text, "#", false, 0); i > -1; i = strfind(text, "#", false, i))
	{
		text[i] = '%';
		strins(text, "%", i + 1, size);
		i += 2;
	}
}

is.replaceSpaceChars(text[])
{
	new chars[] = {'\t', '\n', '\r'};
	new substring[] = {'?', EOS};

	for (new c = 0, count = sizeof chars; c < count; ++c)
	{
		substring[0] = chars[c];

		for (new i = strfind(text, substring, false, 0); i > -1; i = strfind(text, substring, false, i))
		{
			text[i] = ' ';
			++i;
		}
	}
}

is.removeExpressSpaces(text[])
{
	for (new i = strfind(text, " ", false, 0); i > -1; i = strfind(text, " ", false, i))
	{
		new lastSpace = i;

		for (new j = i + 1; text[j] == ' '; ++j)
		{
			lastSpace = j;
		}

		if (lastSpace == i)
		{
			i += 2;
			continue;
		}

		strdel(text, i, lastSpace);
		i += 2;
	}
}

is.removeSideSpaces(text[])
{
	if (text[0] == ' ')
	{
		strdel(text, 0, 1);
	}

	new length = strlen(text);

	if (text[length - 1] == ' ')
	{
		text[length - 1] = EOS;
	}
}

// функция добавления ников игроков с цветами вместо %ID
// ?

// функция поиска цвета в тексте

is.findColor(text[], offset = 0)
{
	new length = strlen(text);

	for (new i = strfind(text, "{", false, offset); i > -1; i = strfind(text, "{", false, i))
	{
		if (i + 7 > length)
		{
			break;
		}

		if (text[i + 7] != '}')
		{
			i += 1;
			continue;
		}

		text[i + 7] = EOS;
		
		if (!colors.isValid(text[i + 1]))
		{
			text[i + 7] = '}';
			i += 1;
			continue;
		}

		text[i + 7] = '}';
		return i;
	}

	return -1;
}

// функция перенесения цветов через пробел вправо, если таковой имеется

is.removeExpressColors(text[])
{
	for (new i = these.findColor(text, 0); i > -1; )
	{
		if (text[i + 8] == ' ') // сдвигаем цвет вправо через пробелы до упора
		{
			new countOfSpaces = 1;

			for (new j = i + 9; text[j] == ' '; ++j)
			{
				++countOfSpaces;
			}

			for (new s = i + 7, d = s + countOfSpaces; s >= i; --s, --d)
			{
				text[d] = text[s];
			}

			for (new c = i, j = 0; j < countOfSpaces; ++j, ++c)
			{
				text[c] = ' ';
			}

			i += countOfSpaces;
		}

		new r = these.findColor(text, i + 8);

		if (r < 0)
		{
			break;
		}

		if (r > i + 8)
		{
			i = r;
			continue;
		}

		strdel(text, i, i + 8);
		// i = these.findColor(text, i)
	}
}

is.removeSideColor(text[])
{
	new length = strlen(text);

	if (length < 8)
	{
		return;
	}

	new lastChar = length - 1;

	if (text[lastChar - 7] != '{')
	{
		return;
	}

	if (text[lastChar] != '}')
	{
		return;
	}

	new t = text[lastChar];
	text[lastChar] = EOS;

	if (!colors.isValid(text[lastChar - 6]))
	{
		text[lastChar] = t;
		return;
	}

	text[length - 8] = EOS;
}

is.removeDoubleColors(text[])
{
	for (new i = these.findColor(text, 0); i > -1; )
	{
		new j = these.findColor(text, i + 8);

		if (j < 0)
		{
			break;
		}

		text[i + 7] = EOS;
		text[j + 7] = EOS;

		if (!colors.is(text[i + 1], text[j + 1]))
		{
			text[i + 7] = '}';
			text[j + 7] = '}';
			i = j;
			continue;
		}

		text[i + 7] = '}';
		text[j + 7] = '}';
		strdel(text, j, j + 8);
	}
}

// ----------------------------------------------------------------------

#undef these
#undef These