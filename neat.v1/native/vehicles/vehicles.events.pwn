#define these vehicles // b6
#define These Vehicles // B6
#define this vehicle
#define This Vehicle

// ----------------------------------------------------------------------



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

on.death(vehicle)
{
	log("SAMP транспорт был уничтожен // vehicle = %d", vehicle);

	new this = these.findBySampVehicle(vehicle);

	if (!this.exists())
	{
		err("Не удалось найти физический транспорт по самп-транспорту // sampVehicle = %d", vehicle);
		return;
	}

	vehicle = this.getVehicle();
	vehicle.setDead(true);
	log("Транспорт был уничтожен // vehicle = %d", vehicle);
	emit(vehicles, #death, M:i(vehicle));
	log("Транспорт был уничтожен (после emit) // vehicle = %d", vehicle);
}

on.spawn(vehicle)
{
	log("SAMP Транспорт был заспавнен // sampVehicle = %d", vehicle);

	new this = these.findBySampVehicle(vehicle);

	if (!this.exists())
	{
		err("Не удалось найти физический транспорт по самп-транспорту // sampVehicle = %d", vehicle);
		return;
	}

	vehicle = this.getVehicle();
	log("Транспорт был системно заспавнен // vehicle = %d", vehicle);

	if (vehicle.getDisableAfterDeath())
	{
		this.destroy();
		vehicle.getArea().destroy();
		vehicle.setArea(-1);
		return;
	}

	this.destroy();
	vehicle.setPosition(vehicle.getSpawnPosition());
	vehicles.Physic(vehicle);
	log("Создали физический транспорт");
}

@on.(players).enterVehicle(player, vehicle, ispassenger)
{
	new this = these.findBySampVehicle(vehicle);

	if (!this.exists())
	{
		err("Не удалось найти физический транспорт по самп-транспорту // player = %d, sampVehicle = %d", player, vehicle);
		return;
	}

	emit(players, #tryToEnterVehicle, M:i(player).si(#vehicle, this.getVehicle()).si(#asDriver, !ispassenger).si(#asPassenger, ispassenger));
}

on.damageStatusUpdate(vehicle, player)
{
	new this = these.findBySampVehicle(vehicle);

	if (!this.exists())
	{
		err("Не удалось найти физический транспорт по самп-транспорту // player = %d, sampVehicle = %d", player, vehicle);
		return;
	}

	vehicle = this.getVehicle();
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
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This