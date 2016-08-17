#define these textdraws // af
#define These Textdraws // AF
#define this textdraw
#define This Textdraw

// ----------------------------------------------------------------------

on.click(player, PlayerText:playertextid)
{
	new this = fi(SampTextdraw, _:playertextid);

	if (!this.exists())
	{
		err("Не нашли текстдрав // player = %d, playertextid = %d", player, _:playertextid);
		return;
	}

	log("player = %d, playertextid = %d", player, _:playertextid);
	emit(these, #click, M:i(player).i(this));
}

on.globalClick(player, Text:clickedid)
{
	if (_:clickedid != INVALID_TEXT_DRAW)
	{
		return;
	}

	log("player = %d, clickedid = %d", player, _:clickedid);
	emit(these, #click, M:i(player).si(#this, -1));
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This