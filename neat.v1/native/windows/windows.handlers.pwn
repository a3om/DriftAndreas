#define these windows // aa
#define These Windows // AA
#define this window
#define This Window

// ----------------------------------------------------------------------

handlers
{
	h.(textdraws).click:
	{
		i.player;
		i.textdraw;

		if (textdraw == -1)
		{
			if (@gi.(Players).(DisableTextdrawHandle, player))
			{
				@si.(Players).(DisableTextdrawHandle, player, false);
				return 0;
			}
		}
		
		log("player = %d, textdraw = %d", player, textdraw);

		new playerWindows = player.getWindows();

		if (textdraw == -1)
		{
			if (vectors.(playerWindows).getLength() == 0)
			{
				// log("У игрок нет ни одного открытого окна");
				return 0;
			}

			new this = vectors.(playerWindows).getLastInteger();

			if (!this.isShown()) // если окно скрыто
			{
				return 0;
			}

			emit(these, #response, Map() \
				.i(this) \
				.i(player) \
				.si(#button, 0) \
				.ss(#input, "") \
				.si(#listitem, -1) \
				.si(#these.textdraw, -1));
			
			return 0;
		}

		if (textdraw.getClass() != these.textdraws)
		{
			return 0;
		}

		new this = vectors.(playerWindows).getLastInteger();

		emit(these, #response, Map() \
				.i(this) \
				.i(player) \
				.si(#button, 0) \
				.ss(#input, "") \
				.si(#listitem, -1) \
				.si(#these.textdraw, textdraw.getIndex()));

		return 0;
	}

	h.(these).response:
	{
		i.this;
		i.player;
		i.button;
		s.input[these.MaxInputLength + 1];
		i.listitem;
		i.these.textdraw;

		log("window = %d, player = %d, button = %d, input = %s, listitem = %d, textdraw = %d", this, player, button, input, listitem, these.textdraw);

		new playerWindows = player.getWindows();
		new single = (vectors.(playerWindows).findInteger(this) == 0);
		new these.item = -1, these.row = -1;
		new close = false;

		switch (this.getStyle())
		{
			case these.StyleMessageBox:
			{
				these.item = -1;
				button = these.textdraw > -1 ? 1 : button;
			}
			case these.StylePassword, these.StyleInput:
			{
				these.item = -1;
				button = these.textdraw > -1 ? 1 : button;
				this.setInput(input);
			}
			case these.StyleList:
			{
				if (these.textdraw > -1)
				{
					these.item = -1;
					button = 1;
				}
				else if (!button)
				{
					these.item = -1;
					button = 0;
					close = true;
				}
				else
				{
					new windowItems = this.getItems();

					if (single)
					{
						these.item = (listitem >= 0 && listitem < vectors.(windowItems).getLength()) ? (vectors.(windowItems).getInteger(listitem)) : -1;
					}
					else
					{
						these.item = (listitem >= 1 && listitem <= vectors.(windowItems).getLength()) ? (vectors.(windowItems).getInteger(listitem - 1)) : -1;
					}

					button = (these.item > -1) ? 1 : 0;
				}
			}
			case these.StyleTable:
			{
				if (these.textdraw > -1)
				{
					these.item = -1;
					button = 1;
				}
				else if (!button)
				{
					these.item = -1;
					button = 0;
					close = true;
				}
				else
				{
					new windowRows = this.getRows();

					if (single)
					{
						these.row = (listitem >= 0 && listitem < vectors.(windowRows).getLength()) ? (vectors.(windowRows).getInteger(listitem)) : -1;
					}
					else
					{
						these.row = (listitem >= 1 && listitem <= vectors.(windowRows).getLength()) ? (vectors.(windowRows).getInteger(listitem - 1)) : -1;
					}

					button = (these.row > -1) ? 1 : 0;
				}
			}
		}

		call(this.getCallback(), "iiiiii", this, player, true, button, close, Map() \
			.i(single) \
			.i(these.item) \
			.i(these.textdraw) \
			.i(these.row) \
			.si(#map, this.getData()));

		return 0;
	}

	h.(players).disconnect:
	{
		i.player;

		player.getWindows().each(window, index)
		{
			window.destroy();
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