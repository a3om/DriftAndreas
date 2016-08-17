#define these accounts // a00
#define These Accounts // A00
#define this account
#define This Account

// ----------------------------------------------------------------------

dependencies()
{
	d(players);
}

initialize()
{
	log("Инициализируем класс accounts");
	players.LoggedIn = Vector("loggedIn players");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(name[], password[])
{
	new this = create();
	ss(Name, name);
	ss(PasswordHash, md5(password));
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	emit(these, #destory, Map().i(#account, account));
	return destroy();
}

is.save(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	save();
	return this;
}

// ----------------------------------------------------------------------

is.getName(this)
{
	new name[these.MaxNameLength + 1];
	
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.getFormattedName(this, withColor = true, withPlayer = true)
{
	new formattedName[these.MaxFormattedNameLength + 1];

	if (!this.exists())
	{
		err("Аккаунта не существует");
		return formattedName;
	}

	if (withColor)
	{
		strings.(formattedName).format("{%s}", account.getColor());
	}

	strings.(formattedName).format("%s%s", formattedName, account.getName());

	if (withPlayer && account.hasPlayer())
	{
		strings.(formattedName).format("%s(%d)", formattedName, account.getPlayer());
	}

	return formattedName;
}

is.setName(this, name[])
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	if (!these.isValidName(name))
	{
		err("Невалидное имя аккаунта");
		return this;
	}

	new account0 = these.findByName(name);

	if (account0.exists() && account0 != this)
	{
		err("Аккаунт с таким именем уже существует");
		return this;
	}

	ss(Name, name);
	emit(accounts, #setName, Map().i(#account, account).s(#name, name));
	return this;
}

is.isValidName(name[])
{
	if (strings.(name).isEmpty())
	{
		return false;
	}

	if (strings.(name).getLength() < 3 || strings.(name).getLength() > these.MaxNameLength)
	{
		return false;
	}

	if (strings.(name).containsChars({'[', ']', '(', ')', '.'}))
	{
		return false;
	}

	return true;
}

is.findByName(name[])
{
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

is.getPasswordHash(this)
{
	new passwordHash[these.MaxPasswordHashLength + 1];

	if (!this.exists())
	{
		err("Аккаунта не существует");
		return passwordHash;
	}

	gs(PasswordHash, passwordHash);
	return passwordHash;
}

is.getPlayer(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	return gi(Player);
}

is.hasPlayer(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return false;
	}

	return this.getPlayer().exists();
}

is.setPlayer(this, player)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	si(Player, player);
	return this;
}

is.getPosition(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	return Position(gf(PosX), gf(PosY), gf(PosZ), 0.0, 0.0, gf(PosR));
}

is.setPosition(this, position)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:r;
	position.getXYZR(x, y, z, r);
	sf(PosX, x);
	sf(PosY, y);
	sf(PosZ, z);
	sf(PosR, r);
	
	if (this.hasPlayer())
	{
		this.getPlayer().setPosition(position);
	}

	return this;
}

is.getSkin(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	return gi(Skin);
}

is.setSkin(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}
	
	si(Skin, skin);
	
	if (this.hasPlayer())
	{
		this.getPlayer().setSkin(skin);
	}

	return this;
}

is.getColor(this)
{
	new color[colors.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Аккаунта не существует");
		return color;
	}

	gs(Color, color);
	return color;
}

is.setColor(this, color[])
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	if (!color.isValid())
	{
		err("Невалидный цвет аккаунта");
		return this;
	}

	ss(Color, color);
	
	if (this.hasPlayer())
	{
		this.getPlayer().setColor(color);
	}

	return this;
}

is.getMoney(this)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return 0;
	}

	return gi(Money);
}

is.setMoney(this, money)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	si(Money, money);

	if (this.hasPlayer())
	{
		this.getPlayer().setMoney(money);
	}

	return this;
}

is.giveMoney(this, money)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	return this.setMoney(this.getMoney() + money);
}

is.takeMoneyAway(this, money)
{
	if (!this.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	return this.setMoney(this.getMoney() - money);
}

is.find(string[], byPlayer = false, bool:ignoreCase = true)
{
	return accounts.collections.(existent()).find(string, byPlayer, ignoreCase);
}

// ----------------------------------------------------------------------

@is.(players).getAccount(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(Account, player);
}

@is.(players).hasAccount(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return @gi.(Players).(Account, player) > -1;
}

@is.(players).setAccount(player, this)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	@si.(Players).(Account, player, account);
	return player;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these accounts.collections // a05
#define These accounts.Collections // A05
#define this accounts.collection
#define This accounts.Collection

// ----------------------------------------------------------------------

@collection;

is.add(this, account)
{
	if (vectors.(this).hasInteger(account))
	{
		err("Коллекция аккаунтов уже содержит этот аккаунт");
		return this;
	}

	vectors.(this).addInteger(account);
	return this;
}

is.remove(this, account)
{
	if (!vectors.(this).hasInteger(account))
	{
		err("Коллекция аккаунтов не содержит этот аккаунт");
		return this;
	}

	vectors.(this).removeInteger(account);
	return this;
}

is.find(this, string[], byPlayer = false, bool:ignoreCase = true)
{
	new player = -1;

	if (byPlayer && string.isNumeric())
	{
		player = string.toInteger();

		if (!player.exists())
		{
			player = -1;
		}
	}

	new accounts.collection0 = This();

	this.each(account, index)
	{
		if (account.hasPlayer() && player.exists() && account.getPlayer() == player)
		{
			accounts.collection0.add(account);
			continue;
		}

		if (account.getName().find(string, .ignoreCase = ignoreCase) > -1)
		{
			accounts.collection0.add(account);
			continue;
		}
	}

	return accounts.collection0;
}

is.save(this)
{
	this.each(account, index)
	{
		account.save();
	}

	return this;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This