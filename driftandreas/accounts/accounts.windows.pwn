#define these accounts // a00
#define These Accounts // A00
#define this account
#define This Account

// ----------------------------------------------------------------------

w.invalidAccountName(window, player, click, button, close)
{
	if (click)
	{
		i.windows.textdraw;

		if (button)
		{
			if (windows.textdraw > -1)
			{
				if (windows.textdraw.getName().is(#menuText))
				{
					player.openWindow(#loginMenu, true);
					return;
				}

				player.showWindow();
				return;
			}

			if (!accounts.isValidName(window.getInput()))
			{
				window.setState(0);
				player.showWindow();
				return;
			}

			new player0 = players.findByName(window.getInput());

			if (player0.exists() && player0 != player)
			{
				window.setState(1);
				player.showWindow();
				return;
			}

			player.setName(window.getInput());
			new this = these.findByName(window.getInput());

			if (this > -1)
			{
				player.openWindow(#login, true, Map().si(#account, this));
				return;
			}

			player.openWindow(#registration, true);
			return;
		}

		player.hideWindow();
		return;
	}

	new data[128];
	window.setStyle(windows.StyleInput);
	window.setTitle("Неправильный ник");

	switch (window.getState())
	{
		case 0:
		{
			window.addLine("Ник не может содержать символы: {00ff00}.[](){ffffff}.");
			window.addLine("Ник может состоять максимум из 16-ти символов.");
		}
		case 1:
		{
			format(data, sizeof data, "Игрок с ником {00ff00}%s {ffffff}уже находится на сервере.", window.getInput());
			window.addLine(data);
		}
	}
	
	window.addLine("");
	window.addLine("Попробуйте изменить ник на другой. Для этого введите новый ник в поле ниже:");		
	window.setButtons("Изменить", "Закрыть");
}

w.registration(window, player, click, button, close)
{
	if (click)
	{
		if (button)
		{
			i.windows.textdraw;

			if (windows.textdraw > -1)
			{
				if (windows.textdraw.getName().is(#menuText))
				{
					player.openWindow(#loginMenu, true);
					return;
				}
				
				player.showWindow();
				return;
			}

			if (window.getInput().isEmpty())
			{
				player.showWindow();
				return;
			}

			new account = Account(player.getName(), window.getInput());
			account.setColor(colors.random(true));
			account.setPlayer(player);
			account.save();
			player.setAccount(account);
			players.LoggedIn.add(player);
			emit(players, #loggedIn, M:i(player));
			player.closeAllWindows();
			return;
		}

		player.hideWindow();
		return;
	}

	window.setStyle(windows.StyleInput);
	window.setTitle("Регистрация");
	window.setButtons("Далее", "Закрыть");
	window.addLine("Придумайте пароль от своего будущего аккаунта и введите его в поле ниже:");

	window.addTextdraw(#menuBox, 365.333343, 430.418548, "usebox")\
		.letterSize(0.000000, 1.757409).textSize(269.333343, 0.000000).alignment(1).color(#000000).useBox().boxColor(#000000, 0x88).shadow(0).outline(0).font(0).show();
	window.addTextdraw(#menuButton, 278.333312, 432.237121, "LD_BEAT:triang")\
		.textSize(11.999989, 14.103713).alignment(1).color(#ffffff).shadow(0).outline(0).font(4).show();
	window.addTextdraw(#menuText, 270.0, 428.918518, "________menu")\
		.letterSize(0.331666, 1.765926).textSize(270.0 + 95.0, 428.918518 + 20.0).alignment(1).color(#ffffff).shadow(0).outline(1).backgroundColor(#000000, 0x88).font(1).proportional(1).selectable().show();
}

w.login(window, player, click, button, close)
{
	if (click)
	{
		i.windows.item;
		i.windows.textdraw;
		i.single;

		log("window = %d, player = %d, click = %d, button = %d, single = %d, windows.item = %d, windows.textdraw = %d", window, player, click, button, single, windows.item, windows.textdraw);

		if (button)
		{
			if (windows.textdraw > -1)
			{
				if (windows.textdraw.getName().is(#menuText))
				{
					player.openWindow(#loginMenu, true);
					return;
				}

				player.showWindow();
				return;
			}

			if (window.getInput().isEmpty())
			{
				window.setState(0);
				player.showWindow();
				return;
			}

			new account = window.getData().gi(#account);

			if (!account.getPasswordHash().is(md5(window.getInput())))
			{
				window.setState(1);
				player.showWindow();
				return;
			}
			
			account.setPlayer(player).save();
			player.setAccount(account);
			players.LoggedIn.add(player);
			emit(players, #loggedIn, M:i(player));
			player.closeAllWindows();
			return;
		}

		player.hideWindow();
		return;
	}

	window.setStyle(windows.StyleInput);
	window.setTitle("Вход");

	switch (window.getState())
	{
		case 0:
		{
			window.addLine("Чтобы войти, введите пароль от этого аккаунта в поле ниже:");
		}
		case 1:
		{
			window.addLine("Неверный пароль от аккаунта. Попробуйте ещё раз.");
		}
	}

	window.setButtons("Далее", "Закрыть");
	window.addTextdraw(#menuBox, 365.333343, 430.418548, "usebox")\
		.letterSize(0.000000, 1.757409).textSize(269.333343, 0.000000).alignment(1).color(#000000).useBox().boxColor(#000000, 0x88).shadow(0).outline(0).font(0).show();
	window.addTextdraw(#menuButton, 278.333312, 432.237121, "LD_BEAT:triang")\
		.textSize(11.999989, 14.103713).alignment(1).color(#ffffff).shadow(0).outline(0).font(4).show();
	window.addTextdraw(#menuText, 270.0, 428.918518, "________menu")\
		.letterSize(0.331666, 1.765926).textSize(270.0 + 95.0, 428.918518 + 20.0).alignment(1).color(#ffffff).shadow(0).outline(1).backgroundColor(#000000, 0x88).font(1).proportional(1).selectable().show();

	return;
}

w.loginMenu(window, player, click, button, close)
{
	if (click)
	{
		if (button)
		{
			i.windows.item;

			if (windows.item.getName().is("login"))
			{
				if (!these.isValidName(player.getName()))
				{
					player.openWindow(#invalidAccountName, true);
					return;
				}

				new this = these.findByName(player.getName());

				if (this > -1)
				{
					player.openWindow(#login, true, M:i(this));
					return;
				}

				player.openWindow(#registration, true);
				return;
			}

			if (windows.item.getName().is("changeName"))
			{
				player.openWindow(#changeName, true);
				return;
			}

			if (windows.item.getName().is("restorePassword"))
			{
				player.showWindow();
				return;
			}

			if (windows.item.getName().is("about"))
			{
				player.showWindow();
				return;
			}

			player.showWindow();
			return;
		}

		player.hideWindow();
		return;
	}

	window.addItem("Войти на сервер", .name = "login");
	window.addItem("Изменить ник для входа", .name = "changeName");
	window.addItem("Восстановить пароль", .name = "restorePassword");
	window.addItem("О сервере", .name = "about");
	window.title("Меню входа");
	window.buttons("Выбрать", "Закрыть");
}

w.changeName(window, player, click, button, close)
{
	if (click)
	{
		if (button)
		{
			i.windows.textdraw;

			if (windows.textdraw > -1)
			{
				if (windows.textdraw.getName().is(#menuText))
				{
					player.openWindow(#loginMenu, true);
					return;
				}

				player.showWindow();
				return;
			}

			if (!accounts.isValidName(window.getInput()))
			{
				window.setState(0);
				player.showWindow();
				return;
			}

			new player0 = players.findByName(window.getInput());

			if (player0.exists() && player0 != player)
			{
				window.setState(1);
				player.showWindow();
				return;
			}

			player.setName(window.getInput());
			new this = these.findByName(window.getInput());

			if (this > -1)
			{
				player.openWindow(#login, true, Map().si(#account, this));
				return;
			}

			player.openWindow(#registration, true);
			return;
		}

		player.hideWindow();
		return;
	}

	new data[128];
	window.style(windows.StyleInput);
	window.title("Изменение ника для входа");

	switch (window.getState())
	{
		case 0:
		{
			window.addLine("Ник не может содержать символы: {00ff00}.[](){ffffff}.");
			window.addLine("Ник может состоять минимум из 3-х символов.");
			window.addLine("Ник может состоять максимум из 16-ти символов.");
		}
		case 1:
		{
			format(data, sizeof data, "Игрок с ником {00ff00}%s {ffffff}уже находится на сервере.", window.getInput());
			window.addLine(data);
		}
	}
	
	window.addLine("");
	window.addLine("Попробуйте изменить ник на другой. Для этого введите новый ник в поле ниже:");		
	window.buttons("Изменить", "Закрыть");

	window.addTextdraw(#menuBox, 365.333343, 430.418548, "usebox")\
		.letterSize(0.000000, 1.757409).textSize(269.333343, 0.000000).alignment(1).color(#000000).useBox().boxColor(#000000, 0x88).shadow(0).outline(0).font(0).show();
	window.addTextdraw(#menuButton, 278.333312, 432.237121, "LD_BEAT:triang")\
		.textSize(11.999989, 14.103713).alignment(1).color(#ffffff).shadow(0).outline(0).font(4).show();
	window.addTextdraw(#menuText, 270.0, 428.918518, "________menu")\
		.letterSize(0.331666, 1.765926).textSize(270.0 + 95.0, 428.918518 + 20.0).alignment(1).color(#ffffff).shadow(0).outline(1).backgroundColor(#000000, 0x88).font(1).proportional(1).selectable().show();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This