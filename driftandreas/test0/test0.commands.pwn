#define these test0
#define These Test0

// ----------------------------------------------------------------------

c(player, command[], params[])
{
	command ("elegy")
	{
		new vehicle = Vehicle(562, player.getPosition());
		player.putInVehicle(vehicle, 0);
		player.sendServerMessage(colors.Success, "������� Elegy!");
		return 1;
	}

	command ("vehicle")
	{
		new name[vehicles.models.MaxNameLength + 1];
		new formatter[32];
		strings.(formatter).format("s[%d]", vehicles.models.MaxNameLength + 1);

		if (sscanf(params, formatter, name))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicle (��������� �������� ������ ����������)");
			return 1;
		}

		new vehicles.model = vehicles.models.findByName(name, .approximate = true);

		if (!vehicles.model.exists())
		{
			player.sendServerMessage(colors.Warning, "�� ������� ����� ������ ���������� �� ������ ��������");
			return 1;
		}

		new vehicle = Vehicle(vehicles.model, player.getPosition());
		player.putInVehicle(vehicle, 0);
		player.sendServerMessage(colors.Success, "��������� ��� ������� ������!");
		return 1;
	}

	command ("vehicle.setColor1")
	{
		new vehicle, color[colors.MaxColorLength + 1];

		if (sscanf(params, "ds[7]", vehicle, color))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicle.setColor1 (����� ����������) (����)");
			return 1;
		}

		vehicle.setColor1(color);
		return 1;
	}

	command ("vehicle.setColor2")
	{
		new vehicle, color[colors.MaxColorLength + 1];

		if (sscanf(params, "ds[7]", vehicle, color))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicle.setColor2 (����� ����������) (����)");
			return 1;
		}

		vehicle.setColor2(color);
		return 1;
	}

	command ("putInVehicle")
	{
		new vehicle, seat;

		if (sscanf(params, "dd", vehicle, seat))
		{
			player.sendServerMessage(colors.Info, "�������: /putInVehicle (����� ����������) (����� �������)");
			return 1;
		}

		player.putInVehicle(vehicle, seat);
		return 1;
	}

	command ("vehicles.repair")
	{
		new vehicle;

		if (sscanf(params, "d", vehicle))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicles.repair (����� ����������)");
			return 1;
		}

		vehicle.repair();
		return 1;
	}

	command ("vehicles.setPosition")
	{
		new vehicle, Float:x, Float:y, Float:z, Float:r;

		if (sscanf(params, "dffff", vehicle, x, y, z, r))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicles.setPosition (����� ����������) (X) (Y) (Z) (R)");
			return 1;
		}

		vehicle.setPosition(Position().setXYZR(x, y, z, r));
		return 1;
	}

	command ("vehicles.engine")
	{
		new vehicle, running;

		if (sscanf(params, "dd", vehicle, running))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicles.engine (����� ����������) (1/0)");
			return 1;
		}

		vehicle.engine(running);
		return 1;
	}

	command ("vehicles.lights")
	{
		new vehicle, lightening;

		if (sscanf(params, "dd", vehicle, lightening))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicles.lights (����� ����������) (1/0)");
			return 1;
		}

		vehicle.lights(lightening);
		return 1;
	}

	command ("vehicles.setComponent")
	{
		new vehicle, vehicles.component;

		if (sscanf(params, "dd", vehicle, vehicles.component))
		{
			player.sendServerMessage(colors.Info, "�������: /vehicles.setComponent (����� ����������) (����� ����������)");
			return 1;
		}

		new string[256];
		string.format("������������� ��������� %s", vehicles.component.getName());
		player.sendServerMessage(colors.Success, string);
		vehicle.setComponent(vehicles.component);
		return 1;
	}

	command ("leaveVehicle")
	{
		player.leaveVehicle();
		return 1;
	}

	command ("throwFromVehicle")
	{
		player.throwFromVehicle();
		return 1;
	}

	command ("respawnVehicle")
	{
		if (player.hasVehicle())
		{
			player.getVehicle().respawn();
		}

		return 1;
	}

	command ("updateVehicle")
	{
		if (player.hasVehicle())
		{
			player.getVehicle().update();
		}

		return 1;
	}

	command ("setVehiclePaintjob")
	{
		new paintjob;

		if (sscanf(params, "d", paintjob))
		{
			player.sendServerMessage(colors.Info, "�������: /setVehiclePaintjob (�����)");
			return 1;
		}

		if (player.hasVehicle())
		{
			player.getVehicle().setPaintjob(paintjob).respawn();
		}

		return 1;
	}

	command ("setVehicleNumber")
	{
		new number[vehicles.MaxNumberLength + 1];

		if (sscanf(params, "s[33]", number))
		{
			player.sendServerMessage(colors.Info, "�������: /setVehicleNumber (�����)");
			return 1;
		}

		if (player.hasVehicle())
		{
			player.getVehicle().setNumber(number).respawn();
		}

		return 1;
	}

	command ("destroyVehicle")
	{
		if (player.hasVehicle())
		{
			player.getVehicle().destroy();
		}

		return 1;
	}

	command ("setVehicleHealth")
	{
		new vehicle, Float:health;

		if (sscanf(params, "df", vehicle, health))
		{
			player.sendServerMessage(colors.Info, "�������: /setVehicleHealth (����� ����������) (���������� ��������)");
			return 1;
		}

		vehicle.setHealth(health);
		return 1;
	}

	command ("enableVehicle")
	{
		new vehicle;

		if (sscanf(params, "d", vehicle))
		{
			player.sendServerMessage(colors.Info, "�������: /enableVehicle (����� ����������)");
			return 1;
		}

		vehicle.enable();
		return 1;
	}

	command ("disableVehicle")
	{
		new vehicle;

		if (sscanf(params, "d", vehicle))
		{
			player.sendServerMessage(colors.Info, "�������: /disableVehicle (����� ����������)");
			return 1;
		}

		vehicle.disable();
		return 1;
	}

	command ("randomColor")
	{
		//
	}

	command ("structures")
	{
		player.openWindow(#structures);
		return 1;
	}

	command ("pickup")
	{
		Pickup(1242, 14, player.getPosition());
		player.sendServerMessage(colors.Success, "������� �����!");
		return 1;
	}

	command ("suicide")
	{
		player.suicide();
		return 1;
	}

	command ("createWorld")
	{
		new world = World();
		new string[128];
		string.format("��� ������ ���: %d", world);
		player.sendServerMessage(colors.Success, string);
		return 1;
	}

	command ("destroyWorld")
	{
		new world;

		if (sscanf(params, "d", world))
		{
			player.sendServerMessage(colors.Info, "�������: /destroyWorld (����� ����)");
			return 1;
		}

		if (!world.exists())
		{
			player.sendServerMessage(colors.Warning, "���� �� ����������");
			return 1;
		}

		world.destroy();
		return 1;
	}

	command ("setWorld")
	{
		new world;

		if (sscanf(params, "d", world))
		{
			player.sendServerMessage(colors.Info, "�������: /setWorld (����� ����)");
			return 1;
		}

		if (!world.exists())
		{
			player.sendServerMessage(colors.Warning, "������������ ���� �� ���������� :C");
			return 1;
		}

		player.setWorld(world);
		return 1;
	}

	command ("getInterior")
	{
		new interior = GetPlayerInterior(player);
		new string[256];
		string.format("�������� ������: %d", interior);
		player.sendServerMessage(colors.Success, string);
		return 1;
	}

	command ("exampleTable")
	{
		player.openWindow("exampleTable");
		return 1;
	}

	command ("setMoney")
	{
		new money;

		if (sscanf(params, "d", money))
		{
			player.sendServerMessage(colors.random(true), "����������, ������� /setMoney (���������� �����)");
			return 1;
		}

		player.setMoney(money);
		new string[128];
		string.format("��� ���� ����������� $%d", money);
		player.sendServerMessage(colors.random(true), string);
		return 1;
	}

	command ("getMoney")
	{
		new string[128];
		string.format("���� ������: $%d", player.getMoney());
		player.sendServerMessage(colors.random(true), string);
		return 1;
	}
	
	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These