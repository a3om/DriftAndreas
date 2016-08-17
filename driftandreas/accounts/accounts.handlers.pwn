#define these accounts // a2
#define These Accounts // A2
#define this account
#define This Account

// ----------------------------------------------------------------------

handlers
{
	h.(players).connect:
	{
		i.player;
		player.toggleSpectating(true);
		player.setColor(these.ConnectionColor);
		emit(players, #readyToLogin, M:i(player));
		return 0;
	}

	h.(players).readyToLogin:
	{
		i.player;

		if (!these.isValidName(player.getName()))
		{
			player.openWindow(#invalidAccountName);
			return 0;
		}

		new this = these.findByName(player.getName());

		if (this.exists())
		{
			player.openWindow(#login, false, M:i(this));
			return 0;
		}

		player.openWindow(#registration);
		return 0;
	}

	h.(players).loggedIn:
	{
		i.player;
		new account = player.getAccount();
		player.setSkin(account.getSkin());
		player.setPosition(account.getPosition());
		player.setColor(account.getColor());
		player.setMoney(account.getMoney());
		player.disableSpectating();
		return 0;
	}

	h.(players).disconnect:
	{
		i.player;

		if (player.hasAccount())
		{
			emit(players, #loggedOut, M:i(player));

			player.getAccount() \
				.setPosition(player.getPosition()) \
				.setPlayer(-1) \
				.save();

			players.LoggedIn.remove(player);
		}

		return 0;
	}

	h.(players).death:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}
		
		player.setSpawnInfo();
		return 0;
	}

	h.(players).requestClass:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}

		player.sendServerMessage(colors.Success, "requestClass from account handlers");
		player.spawn();
		return 0;
	}

	h.(players).text:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 1;
		}

		return 0;
	}

	h.(players).chat:
	{
		i.map;
		map.si(#receivers, players.LoggedIn);
		return 1;
	}

	h.(chat).interlocutor:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}
		
		i.map;
		map.ss(#color, player.getAccount().getColor());
		map.ss(#name, player.getAccount().getName());
		return 1;
	}

	// ----------------------------------------------------------------------

	h.(players).updateName:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}

		player.setName(player.getAccount().getName());
		return 1;
	}

	h.(players).updateColor:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}

		player.setColor(player.getAccount().getColor());
		return 1;
	}

	h.(players).updateSkin:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}

		player.setSkin(player.getAccount().getSkin());
		return 1;
	}

	h.(players).updatePosition:
	{
		i.player;

		if (!player.hasAccount())
		{
			return 0;
		}

		player.setPosition(player.getAccount().getPosition());
		return 1;
	}

	// ----------------------------------------------------------------------

	h.(accounts).create:
	{
		i.account;
		i.fromDatabase;
		log("Аккаунт был создан // account = %d, fromDatabase = %d", account, fromDatabase);
		return 0;
	}

	h.(accounts).destroy:
	{
		log("Аккаунт был удален");
		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This