#define these windows // aa
#define These Windows // AA
#define this window
#define This Window

// ----------------------------------------------------------------------

on.response(player, dialogid, response, listitem, inputtext[]) // ответ диалога
{
	new playerWindows = player.getWindows();

	if (vectors.(playerWindows).getLength() == 0)
	{
		return 0;
	}

	new this = vectors.(playerWindows).getLastInteger();
	
	emit(these, #response, Map() \
		.i(this) \
		.i(player) \
		.si(#button, response) \
		.ss(#input, inputtext) \
		.i(listitem) \
		.si(#these.textdraw, -1));

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This