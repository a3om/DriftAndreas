#define these test0
#define These Test0

// ----------------------------------------------------------------------

handlers
{
	h.(players).connect:
	{
		i.player;
		log("����� ����������� � �������.. // player = %d", player);
		return 0;
	}

	h.(test0).test:
	{
		log("�������� �������...");
		return 0;
	}

	h.(players).tryToEnterVehicle:
	{
		i.player;
		i.vehicle;
		i.asPassenger;
		
		new string[256];
		format(string, sizeof string, "����� %d ����� ����� � ��������� %d ��� ��������: %d", player, vehicle, asPassenger);
		players.existent().sendServerMessage(#ff00ff, string);
		// player.stopEnterVehicle();
		return 0;
	}

	h.(players).enterVehicle:
	{
		i.player;
		i.vehicle;
		i.vehicles.passenger;

		new string[256];
		format(string, sizeof string, "����� %d ����� � ��������� %d �� ����� %d", player, vehicle, vehicles.passenger.getSeat());
		players.existent().sendServerMessage(#ff00ff, string);
		return 0;
	}

	h.(players).exitVehicle:
	{
		i.player;
		i.vehicle;
		i.vehicles.passenger;

		new string[256];
		format(string, sizeof string, "����� %d ����� �� ���������� %d � ����� %d", player, vehicle, vehicles.passenger.getSeat());
		players.existent().sendServerMessage(#ff00ff, string);
		return 0;
	}

	h.(players).climbUpVehicle:
	{
		i.player;
		i.vehicle;
		new string[256];
		string.format("����� #%d ��������� �� ��������� #%d", player, vehicle);
		players.existent().sendServerMessage(colors.Info, string);
		return 0;
	}

	h.(players).climbDownVehicle:
	{
		i.player;
		i.vehicle;
		new string[256];
		string.format("����� #%d �������� � ���������� #%d", player, vehicle);
		players.existent().sendServerMessage(colors.Info, string);
		return 0;
	}

	h.(vehicles).enterArea:
	{
		i.vehicle;
		i.area;
		new string[256];
		string.format("��������� #%d ����� � ���������� #%d", vehicle, area);
		players.existent().sendServerMessage(colors.Info, string);
		return 0;
	}

	h.(vehicles).leaveArea:
	{
		i.vehicle;
		i.area;
		new string[256];
		string.format("��������� #%d ����� �� ���������� #%d", vehicle, area);
		players.existent().sendServerMessage(colors.Info, string);
		return 0;
	}

	h.(vehicles).crash:
	{
		i.vehicle;
		new string[256];
		string.format("��������� #%d ��� �������", vehicle);
		players.existent().sendServerMessage(colors.Info, string);
		return 0;
	}

	h.(vehicles).upsideDown:
	{
		i.vehicle;
		new string[256];
		string.format("��������� #%d ��� ��������� �� �����", vehicle);
		players.existent().sendServerMessage(colors.Info, string);
		vehicle.flip();
		return 0;
	}

	h.(vehicles).flip:
	{
		i.vehicle;
		new string[256];
		string.format("��������� #%d ��� ��������� �� ������", vehicle);
		players.existent().sendServerMessage(colors.Info, string);
		return 0;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These