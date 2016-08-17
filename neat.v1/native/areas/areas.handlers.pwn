#define these areas // b5
#define These Areas // B5
#define this area
#define This Area

// ----------------------------------------------------------------------

handlers
{
	h.(areas).destroy:
	{
		i.area;
		new sampArea = area.getArea();

		if (IsValidDynamicArea(sampArea))
		{
			DestroyDynamicArea(sampArea);
		}

		area.getPlayers().each(player, index)
		{
			player.getAreas().removeInteger(area);
		}

		return 1;
	}

	h.(players).enterArea:
	{
		i.player;
		i.area;

		if (!player.hasVehicle())
		{
			return 1;
		}

		new vehicle = player.getVehicle();
		new vehicleAreas = vehicle.getAreas();

		if (vectors.(vehicleAreas).hasInteger(area))
		{
			return 1;
		}

		vectors.(vehicleAreas).addInteger(area);
		emit(vehicles, "enterArea", M:i(vehicle).i(area));
		return 1;
	}

	h.(players).leaveArea:
	{
		i.player;
		i.area;

		if (!player.hasVehicle())
		{
			return 1;
		}

		new vehicle = player.getVehicle();
		new vehicleAreas = vehicle.getAreas();

		if (!vectors.(vehicleAreas).hasInteger(area))
		{
			return 1;
		}

		emit(vehicles, "leaveArea", M:i(vehicle).i(area));
		vectors.(vehicleAreas).removeInteger(area);
		return 1;
	}

	h.(players).destroy:
	{
		i.player;

		player.getAreas().each(area, index)
		{
			area.getPlayers().removeInteger(player);
		}

		return 1;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This