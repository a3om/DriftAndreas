#define these players // ae
#define These Players // AE
#define this player
#define This Player


// ----------------------------------------------------------------------

initialize()
{
	log("Инициализируем класс players");
	// setInterval(#these.timer1Second, 800, "");
	return true;
}

// ----------------------------------------------------------------------

// ip.timer1Second()
// {
// 	new timestamp = Timestamp();

// 	existent().each(this, i)
// 	{
// 		if (this.hasAccount())
// 		{
// 			continue;
// 		}
		
// 		if (timestamp - this.getConnectedAt() < these.MaxLoggedOutConnectionTime)
// 		{
// 			new string[64];
// 			format(string, sizeof string, "%d", these.MaxLoggedOutConnectionTime - (timestamp - this.getConnectedAt()) - 1);
// 			this.getConnectionLimitInformer().text(string);
// 			continue;
// 		}

// 		// this.disconnect();
// 	}
// }

// ----------------------------------------------------------------------

@foundation;

is.create(this, name[], skin = 0)
{
	this = create(this);
	new color[colors.MaxColorLength + 1];
	color = colors.random(true);
	ss(Name, name);
	ss(Color, color);
	si(Position, Position(.name = "player position"));
	si(Skin, skin);
	SetPlayerColor(player, color.toRGBA(0xFF));
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return;
	}

	gi(Position).(positions).destroy();
	destroy();
}

// ----------------------------------------------------------------------

is.getConnectedAt(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return 0;
	}

	return gi(ConnectedAt);
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Игрока не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.setName(this, name[])
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new player0 = these.findByName(name);

	if (player0.exists() && player0 != this)
	{
		err("Игрок с таким ником уже существует");
		return this;
	}

	SetPlayerName(this, name);
	ss(Name, name);
	return this;
}

is.findByName(name[])
{
	if (strings.(name).isEmpty())
	{
		return -1;
	}

	existent().each(this, i)
	{
		if (!this.getName().is(name))
		{
			continue;
		}

		return this;
	}

	return -1;
}

is.disconnect(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	Kick(this);
	return this;
}

is.getPosition(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new position = gi(Position);

	if (!this.isSpawned())
	{
		return position;
	}

	if (emit(players, #getPosition, Map().i(player).i(position)))
	{
		return position;
	}
	
	new Float:x, Float:y, Float:z, Float:r;
	GetPlayerPos(this, x, y, z);
	GetPlayerFacingAngle(this, r);
	position.setXYZR(x, y, z, r);
	return position;
}

is.setPosition(this, position)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	this.getPosition().copyFrom(position);

	if (!this.isSpawned())
	{
		return this;
	}

	new Float:x, Float:y, Float:z, Float:r;
	position.getXYZR(x, y, z, r);
	SetPlayerPos(this, x, y, z);
	SetPlayerFacingAngle(this, r);
	return this;
}

is.setSpawnInfo(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:r;
	this.getPosition().getXYZR(x, y, z, r);
	SetSpawnInfo(this, 0, this.getSkin(), x, y, z, r, 0, 0, 0, 0, 0, 0);
	return this;
}

is.toggleSpectating(this, toggle)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (toggle)
	{
		this.setSpawned(false);
	}
	else
	{
		this.setSpawnInfo();
	}

	TogglePlayerSpectating(this, toggle);
	return this;
}

is.enableSpectating(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return this.toggleSpectating(true);
}

is.disableSpectating(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return this.toggleSpectating(false);
}

is.sendMessage(this, color[], text[])
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	new string[256 + 1];
	string.copyFrom(text);
	new count = string.colorize(color);

	for(new i = 0, c, l = 0; ; ++i)
	{
		c = string[l];
		++l;
		
		while(string[l] == ' ')
		{
			++l;
		}
		
		SendClientMessage(player, c, string[l]);
		
		if(i >= count)
		{
			break;
		}
		
		l += strlen(string[l]) + 1;
	}
	
	return this;
}

is.sendServerMessage(this, color[], text[])
{
	new data[256];
	format(data, sizeof data, "%s: {ffffff}%s", these.serverMessagePrefix, text);
	this.sendMessage(color, data);
	return this;
}

is.getColor(this)
{
	new color[colors.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Игрока не существует");
		return color;
	}

	gs(Color, color);
	return color;
}

is.setColor(this, color[])
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (!color.isValid())
	{
		err("Невалидный цвет игрока");
		return this;
	}

	ss(Color, color);
	SetPlayerColor(player, color.toRGBA(0xFF));
	return this;
}

is.isSpawned(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return gi(Spawned);
}

is.setSpawned(this, spawned)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	si(Spawned, spawned);
	return this;
}

is.getSkin(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return gi(Skin);
}

is.setSkin(this, skin)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	si(Skin, skin);

	if (!this.isSpawned())
	{
		return this;
	}

	SetPlayerSkin(this, skin);
	return this;
}

is.setHealth(this, Float:health)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	SetPlayerHealth(player, health);
	return this;
}

fs.getHealth(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return 0.0;
	}

	new Float:health;
	GetPlayerHealth(player, health);
	return health;
}

is.suicide(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return this.setHealth(0.0);
}

is.spawn(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	SpawnPlayer(this);
	return this;
}

is.setSpecialAction(this, action)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	SetPlayerSpecialAction(this, action);
	return this;
}

is.setInterior(this, interior)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	SetPlayerInterior(this, interior);
	return this;
}

is.getInterior(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return GetPlayerInterior(this);
}

is.setMoney(this, money)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	si(Money, money);
	ResetPlayerMoney(this);
	GivePlayerMoney(this, money);
	return this;
}

is.getMoney(this)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return 0;
	}

	return gi(Money);
}

is.giveMoney(this, money)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return this.setMoney(this.getMoney() + money);
}

is.takeMoneyAway(this, money)
{
	if (!this.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return this.setMoney(this.getMoney() - money);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these players.collections // c1
#define These players.Collections // C1
#define this players.collection
#define This players.Collection

// ----------------------------------------------------------------------

@collection;

is.add(this, player)
{
	if (!this.exists())
	{
		err("Коллекции игроков не существует");
		return -1;
	}

	if (vectors.(this).hasInteger(player))
	{
		err("Коллекция игроков уже содержит этого игрока в себе");
		return this;
	}

	vectors.(this).addInteger(player);
	return this;
}

is.remove(this, player)
{
	if (!this.exists())
	{
		err("Коллекции игроков не существует");
		return -1;
	}

	if (!vectors.(this).hasInteger(player))
	{
		err("Коллекция игроков не содержит этого игрока в себе");
		return this;
	}

	vectors.(this).removeInteger(player);
	return this;
}

is.sendMessage(this, color[], text[])
{
	if (!this.exists())
	{
		err("Коллекции игроков не существует");
		return -1;
	}

	new string[256 + 1];
	string.copyFrom(text);
	new count = string.colorize(color);

	for(new i = 0, c, l = 0; ; ++i)
	{
		c = string[l];
		++l;
		
		while(string[l] == ' ')
		{
			++l;
		}
		
		this.each(player, index)
		{
			SendClientMessage(player, c, string[l]);
		}
		
		if(i >= count)
		{
			break;
		}
		
		l += strlen(string[l]) + 1;
	}

	return this;
}

is.sendServerMessage(this, color[], text[])
{
	new data[256];
	format(data, sizeof data, "%s: {ffffff}%s", players.serverMessagePrefix, text);
	return this.sendMessage(color, data);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This