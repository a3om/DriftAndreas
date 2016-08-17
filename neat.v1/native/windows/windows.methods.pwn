#define these windows // aa
#define These Windows // AA
#define this window
#define This Window

// ----------------------------------------------------------------------

dependencies()
{
	d(players);
}

initialize()
{
	log("Система диалогов была проинициализирована");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(name[], player, map = -1)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new callback[these.MaxCallbackLength + 1];
	format(callback, sizeof callback, "%s@%s", #these., name);

	if (funcidx(callback) < 0)
	{
		err("Не найден шаблон окна");
		return -1;
	}

	new this = create();
	si(Player, player);
	ss(Callback, callback);

	if (map.exists())
	{
		gm(Data).copyFrom(map);
	}

	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return;
	}

	this.destroyItems();
	this.destroyRows();
	this.destroyTextdraws();
	destroy();
}

// ----------------------------------------------------------------------

is.isShown(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return false;
	}

	return gi(Shown);
}

is.show(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	if (this.isShown())
	{
		this.hide();
	}

	new player = this.getPlayer();

	if (this.getStyle() == these.StyleNone)
	{
		si(Shown, true);
		return this;
	}

	new single = player.getWindows().findInteger(this) == 0;

	call(this.getCallback(), "iiiiii", this, player, false, false, false, M:i(single) \
			.si(#these.item,  -1) \
			.si(#these.textdraw,  -1) \
			.si(#these.row,  -1) \
			.si(#map, this.getData()));
	
	new caption[these.MaxCaptionLength + 1];
	format(caption, sizeof caption, "%s %s", these.titlePrefix, this.getTitle());

	switch (this.getStyle())
	{
		case these.StyleInput, these.StyleMessageBox, these.StylePassword:
		{
			this.getTextOut(these.BigString);

			if (these.BigString[0] == EOS)
			{
				format(these.BigString, sizeof these.BigString, "<-- empty text -->");
			}

			ShowPlayerDialog(player, 0, this.getStyle(), caption, these.BigString, this.getButton1(), this.getButton2());
			these.BigString[0] = EOS;
		}
		case these.StyleList:
		{
			this.stringifyItems(these.BigString);

			if (these.BigString[0] == EOS)
			{
				format(these.BigString, sizeof these.BigString, "<-- no items -->");
			}

			ShowPlayerDialog(player, 0, DIALOG_STYLE_TABLIST, caption, these.BigString, this.getButton1(), this.getButton2());
			these.BigString[0] = EOS;
		}
		case these.StyleTable:
		{
			this.stringifyRows(these.BigString);
			new headers = this.getHeaders();
			
			if (vectors.(headers).length())
			{
				format(these.BigString, sizeof these.BigString, "%s\n%s", vectors.(headers).join("\t"), these.BigString);
			}
			else
			{
				format(these.BigString, sizeof these.BigString, "%s\n%s", "no\the\tad\ter\ts", these.BigString);
			}
			
			ShowPlayerDialog(player, 0, DIALOG_STYLE_TABLIST_HEADERS, caption, these.BigString, this.getButton1(), this.getButton2());
			these.BigString[0] = EOS;
		}
	}

	si(Shown, true);
	return this;
}

is.hide(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	new player = this.getPlayer();
	ShowPlayerDialog(player, -1, 0, "_", "_", "_", "");
	this.destroyItems();
	this.destroyRows();
	this.destroyTextdraws();
	this.setText("");
	this.setHeaders(Vector());
	si(Shown, false);
	return this;
}

// ----------------------------------------------------------------------

is.isClicked(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return 0;
	}

	return gi(Clicked);
}

is.setClicked(this, clicked)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	si(Clicked, clicked);
	return this;
}

// ----------------------------------------------------------------------

is.setTitle(this, title[])
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	ss(Title, title);
	return this;
}

is.getTitle(this)
{
	new title[these.MaxTitleLength + 1];

	if (!this.exists())
	{
		err("Окна не существует");
		return title;
	}

	gs(Title, title);
	return title;
}

is.getTitleOut(this, title[], title_size = sizeof title)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	gs(Title, title);
	return this;
}

is.setText(this, text[])
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	ss(Text, text);
	return this;
}

is.getTextOut(this, text[], text_size = sizeof text)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	gs(Text, text, text_size);
	return this;
}

is.setStyle(this, style)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	si(Style, style);
	return this;
}

is.getStyle(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gi(Style);
}

is.setInput(this, input[])
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	ss(Input, input);
	return this;
}

is.getInput(this)
{
	new input[these.MaxInputLength + 1];

	if (!this.exists())
	{
		err("Окна не существует");
		return input;
	}

	gs(Input, input);
	return input;
}

is.getInputOut(this, input[], input_size = sizeof input)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	gs(Input, input);
	return this;
}

is.getCallback(this)
{
	new callback[these.MaxCallbackLength + 1];

	if (!this.exists())
	{
		err("Окна не существует");
		return callback;
	}

	gs(Callback, callback);
	return callback;
}

is.getItems(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gv(Items);
}

is.getRows(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gv(Rows);
}

is.destroyItems(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getItems().each(these.item, index)
	{
		these.item.destroy();
	}

	return this;
}

is.destroyRows(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getRows().each(these.row, index)
	{
		these.row.destroy();
	}

	return this;
}

is.getTextdraws(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gv(Textdraws);
}

is.destroyTextdraws(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getTextdraws().each(these.textdraw, index)
	{
		these.textdraw.destroy();
	}
	
	return this;
}

is.addItem(this, text[], integer = -1, formatter = 0, name[] = "", color[] = these.items.DefaultColor, option[] = "", optionColor[] = "")
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	if (this.getStyle() != these.StyleList)
	{
		this.setStyle(these.StyleList);
	}

	this.Item(text, integer, formatter, name, color, option, optionColor);
	return this;
}

is.addRow(this, data, integer = -1, name[] = "", color[] = these.items.DefaultColor)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	if (this.getStyle() != these.StyleTable)
	{
		this.setStyle(these.StyleTable);
	}

	this.Row(data, integer, name, color);
	return this;
}

is.addTextdraw(this, name[], Float:x = 0.0, Float:y = 0.0, text[] = "_", param = -1)
{
	new textdraw = Textdraw(this.getPlayer(), x, y, text);
	new these.textdraw = these.Textdraw(this, textdraw, name, param);
	textdraw.setClass(these.textdraws).setIndex(these.textdraw);
	return textdraw;
}

is.addLine(this, text[], color[] = these.DefaultLineColor)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getTextOut(these.BigString);

	if (these.BigString[0] != EOS)
	{
		format(these.BigString, sizeof these.BigString, "%s\n", these.BigString);
	}

	format(these.BigString, sizeof these.BigString, "%s{%s}%s", these.BigString, color, text);
	this.setText(these.BigString);
	these.BigString[0] = EOS;
	return this;
}

is.setButton1(this, button[])
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	ss(Button1, button);
	return this;
}

is.getButton1(this)
{
	new button[these.MaxButtonLength + 1];

	if (!this.exists())
	{
		err("Окна не существует");
		return button;
	}

	gs(Button1, button);
	return button;
}

is.setButton2(this, button[])
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	ss(Button2, button);
	return this;
}

is.getButton2(this)
{
	new button[these.MaxButtonLength + 1];

	if (!this.exists())
	{
		err("Окна не существует");
		return button;
	}

	gs(Button2, button);
	return button;
}

is.setButtons(this, button1[], button2[] = "")
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	ss(Button1, button1);
	ss(Button2, button2);
	return this;
}

is.getPlayer(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gi(Player);
}

is.getData(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gi(Data);
}

is.getState(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gi(State);
}

is.setState(this, _state)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	si(State, _state);
	return this;
}

is.stringifyItems(this, string[], string_size = sizeof string)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getItems().foreach(these.item, index)
	{
		if (index != 0)
		{
			format(string, string_size, "%s\n", string);
		}

		new color[these.items.MaxColorLength + 1];
		these.item.getColorOut(color);

		switch (these.item.getFormatter())
		{
			case 2:
			{
				color = "feffb7";
			}
		}

		if (!strings.(color).isEmpty())
		{
			switch (these.item.getFormatter())
			{
				case 0, 1, 3 .. 10:
				{
					format(string, string_size, "%s{%s}", string, color);
				}
			}
		}

		switch (these.item.getFormatter())
		{
			case 1, 3, 4:
			{
				format(string, string_size, "%s› %s", string, these.item.getText());
			}
			case 2:
			{
				format(string, string_size, "%s{fdff6e}»{feffb7} %s", string, these.item.getText());
			}
			case 7:
			{
				format(string, string_size, "%s%d. %s", string, index + 1, these.item.getText());
			}
			default:
			{
				format(string, string_size, "%s%s", string, these.item.getText());
			}
		}

		new option[these.items.MaxOptionLength + 1];
		these.item.getOptionOut(option);

		switch (these.item.getFormatter())
		{
			case 3, 5:
			{
				format(option, sizeof option, "{feea43}Да « {ffffff}Нет{%s}", color);
			}
			case 4, 6:
			{
				format(option, sizeof option, "{ffffff}Да {feea43}» Нет{%s}", color);
			}
		}

		if (option[0] != EOS)
		{
			format(string, string_size, "%s\t", string);

			if (!strings.(color).isEmpty())
			{
				format(string, string_size, "%s{%s}", string, color);
			}

			format(string, string_size, "%s( ", string);
			new optionColor[colors.MaxColorLength + 1];
			these.item.getOptionColorOut(optionColor);

			if (!strings.(optionColor).isEmpty())
			{
				format(string, string_size, "%s{%s}%s ", string, optionColor);
			}

			format(string, string_size, "%s%s ", string, option);

			if (!strings.(color).isEmpty())
			{
				format(string, string_size, "%s{%s}", string, color);
			}

			format(string, string_size, "%s)", string);
		}
		else
		{
			format(string, string_size, "%s\t", string);
		}
	}

	new player = this.getPlayer();
	new windowIndex = player.getWindows().findInteger(this);

	if (windowIndex > 0) // если индекс этого диалога в векторе диалогов игрока больше нуля (то есть есть и ещё нулевой диалог)
	{
		new window0 = player.getWindows().getInteger(windowIndex - 1); // получаем этот диалог

		if (this.getItems().getLength() > 11)
		{
			format(string, string_size, "{ffe400}« {feea43}%s\t\n%s\n{ffe400}« {feea43}%s", window0.getTitle(), string, window0.getTitle());
		}
		else
		{
			format(string, string_size, "{ffe400}« {feea43}%s\t\n%s", window0.getTitle(), string);
		}
	}

	return this;
}

is.setHeaders(this, vector)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getHeaders().copyFrom(vector);
	return this;
}

is.getHeaders(this)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	return gv(Headers);
}

is.stringifyRows(this, string[], string_size = sizeof string)
{
	if (!this.exists())
	{
		err("Окна не существует");
		return -1;
	}

	this.getRows().each(these.row, index)
	{
		if (index != 0)
		{
			format(string, string_size, "%s\n", string);
		}

		new color[these.rows.MaxColorLength + 1];
		these.row.getColorOut(color);

		if (!strings.(color).isEmpty())
		{
			format(string, string_size, "%s{%s}", string, color);
		}

		format(string, string_size, "%s%s", string, these.row.getData().join("\t"));
	}

	new player = this.getPlayer();
	new windowIndex = player.getWindows().findInteger(this);

	if (windowIndex > 0) // если индекс этого диалога в векторе диалогов игрока больше нуля (то есть есть и ещё нулевой диалог)
	{
		new window0 = player.getWindows().getInteger(windowIndex - 1); // получаем этот диалог
		new tapsCount = this.getRows().getInteger(0).(these.rows).getData().length();

		if (this.getItems().getLength() > 11)
		{
			format(string, string_size, "{ffe400}« {feea43}%s%s\n%s\n{ffe400}« {feea43}%s", window0.getTitle(), strings.makeFromRepeatingChar('\t', tapsCount), string, window0.getTitle());
		}
		else
		{
			format(string, string_size, "{ffe400}« {feea43}%s\n%s", window0.getTitle(), string);
		}
	}

	return this;
}

// ----------------------------------------------------------------------

@is.(players).getWindows(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gv.(Players).(Windows, player);
}

@is.(players).hasWindows(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return @gv.(Players).(Windows, player).getLength() > 0;
}

@is.(players).getLastWindow(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new vector = player.getWindows();

	if (vector.length() < 1)
	{
		return -1;
	}

	return vector.getLastInteger();
}

@is.(players).openWindow(player, name[], replace = false, map = -1)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (replace && player.windows().length() > 0)
	{
		player.closeWindow();
	}

	new this = Window(name, player, map);

	if (!this.exists())
	{
		err("Не удалось открыть окно");
		return player;
	}

	log("Открываем окно...");
	player.windows().addInteger(this);
	player.enableCursor(#00ff00);
	this.show();
	return player;
}

@is.(players).showWindow(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	log("Показываем окно...");
	new this = player.windows().lastInteger();
	player.enableCursor(#00ff00);
	this.show();
	return player;
}

@is.(players).hideWindow(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	log("Скрываем окно...");
	new this = player.windows().lastInteger();
	this.hide();
	player.disableCursor();
	return player;
}

@is.(players).closeWindow(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	log("Закрываем окно...");
	new this = player.windows().lastInteger();
	this.destroy();
	player.windows().removeInteger(this);
	ShowPlayerDialog(player, -1, 0, "_", "_", "_", "");
	player.disableCursor();

	if (player.windows().length() > 0)
	{
		player.showWindow();
	}

	return player;
}

@is.(players).closeAllWindows(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new vector = player.windows();

	vector.each(this, i)
	{
		this.destroy();
	}

	vector.clear();
	ShowPlayerDialog(player, -1, 0, "_", "_", "_", "");
	player.disableCursor();
	return player;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these windows.items // ab
#define These windows.Items // AB
#define this windows.item
#define This windows.Item

// ----------------------------------------------------------------------

ip.initialize()
{
	log("Система пунктов диалогов была проинициализирована");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(window, text[], integer = -1, formatter = 0, name[] = "", color[] = these.DefaultColor, option[] = "", optionColor[] = "")
{
	if (!window.exists())
	{
		err("Окна не существует");
		return -1;
	}

	new vector = window.getItems();
	new this = create();
	si(Window, window);
	ss(Text, text);
	si(Index, vector.getLength());
	si(Integer, integer);
	si(Formatter, formatter);
	ss(Name, name);
	ss(Color, color);
	ss(Option, option);
	ss(OptionColor, optionColor);
	vector.addInteger(this);
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return -1;
	}

	this.getWindow().getItems().removeInteger(this);
	return destroy();
}

// ----------------------------------------------------------------------

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return -1;
	}

	return gi(Index);
}

is.getInteger(this)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return -1;
	}

	return gi(Integer);
}

is.getText(this)
{
	new text[these.MaxTextLength + 1];

	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return text;
	}

	gs(Text, text);
	return text;
}

is.getWindow(this)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return -1;
	}

	return gi(Window);
}

is.getFormatter(this)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return -1;
	}

	return gi(Formatter);
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.getColor(this)
{
	new color[these.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return color;
	}

	gs(Color, color);
	return color;
}

is.getColorOut(this, color[], color_size = sizeof color)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return color;
	}

	gs(Color, color, color_size);
	return color;
}

is.getOption(this)
{
	new option[these.MaxOptionLength + 1];

	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return option;
	}

	gs(Option, option);
	return option;
}

is.getOptionOut(this, option[], option_size = sizeof option)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return option;
	}

	gs(Option, option, option_size);
	return option;
}

is.getOptionColor(this)
{
	new color[these.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return color;
	}

	gs(OptionColor, color);
	return color;
}

is.getOptionColorOut(this, color[], color_size = sizeof color)
{
	if (!this.exists())
	{
		err("Пункта диалога не существует");
		return color;
	}

	gs(OptionColor, color, color_size);
	return color;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these windows.textdraws // ac
#define These windows.Textdraws // AC
#define this windows.textdraw
#define This windows.Textdraw

// ----------------------------------------------------------------------

ip.initialize()
{
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(window, textdraw, name[] = these.DefaultName, param = -1)
{
	new this = create();
	si(Window, window);
	si(Textdraw, textdraw);
	ss(Name, name);
	si(Param, param);
	window.getTextdraws().addInteger(this);
	return this;
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Текстдрава окна не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.isName(this, name[])
{
	if (!this.exists())
	{
		err("Текстдрава окна не существует");
		return false;
	}

	return this.getName().is(name);
}

is.getParam(this)
{
	if (!this.exists())
	{
		err("Текстдрава окна не существует");
		return -1;
	}

	return gi(Param);
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Текстдрава окна не существует");
		return -1;
	}

	new textdraw = gi(Textdraw);
	textdraw.destroy();
	new window = gi(Window);
	window.getTextdraws().removeInteger(this);
	return destroy();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these windows.rows // be
#define These windows.Rows // BE
#define this windows.row
#define This windows.Row

// ----------------------------------------------------------------------

ip.initialize()
{
	log("Система строк окон была проинициализирована");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(window, data, integer = -1, name[] = "", color[] = these.DefaultColor)
{
	if (!window.exists())
	{
		err("Окна не существует");
		return -1;
	}

	new vector = window.getRows();
	new this = create();
	si(Window, window);
	gv(Data).copyFrom(data);
	si(Index, vector.getLength());
	si(Integer, integer);
	ss(Name, name);
	ss(Color, color);
	vector.addInteger(this);
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Строки диалога не существует");
		return -1;
	}

	this.getWindow().getRows().removeInteger(this);
	return destroy();
}

// ----------------------------------------------------------------------

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Строки диалога не существует");
		return -1;
	}

	return gi(Index);
}

is.getInteger(this)
{
	if (!this.exists())
	{
		err("Строки диалога не существует");
		return -1;
	}

	return gi(Integer);
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Строки диалога не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.getData(this)
{
	if (!this.exists())
	{
		err("Строки диалога не существует");
		return -1;
	}

	return gv(Data);
}

is.getWindow(this)
{
	if (!this.exists())
	{
		err("Строки диалога не существует");
		return -1;
	}

	return gi(Window);
}

is.getColor(this)
{
	new color[these.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Строки диалога не существует");
		return color;
	}

	gs(Color, color);
	return color;
}

is.getColorOut(this, color[], color_size = sizeof color)
{
	if (!this.exists())
	{
		err("Строки диалога не существует");
		return color;
	}

	gs(Color, color, color_size);
	return color;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This