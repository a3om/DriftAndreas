#define these vehicles // b6
#define These Vehicles // B6
#define this vehicle
#define This Vehicle

// ----------------------------------------------------------------------

k(player, key, up, down)
{
	if (key == keys.Action || key == keys.Fire)
	{
		if (player.hasVehicle() && player.getVehiclePassenger().isDriver())
		{
			new vehicle = player.getVehicle();
			new vehicles.component = vehicle.findComponentBySlot(vehicles.components.Nitro);
			
			if (vehicles.component.exists())
			{
				vehicle.getPhysic().setComponent(vehicles.component);
			}
		}
	}
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This