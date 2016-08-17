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
						player.sendMessage(#ffffff, "�� ����� � ���");
						player.moveToHouse(this);
						player.closeAllWindows();
					}
					else
					{
						if(!house.isClose())
						{
							player.sendMessage(#ffffff, "�� ����� � ���");
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
							player.sendMessage(#ff0000, "[DEBUG] ����� ������ �����");
							house.setClose(false).save();
						}
						else
						{
							player.sendMessage(#ff0000, "[DEBUG] ����� ������ �����");
							house.setClose(true).save();
						}
					}
					
					player.showWindow();
				
					return;
				}
				case 6: // �������
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
					player.sendMessage(#ffffff, "�� ����� �� ����");
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
				case 9: // ����� � �������
				{
					if(house.getOwner() == player.getAccount())
					{
						house.setSellPrice(0).save();
					}
					
					player.showWindow();
					return;
				}
				case 10: // ������� ���� � ������
				{
					if(house.getOwner() == player.getAccount())
					{
						player.showWindow();
					}
					else
					{
						if(player.getAccount().getMoney() < house.getSellPrice())
						{
							// �� �������
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
	
	format(string, sizeof string, "���� ���� �%d", house);	
	window.title(string);
	
	if(player.hasHouse())
	{
		window.addItem("�����", 7, .formatter = 1);
	}
	else
	{
		window.addItem("�����", 1, .formatter = 1);
	}
	
	
	string.format("%d$", house.getPrice());	
	window.addItem("���������", .integer = 2, .formatter = 1, .option = string);
	
	
	if(house.hasOwner())
	{
		new 
			account = house.getOwner()
		;
		
		string.format("{%s}%s{ffffff}", account.getColor(), account.getName());	
		window.addItem("��������", .integer = 3, .option = string, .formatter = 1);
		
		window.addItem("��������", 4, .option = house.getInterior().getName(), .formatter = 1);
		
	}

	if(house.isClose())
	{
		window.addItem("������", 5, .formatter = 3);
	}
	else
	{
		window.addItem("������", 5, .formatter = 4);
	}
	
	if(house.hasOwner())
	{
		if(house.getOwner() == player.getAccount())
		{
			if(house.isOnSale())
			{
				string.format("%d$", house.getSellPrice());
				window.addItem("����� � �������\t", 9, .option = string, .formatter = 1);
			}
			else
			{
				window.addItem("��������� �� �������", 8, .formatter = 1);
			}
			
			window.addItem("�������", 6, .formatter = 1);
		}
		else
		{
			if(house.isOnSale())
			{
				string.format("%d$", house.getSellPrice());
				window.addItem("������\t", 10, .option = string, .formatter = 1);
				
			}
		}
	}
	else
	{
		window.addItem("������", 11, .formatter = 1);
	}
	window.buttons("�������", "�������");
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
	string.format("���� ���� �%d", house);	
	window.title(string);
	
	window.addLine("������� ����� �� ������� �� ������ ������� ���");
	window.addLine("� ���� ����:");
	
	window.buttons("�����", "�����");
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
				// �� ������� �� ��������
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
	window.setTitle("��������� �����");

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

	window.setButtons("�������", "�������");
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
				// �� ������� �����
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
	
	string.format("���� ���� �%d", house);	
	window.title(string);
	
	string.format("�� ������� ��� ������ ������ �������� %s, �� %d$?", houses.interior.getName(), houses.interior.getPrice());
	window.addLine(string);
	
	window.buttons("������", "�����");
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
	
	string.format("���� ���� �%d", house);	
	window.title(string);
	
	string.format("� ��� �� ������� %d$ ��� ������� ������� ����", map.gi(#money));
	window.addLine(string);
	
	window.buttons("�����");
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This