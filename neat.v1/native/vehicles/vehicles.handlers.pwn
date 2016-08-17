#define these vehicles // b6
#define These Vehicles // B6
#define this vehicle
#define This Vehicle

// ----------------------------------------------------------------------

handlers
{
	h.(these).create:
	{
		i.this;
		this.setArea(SphereArea(this.getPosition(), these.StreamDistance).setClass(these).setIndex(this));
		return 0;
	}

	h.(these).death:
	{
		// i.vehicle;
		// vehicle.setSpawnPosition(vehicle.getPosition());
		// vehicle.disableAfterDeath(true);
		return 0;
	}

	h.(areas).destroy:
	{
		i.area;

		if (area.hasAttachingVehicle())
		{
			area.getAttachingVehicle().getAttachedAreas().removeInteger(area);
		}

		return 0;
	}

	// ----------------------------------------------------------------------

	h.(players).enterArea:
	{
		i.player;
		i.area;

		if (area.getClass() != these)
		{
			return 0;
		}

		new vehicle = area.getIndex();

		if (vehicle.getArea() != area)
		{
			return 0;
		}

		if (!vehicle.hasPhysic())
		{
			vehicles.Physic(vehicle);
			emit(vehicles, "streamIn", M:i(vehicle));
			return 0;
		}

		new vehicles.physic = vehicle.getPhysic();

		if (vehicles.physic.findStreamerByPlayer(player).exists())
		{
			err("Физический транспорт уже имеет такого игрока в качестве стримера");
			return 0;
		}

		vehicles.Streamer(vehicles.physic, player);
		return 0;
	}

	h.(players).leaveArea:
	{
		i.player;
		i.area;

		if (area.getClass() != these)
		{
			return 0;
		}

		new vehicle = area.getIndex();

		if (vehicle.getArea() != area)
		{
			return 0;
		}

		if (!vehicle.hasPhysic())
		{
			return 0;
		}

		new vehicles.streamer = vehicle.getPhysic().findStreamerByPlayer(player);

		if (!vehicles.streamer.exists())
		{
			err("Физический транспорт не имеет такого игрока в качестве стримера");
			return 0;
		}
		
		vehicles.streamer.destroy();
		return 0;
	}

	h.(players).getPosition:
	{
		i.player;

		if (!player.hasVehicle())
		{
			return 0;
		}

		i.position;
		position.copyFrom(player.getVehicle().getPosition());
		return 1;
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.physics // ba
#define These vehicles.Physics // BA
#define this vehicles.physic
#define This vehicles.Physic

// ----------------------------------------------------------------------

handlers
{
	h.(these).destroy:
	{
		i.this;
		new vehicle = this.getVehicle();
		vehicle.getArea().detachFromVehicle();
		vehicle.setPhysic(-1).setPosition(this.getPosition());
		
		new Float:health;
		this.getHealth(health);
		vehicle.setHealth(health);
		vehicle.setDamageStatus(this.getDamageStatus());

		this.getStreamers().each(vehicles.streamer, index)
		{
			vehicles.streamer.destroy();
		}

		this.getPassengers().each(vehicles.passenger, index)
		{
			vehicles.passenger.destroy();
		}

		this.getSurfers().each(vehicles.surfer, index)
		{
			vehicles.surfer.destroy();
		}

		if (vehicle.getDisableAfterDeath() && vehicle.isDead())
		{
			vehicle.getArea().destroy();
			vehicle.setArea(-1);
		}

		DestroyVehicle(this.getSampVehicle());
		return 0;
	}

	h.(players).update:
	{
		i.player;

		if (!player.hasVehicle())
		{
			return 0;
		}

		new vehicle = player.getVehicle();
		new this = vehicle.getPhysic();
		new Float:health, Float:lastHealth;
		this.getHealth(health).getLastHealth(lastHealth);

		if (health < lastHealth)
		{
			emit(vehicles, "crash", M:i(vehicle).f(health));
			this.setLastHealth(health);
		}
		else if (health > lastHealth)
		{
			emit(vehicles, "fix", M:i(vehicle).f(health));
			this.setLastHealth(health);
		}

		if (this.isUpsideDown())
		{
			if (!this.getLastUpsideDown())
			{
				emit(vehicles, "upsideDown", M:i(vehicle));
				this.setLastUpsideDown(true);
			}
		}
		else
		{
			if (this.getLastUpsideDown())
			{
				emit(vehicles, "flip", M:i(vehicle));
				this.setLastUpsideDown(false);
			}
		}

		return 0;
	}

	h.(timers).15s:
	{
		these.existent().each(this, index)
		{
			new vehicle = this.getVehicle();
			new vehicles.component = vehicle.findComponentBySlot(vehicles.components.Nitro);

			if (!vehicles.component.exists())
			{
				continue;
			}

			new vehicles.passenger = this.findPassengerBySeat(0);

			if (!vehicles.passenger.exists())
			{
				continue;
			}

			new player = vehicles.passenger.getPlayer();

			if (player.isKeyDown(keys.Action))
			{
				this.setComponent(vehicles.component);
			}
		}
	}

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.streamers // b9
#define These vehicles.Streamers // B9
#define this vehicles.streamer
#define This vehicles.Streamer

// ----------------------------------------------------------------------

handlers
{
	h.(players).destroy:
	{
		i.player;

		player.getVehicleStreamers().each(vehicles.streamer, index)
		{
			vehicles.streamer.destroy();
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

#define these vehicles.passengers // bc
#define These vehicles.Passengers // BC
#define this vehicles.passenger
#define This vehicles.Passenger

// ----------------------------------------------------------------------

handlers
{
	h.(players).destroy:
	{
		i.player;

		if (!player.hasVehicle())
		{
			return 1;
		}

		player.getVehiclePassenger().destroy();
		return 1;
	}

	h.(players).update:
	{
		i.player;
		new sampVehicle = GetPlayerVehicleID(player);

		if (sampVehicle == 0 || sampVehicle == INVALID_VEHICLE_ID)
		{
			if (!player.hasVehicle())
			{
				return 1;
			}

			new vehicle = player.getVehicle();
			new vehicles.passenger = player.getVehiclePassenger();
			emit(players, #exitVehicle, M:i(player).i(vehicle).i(vehicles.passenger));
			vehicles.passenger.destroy();
			return 1;
		}

		new vehicles.physic = vehicles.physics.findBySampVehicle(sampVehicle);

		if (!vehicles.physic.exists()) // если не удалось найти физический транспорт по самп-транспорту
		{
			if (!player.hasVehicle()) // если игрок не находился в транспорте
			{
				return 1;
			}

			new vehicle = player.getVehicle();
			new vehicles.passenger = player.getVehiclePassenger();
			emit(players, #exitVehicle, M:i(player).i(vehicle).i(vehicles.passenger));
			vehicles.passenger.destroy();
			return 1;
		}

		new vehicle = vehicles.physic.getVehicle();
		new seat = GetPlayerVehicleSeat(player);

		if (!player.hasVehicle()) // если игрок не находился в транспорте
		{
			new vehicles.passenger = vehicles.Passenger(player, vehicles.physic, seat);
			emit(players, #enterVehicle, M:i(player).i(vehicle).i(vehicles.passenger));
			return 1;
		}

		new vehicle1 = player.getVehicle();

		if (vehicle1 != vehicle) // если транспорт игрока изменился
		{
			new vehicles.passenger = player.getVehiclePassenger();
			emit(players, #exitVehicle, M:i(player).i(vehicle).i(vehicles.passenger));
			vehicles.passenger.destroy();
			vehicles.passenger = vehicles.Passenger(player, vehicles.physic, seat);
			emit(players, #enterVehicle, M:i(player).si(#vehicle, vehicle1).i(vehicles.passenger));
			// emit(players, #changeVehicle, M:i(player).si(#vehicle0, vehicle1).si(#vehicle1, vehicle).i(vehicles.passenger));
			return 1;
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

#define these vehicles.surfers // c0
#define These vehicles.Surfers // C0
#define this vehicles.surfer
#define This vehicles.Surfer

// ----------------------------------------------------------------------

handlers
{
	h.(players).destroy:
	{
		i.player;

		if (!player.hasSurfingVehicle())
		{
			return 1;
		}

		player.getVehicleSurfer().destroy();
		return 1;
	}

	h.(players).update:
	{
		i.player;
		new sampVehicle = GetPlayerSurfingVehicleID(player);

		if (sampVehicle == 0 || sampVehicle == INVALID_VEHICLE_ID)
		{
			if (!player.hasSurfingVehicle())
			{
				return 1;
			}

			new vehicles.surfer = player.getVehicleSurfer();
			emit(players, #climbDownVehicle, M:i(player).si(#vehicle, player.getSurfingVehicle()).i(vehicles.surfer));
			vehicles.surfer.destroy();
			return 1;
		}

		new vehicles.physic = vehicles.physics.findBySampVehicle(sampVehicle);

		if (!vehicles.physic.exists()) // если не удалось найти физический транспорт по самп-транспорту
		{
			if (!player.hasSurfingVehicle()) // если игрок не находился на транспорте
			{
				return 1;
			}

			new vehicles.surfer = player.getVehicleSurfer();
			emit(players, #climbDownVehicle, M:i(player).si(#vehicle, player.getSurfingVehicle()).i(vehicles.surfer));
			vehicles.surfer.destroy();
			return 1;
		}

		new vehicle = vehicles.physic.getVehicle();

		if (!player.hasSurfingVehicle()) // если игрок не находился на транспорте
		{
			new vehicles.surfer = vehicles.Surfer(player, vehicles.physic);
			emit(players, #climbUpVehicle, M:i(player).i(vehicle).i(vehicles.surfer));
			return 1;
		}

		new vehicle1 = player.getSurfingVehicle();

		if (vehicle1 != vehicle) // если транспорт игрока изменился
		{
			new vehicles.surfer = player.getVehicleSurfer();
			emit(players, #climbDownVehicle, M:i(player).si(#vehicle, vehicle1).i(vehicles.surfer));
			vehicles.surfer.destroy();
			vehicles.surfer = vehicles.Surfer(player, vehicles.physic);
			emit(players, #climbUpVehicle, M:i(player).i(vehicle).i(vehicles.surfer));
			emit(players, #jumpVehicle, M:i(player).si(#vehicle0, vehicle1).si(#vehicle1, vehicle).i(vehicles.surfer));
			return 1;
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