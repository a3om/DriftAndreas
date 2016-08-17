#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

w.houseMenu(window, player, click, button, close)
{
	i.map;
	
	new 
		string[64 + 1],
		this = map.gi(#house)
	;
	
	if (click)
	{
		if(button)
		{
			i.windows.item;
			
			switch(windows.item.getInteger())
			{
				case 1:
				{
					if(house.getOwner() == player.getAccount())
					{
						player.sendMessage(#ffffff, "Ты вошел в дом");
						player.moveToHouse(this);
						player.closeAllWindows();
					}
					else
					{
						if(!house.isClose())
						{
							player.sendMessage(#ffffff, "Ты вошел в дом");
							player.moveToHouse(this);
							player.closeAllWindows();
						}		
						
						player.showWindow();
					}
					
					return;
				}
				case 2:
				{
					player.showWindow();
					
					return;
				}
				case 3:
				{
					player.showWindow();
					
					return;
				}
				case 4:
				{
					if(house.getOwner() == player.getAccount())
					{
						player.openWindow(#interiorMenu, .map = M:si(#house, house));
					}
					
					return;
				}
				case 5:
				{
					if(house.getOwner() == player.getAccount())
					{
						if(house.isClose())
						{
							player.sendMessage(#ff0000, "[DEBUG] Игрок открыл двери");
							house.setClose(false).save();
						}
						else
						{
							player.sendMessage(#ff0000, "[DEBUG] Игрок закрыл двери");
							house.setClose(true).save();
						}
					}
					
					player.showWindow();
				
					return;
				}
				case 6: // Продажа
				{
					if(house.getOwner() == player.getAccount())
					{
						new 
							account = player.getAccount(),
							money = house.getPrice()
						;
						
						if(player.hasHouse())
						{
							player.leaveHouse();
						}
						
						account.giveMoney(money).save();
						
						house.setOwner(-1).setSellPrice(0).save();
					}
					
					player.showWindow();
					return;
				}
				case 7:
				{
					player.sendMessage(#ffffff, "Вы вышли из дома");
					player.leaveHouse();
					player.closeAllWindows();
					
					return;
				}
				case 8:
				{
					if(house.getOwner() == player.getAccount())
					{
						player.openWindow(#sellHouse, .map = M:i(house));
					}
					
					return;
				}
				case 9: // снять с продажи
				{
					if(house.getOwner() == player.getAccount())
					{
						house.setSellPrice(0).save();
					}
					
					player.showWindow();
					return;
				}
				case 10: // Покупка дома у игрока
				{
					if(house.getOwner() == player.getAccount())
					{
						player.showWindow();
					}
					else
					{
						if(player.getAccount().getMoney() < house.getSellPrice())
						{
							// Не хватает
						}
						else
						{
							house.getOwner().giveMoney(house.getSellPrice()).save();
						
							player.getAccount().takeMoneyAway(house.getSellPrice()).save();
						
							house.setOwner(player.getAccount()).setSellPrice(0).save();
							
							player.showWindow();
						}
					}
					
					return;
				}
				case 11:
				{
					if(house.getOwner() == player.getAccount())
					{
						player.showWindow();
					}
					else
					{
						new
							account = player.getAccount(),
							price = house.getPrice()
						;
						
						if(account.getMoney() < price)
						{
							player.openWindow(#noMoneyToBuyHouse, .map = M:si(#money, price - account.getMoney()));
							return;
						}
						
						house.setOwner(account).save();
						account.takeMoneyAway(price).save();
						player.showWindow();
					}
					return;
				}
			}
		}
		
		if(close)
		{
			player.closeAllWindows();
		}
		
		return;
	}

	window.style(windows.StyleList);
	
	format(string, sizeof string, "Меню дома №%d", house);	
	window.title(string);
	
	if(player.hasHouse())
	{
		window.addItem("Выйти", 7, .formatter = 1);
	}
	else
	{
		window.addItem("Войти", 1, .formatter = 1);
	}
	
	
	string.format("%d$", house.getPrice());	
	window.addItem("Стоимость", .integer = 2, .formatter = 1, .option = string);
	
	
	if(house.hasOwner())
	{
		new 
			account = house.getOwner()
		;
		
		string.format("{%s}%s{ffffff}", account.getColor(), account.getName());	
		window.addItem("Владелец", .integer = 3, .option = string, .formatter = 1);
		
		window.addItem("Интерьер", 4, .option = house.getInterior().getName(), .formatter = 1);
		
	}

	if(house.isClose())
	{
		window.addItem("Закрыт", 5, .formatter = 3);
	}
	else
	{
		window.addItem("Закрыт", 5, .formatter = 4);
	}
	
	if(house.hasOwner())
	{
		if(house.getOwner() == player.getAccount())
		{
			if(house.isOnSale())
			{
				string.format("%d$", house.getSellPrice());
				window.addItem("Снять с продажи\t", 9, .option = string, .formatter = 1);
			}
			else
			{
				window.addItem("Выставить на продажу", 8, .formatter = 1);
			}
			
			window.addItem("Продать", 6, .formatter = 1);
		}
		else
		{
			if(house.isOnSale())
			{
				string.format("%d$", house.getSellPrice());
				window.addItem("Купить\t", 10, .option = string, .formatter = 1);
				
			}
		}
	}
	else
	{
		window.addItem("Купить", 11, .formatter = 1);
	}
	window.buttons("Выбрать", "Закрыть");
}

w.sellHouse(window, player, click, button, close)
{
	i.map;
	
	new 
		string[128],
		house = map.gi(#house)
	;
	
	if(click)
	{
		if(button)
		{
			if (window.getInput().isEmpty())
			{
				player.showWindow();
				return;
			}
			
			if (!window.getInput().isNumeric())
			{
				player.showWindow();
				return;
			}
			
			new
				price = window.getInput().toInteger()
			;
			
			house.setSellPrice(price).save();
			player.closeWindow();

			return;
		}
		
		player.closeWindow();
		return;
	}
	
	window.style(windows.StyleInput);
	string.format("Меню дома №%d", house);	
	window.title(string);
	
	window.addLine("Введите сумму за которую вы хотите продать дом");
	window.addLine("В поле ниже:");
	
	window.buttons("Далее", "Назад");
}

w.interiorMenu(window, player, click, button, close)
{
	i.map;
	
	new 
		string[128],
		house = map.gi(#house)
	;
	
	if(click)
	{
		if(close)
		{
			player.closeAllWindows();
			return;
		}
		
		if(button)
		{
			i.windows.item;
			
			new houses.interior = windows.item.getInteger();
			
			
			if(player.getAccount().getMoney() < houses.interior.getPrice())
			{
				// Не хватает на интерьер
				player.showWindow();
			}
			else
			{
				player.openWindow(#buyInterior, .map = M:i(house).i(houses.interior));
			}

			// player.showWindow();
			return;
		}
		
		player.closeWindow();
		return;
	}
	
	window.setStyle(windows.StyleList);
	window.setTitle("Интерьеры домов");

	houses.interiors.existent().each(houses.interior, index)
	{
		string.format("%d$", houses.interior.getPrice());
		if(house.getInterior() == houses.interior)
		{
			window.addItem(houses.interior.getName(), .integer = houses.interior, .option = string, .formatter = 2);
		}
		else
		{
			window.addItem(houses.interior.getName(), .integer = houses.interior, .option = string, .formatter = 1);
		}
	}

	window.setButtons("Выбрать", "Закрыть");
}

w.buyInterior(window, player, click, button, close)
{
	i.map;
	
	new 
		string[128],
		house = map.gi(#house),
		houses.interior = map.gi(#houses.interior)
	;
	
	if(click)
	{
		if(button)
		{
			if(player.getAccount().getMoney() < houses.interior.getPrice())
			{
				// Не хватает денег
			}
			else
			{
				player.getAccount().takeMoneyAway(houses.interior.getPrice()).save();
				house.setInterior(houses.interior).save();
				
				player.closeWindow();
			}
			return;
		}
		
		player.closeWindow();
		return;
	}
	
	window.style(windows.StyleMessageBox);
	
	string.format("Меню дома №%d", house);	
	window.title(string);
	
	string.format("Вы уверены что хотите купить интерьер %s, за %d$?", houses.interior.getName(), houses.interior.getPrice());
	window.addLine(string);
	
	window.buttons("Купить", "Назад");
}

w.noMoneyToBuyHouse(window, player, click, button, close)
{
	i.map;
	
	new 
		string[128],
		house = player.getHouse()
		
	;
	
	if(click)
	{
		if(button)
		{
			player.closeWindow();
			return;
		}
	}
	
	window.style(windows.StyleMessageBox);
	
	string.format("Меню дома №%d", house);	
	window.title(string);
	
	string.format("У вас не хватает %d$ для покупки данного дома", map.gi(#money));
	window.addLine(string);
	
	window.buttons("Назад");
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This