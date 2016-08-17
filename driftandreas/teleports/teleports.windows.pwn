#define these teleports // a03
#define These Teleports // a03
#define this teleport
#define This Teleport

// ----------------------------------------------------------------------

w.teleportsList(window, player, click, button, close)
{
	new string[128 + 1];
	if(click)
	{
		if(button)
		{
			i.windows.item;
			new 
				teleport = windows.item.getInteger(),
				position = teleport.getPosition()
			;
			
			if(player.hasVehicle())
			{
				player.getVehicle().setPosition(position);
			}
			else
			{
				player.setPosition(position);
			}
			
			string.format("Вы были телепортированы на: %s (/%s)", teleport.getName(), teleport.getCommand());
			player.sendMessage(#ffffff, string);
			
			player.closeAllWindows();
			
			return;
		}
	
		player.closeWindow();
		return;
	}
	
	window.setStyle(windows.StyleList);
	window.setTitle("Список телепортов");
	
	
	existent().each(teleport, index)
	{
		string.format("%s", teleport.getCommand());
		window.addItem(teleport.getName(), teleport, 1, .option = string);
	}
	
	window.setButtons("Выбрать", "Назад");
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This