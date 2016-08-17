#define these teleports // a03
#define These Teleports // a03
#define this teleport
#define This Teleport
// ----------------------------------------------------------------------

c(player, command[], params[])
{
	if(teleports.findByCommand(command) > -1)
	{
		new 
			string[128],
			teleport = teleports.findByCommand(command),
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
		
		string.format("�� ���� ��������������� ��: %s (/%s)", teleport.getName(), teleport.getCommand());
		player.sendMessage(#ffffff, string);
		return 1;
	}
	
	command ( "c-tp" )
	{
		new
			string[128],
			title[64],
			name[25]
		;
		if(sscanf(params, "s[128]s[25]", title, name)) 
		{
			player.sendMessage(#ffffff, "������ ����� ����������");
			return true;
		}
		
		if(teleports.findByCommand(name) > -1)
		{
			player.sendMessage(#ffffff, "�������� � ������ �������� ��� ��� ������");
			return true;
		}
		
		string.format("�������� %s (/%s) ��� ������", title, name);
		player.sendMessage(#ffffff, string);
		Teleport(player.getPosition(), title, name).save();
		return 1;
	}
	
	command ( "d-tp" )
	{
		new
			string[128],
			name[25]
		;
		if(sscanf(params, "s[25]", name)) 
		{
			player.sendMessage(#ffffff, "������ ����� ����������");
			return true;
		}
		
		new teleport = teleports.findByCommand(name);
		
		if(teleport == -1)
		{
			player.sendMessage(#ffffff, "�������� � ������ �������� ��� �� ��� ������");
			return true;
		}
		
		string.format("�������� %s (/%s) ��� ������", teleport.getName(), name);
		player.sendMessage(#ffffff, string);
		teleport.destroy();
		return 1;
	}
	
	command ( "tp" )
	{
		player.openWindow(#teleportsList);
		return true;
	}
	
	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This