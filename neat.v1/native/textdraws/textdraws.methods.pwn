#define these textdraws // af
#define These Textdraws // AF
#define this textdraw
#define This Textdraw

// ----------------------------------------------------------------------

initialize()
{
	log("Система текстдравов была проинициализирована");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(player, Float:x = 0.0, Float:y = 0.0, text[] = "_", class = -1, index = -1)
{
	new sampTextdraw;

	if (text[0] == EOS)
	{
		sampTextdraw = _:CreatePlayerTextDraw(player, x, y, "_");
	}
	else
	{
		sampTextdraw = _:CreatePlayerTextDraw(player, x, y, text);
	}

	if (sampTextdraw == INVALID_TEXT_DRAW)
	{
		err("Невозможно создать текстдрав");
		return -1;
	}

	new this = create();
	si(Player, player);
	si(SampTextdraw, sampTextdraw);
	sf(X, x);
	sf(Y, y);
	ss(Text, text);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawDestroy(gi(Player), PlayerText:gi(SampTextdraw));
	return destroy();
}

// ----------------------------------------------------------------------

is.setClass(this, class)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	si(Class, class);
	return this;
}

is.getClass(this)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	return gi(Class);
}

is.setIndex(this, index)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	si(Index, index);
	return this;
}

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	return gi(Index);
}

// ----------------------------------------------------------------------

is.setLetterSize(this, Float:x, Float:y)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawLetterSize(gi(Player), PlayerText:gi(SampTextdraw), x, y);
	return this;
}

is.setAlignment(this, alignment)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawAlignment(gi(Player), PlayerText:gi(SampTextdraw), alignment);
	return this;
}

is.setColor(this, color[], alpha = 0xFF)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawColor(gi(Player), PlayerText:gi(SampTextdraw), color.toRGBA(alpha));
	return this;
}

is.useBox(this, use = true)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawUseBox(gi(Player), PlayerText:gi(SampTextdraw), use);
	return this;
}

is.setBoxColor(this, color[], alpha = 0xFF)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawBoxColor(gi(Player), PlayerText:gi(SampTextdraw), color.toRGBA(alpha));
	return this;
}

is.setShadow(this, size)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetShadow(gi(Player), PlayerText:gi(SampTextdraw), size);
	return this;
}

is.setOutline(this, size)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetOutline(gi(Player), PlayerText:gi(SampTextdraw), size);
	return this;
}

is.setBackgroundColor(this, color[], alpha = 0xFF)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawBackgroundColor(gi(Player), PlayerText:gi(SampTextdraw), color.toRGBA(alpha));
	return this;
}

is.setFont(this, font)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawFont(gi(Player), PlayerText:gi(SampTextdraw), font);
	return this;
}

is.setProportional(this, set = true)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetProportional(gi(Player), PlayerText:gi(SampTextdraw), set);
	return this;
}

is.setSelectable(this, set = true)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetSelectable(gi(Player), PlayerText:gi(SampTextdraw), set);
	return this;
}

is.show(this)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawShow(gi(Player), PlayerText:gi(SampTextdraw));
	si(Shown, true);
	return this;
}

is.hide(this)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawHide(gi(Player), PlayerText:gi(SampTextdraw));
	si(Snown, false);
	return this;
}

is.setText(this, text[])
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	ss(Text, text);

	if (text[0] == EOS)
	{
		PlayerTextDrawSetString(gi(Player), PlayerText:gi(SampTextdraw), "_");
	}
	else
	{
		PlayerTextDrawSetString(gi(Player), PlayerText:gi(SampTextdraw), text);
	}
	
	return this;
}

is.setTextSize(this, Float:x, Float:y)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawTextSize(gi(Player), PlayerText:gi(SampTextdraw), x, y);
	return this;
}

is.setPreviewModel(this, model)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetPreviewModel(gi(Player), PlayerText:gi(SampTextdraw), model);
	return this;
}

is.setPreviewRotation(this, Float:rx, Float:ry, Float:rz, Float:zoom = 1.0)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetPreviewRot(gi(Player), PlayerText:gi(SampTextdraw), rx, ry, rz, zoom);
	return this;
}

is.setPreviewColor(this, color1, color2)
{
	if (!this.exists())
	{
		err("Текстдрава не существует");
		return -1;
	}

	PlayerTextDrawSetPreviewVehCol(gi(Player), PlayerText:gi(SampTextdraw), color1, color2);
	return this;
}

// ----------------------------------------------------------------------

@is.(players).enableCursor(player, color[])
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return;
	}
	
	SelectTextDraw(player, color.toRGBA(0xFF));
	log("Включили курсор для игрока // player = %d", player);
}

@is.(players).disableCursor(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return;
	}

	@si.(Players).(DisableTextdrawHandle, player, true);
	CancelSelectTextDraw(player);
	log("Отключили курсор для игрока // player = %d", player);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This