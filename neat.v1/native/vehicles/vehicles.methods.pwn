#define these vehicles // b6
#define These Vehicles // B6
#define this vehicle
#define This Vehicle

// ----------------------------------------------------------------------

initialize()
{
	ManualVehicleEngineAndLights();
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(vehicles.model, position = -1, color1[] = #ffffff, color2[] = #ffffff, class = -1, index = -1)
{
	vehicles.model %= 400;

	if (!vehicles.model.exists())
	{
		err("Модели транспорта не существует");
		return -1;
	}

	if (!position.exists())
	{
		position = Position();
	}

	if (!color1.isValid())
	{
		err("Первый цвет транспорта неверный");
		return -1;
	}

	if (!color2.isValid())
	{
		err("Второй цвет транспорта неверный");
		return -1;
	}

	if (!vehicles.colors.findByColor(color1).exists())
	{
		err("Невозможно найти первый цвет транспорта в цветах транспорта");
		return -1;
	}

	if (!vehicles.colors.findByColor(color2).exists())
	{
		err("Невозможно найти второй цвет транспорта в цветах транспорта");
		return -1;
	}

	new this = create();
	si(Class, class);
	si(Index, index);
	si(Model, vehicles.model);
	sf(SpawnPosX, position.getX());
	sf(SpawnPosY, position.getY());
	sf(SpawnPosZ, position.getZ());
	sf(SpawnPosR, position.getR());
	sf(PosX, position.getX());
	sf(PosY, position.getY());
	sf(PosZ, position.getZ());
	sf(PosR, position.getR());
	ss(Color1, color1);
	ss(Color2, color2);
	gm(DamageStatus).si(#panels, 0).si(#doors, 0).si(#lights, 0).si(#tires, 0);
	gm(Params).si(#engine, 1).si(#lights, 1).si(#alarm, 0).si(#doors, 0).si(#bonnet, 0).si(#boot, 0).si(#objective, 0);
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (this.hasArea())
	{
		if (this.hasPhysic())
		{
			this.getPhysic().destroy();
		}

		this.getArea().destroy();
	}
	
	this.getAttachedAreas().each(area, index)
	{
		area.detachFromVehicle();
	}

	destroy();
}

// ----------------------------------------------------------------------

is.getClass(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gi(Class);
}

is.setClass(this, class)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	si(Class, class);
	return this;
}

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gi(Index);
}

is.setIndex(this, index)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	si(Index, index);
	return this;
}

is.getModel(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gi(Model);
}

is.getSpawnPosition(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return Position().setXYZR(gf(SpawnPosX), gf(SpawnPosY), gf(SpawnPosZ), gf(SpawnPosR));
}

is.getPosition(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (this.hasPhysic())
	{
		return this.getPhysic().getPosition();
	}

	return Position().setXYZR(gf(PosX), gf(PosY), gf(PosZ), gf(PosR));
}

is.getColor1(this)
{
	new color[colors.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Транспорта не существует");
		return color;
	}

	gs(Color1, color);
	return color;
}

is.setColor1(this, color[])
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!color.isValid())
	{
		err("Невалидный цвет для установки транспорту");
		return this;
	}

	if (!vehicles.colors.findByColor(color).exists())
	{
		err("Не найден цвет транспорта");
		return this;
	}

	ss(Color1, color);

	if (this.hasPhysic())
	{
		this.getPhysic().setColors(this.getColor1(), this.getColor2());
	}

	return this;
}

is.getColor2(this)
{
	new color[colors.MaxColorLength + 1];

	if (!this.exists())
	{
		err("Транспорта не существует");
		return color;
	}

	gs(Color2, color);
	return color;
}

is.setColor2(this, color[])
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!color.isValid())
	{
		err("Невалидный цвет для установки транспорту");
		return this;
	}

	if (!vehicles.colors.findByColor(color).exists())
	{
		err("Не найден цвет транспорта");
		return this;
	}

	ss(Color2, color);

	if (this.hasPhysic())
	{
		this.getPhysic().setColors(this.getColor1(), this.getColor2());
	}

	return this;
}

is.setColors(this, color1[], color2[])
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!color1.isValid())
	{
		err("Невалидный первый цвет для установки транспорту");
		return this;
	}

	if (!color2.isValid())
	{
		err("Невалидный второй цвет для установки транспорту");
		return this;
	}

	if (!vehicles.colors.findByColor(color1).exists())
	{
		err("Не найден первый цвет транспорта");
		return this;
	}

	if (!vehicles.colors.findByColor(color2).exists())
	{
		err("Не найден второй цвет транспорта");
		return this;
	}

	ss(Color1, color1);
	ss(Color2, color2);

	if (this.hasPhysic())
	{
		this.getPhysic().setColors(this.getColor1(), this.getColor2());
	}

	return this;
}

is.setSpawnPosition(this, position)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:r;
	position.getXYZR(x, y, z, r);
	sf(SpawnPosX, x);
	sf(SpawnPosY, y);
	sf(SpawnPosZ, z);
	sf(SpawnPosR, r);
	return this;
}

is.setPosition(this, position)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:r;
	position.getXYZR(x, y, z, r);
	sf(PosX, x);
	sf(PosY, y);
	sf(PosZ, z);
	sf(PosR, r);

	if (!this.hasArea())
	{
		return this;
	}

	if (!this.hasPhysic())
	{
		this.getArea().setPosition(position);
		return this;
	}
	
	this.getPhysic().setPosition(position);
	return this;
}

is.getDisableAfterDeath(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return gi(DisableAfterDeath);
}

is.setDisableAfterDeath(this, set)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	si(DisableAfterDeath, set);
	return this;
}

fs.getHealth(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return 0.0;
	}

	if (!this.hasPhysic())
	{
		return gf(Health);
	}

	new Float:health;
	this.getPhysic().getHealth(health);
	return health;
}

is.setHealth(this, Float:health)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (health < 250.0)
	{
		health = 250.0;
	}

	sf(Health, health);

	if (this.hasPhysic())
	{
		this.getPhysic().setHealth(health);
	}

	return this;
}

is.getDamageStatus(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.hasPhysic())
	{
		return gm(DamageStatus);
	}

	return this.getPhysic().getDamageStatus();
}

is.setDamageStatus(this, damageStatus)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	gm(DamageStatus).copyFrom(damageStatus);

	if (this.hasPhysic())
	{
		this.getPhysic().setDamageStatus(damageStatus);
	}

	return this;
}

is.getParams(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gm(Params).clone();
}

is.setParams(this, params)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	gm(Params).copyFrom(params);

	if (this.hasPhysic())
	{
		this.getPhysic().setParams(params);
	}

	return this;
}

is.engine(this, running = -1)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return (running == -1) ? 0 : -1;
	}

	if (running == -1)
	{
		return this.getParams().gi(#engine);
	}

	return this.setParams(this.getParams().si(#engine, running));
}

is.engineOn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.engine(true);
}

is.engineOff(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.engine(false);
}

is.isEngineOn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getParams().gi(#engine);
}

is.lights(this, lightening = -1)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return (lightening == -1) ? 0 : -1;
	}

	if (lightening == -1)
	{
		return this.getParams().gi(#lights);
	}

	return this.setParams(this.getParams().si(#lights, lightening));
}

is.lightsOn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.lights(true);
}


is.lightsOff(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.lights(false);
}

is.isLightsOn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getParams().gi(#lights);
}

is.alarm(this, running = -1)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return (running == -1) ? 0 : -1;
	}

	if (running == -1)
	{
		return this.getParams().gi(#alarm);
	}

	return this.setParams(this.getParams().si(#alarm, running));
}

is.alarmOn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.alarm(true);
}

is.alarmOff(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.alarm(false);
}

is.isAlarmOn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getParams().gi(#lights);
}

is.doors(this, locked = -1)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return (locked == -1) ? 0 : -1;
	}

	if (locked == -1)
	{
		return this.getParams().gi(#doors);
	}

	return this.setParams(this.getParams().si(#doors, locked));
}

is.lockDoors(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.doors(true);
}

is.unlockDoors(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return this.doors(false);
}

is.isDoorsLocked(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getParams().gi(#doors);
}

is.bonnet(this, open = -1)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return (open == -1) ? 0 : -1;
	}

	if (open == -1)
	{
		return this.getParams().gi(#bonnet);
	}

	return this.setParams(this.getParams().si(#bonnet, open));
}

is.isBonnetOpen(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getParams().gi(#bonnet);
}

is.boot(this, open = -1)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return (open == -1) ? 0 : -1;
	}

	if (open == -1)
	{
		return this.getParams().gi(#boot);
	}

	return this.setParams(this.getParams().si(#boot, open));
}

is.isBootOpen(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getParams().gi(#boot);
}

// ----------------------------------------------------------------------

is.hasArea(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return gi(Area) > -1;
}

is.getArea(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gi(Area);
}

is.setArea(this, area)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	si(Area, area);
	return this;
}

// ----------------------------------------------------------------------

is.isEnabled(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.hasArea();
}

is.enable(this, set = true)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!set)
	{
		return this.disable();
	}

	if (this.isEnabled())
	{
		err("Транспорт уже активирован");
		return this;
	}

	new area = this.setArea(SphereArea(this.getPosition(), these.StreamDistance).setClass(these).setIndex(this));

	if (!area.exists())
	{
		err("Невозможно активировать транспорт");
		return -1;
	}

	si(Area, area);
	emit(these, #enable, M:i(this));
	return this;
}

is.disable(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.isEnabled())
	{
		err("Транспорт и так не активирован");
		return this;
	}

	if (this.hasArea())
	{
		if (this.hasPhysic())
		{
			this.getPhysic().destroy();
		}

		this.getArea().destroy();
		sd(Area);
	}

	this.getAttachedAreas().each(area, index)
	{
		area.detachFromVehicle();
	}

	emit(these, #disable, M:i(this));
	return this;
}

// ----------------------------------------------------------------------

is.hasPhysic(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return gi(Physic) > -1;
}

is.getPhysic(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gi(Physic);
}

is.setPhysic(this, vehicles.physic)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	si(Physic, vehicles.physic);
	return this;
}

// ----------------------------------------------------------------------

is.respawn(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.hasArea())
	{
		return this;
	}

	if (this.hasPhysic())
	{
		this.getPhysic().destroy();
	}

	this.setPosition(this.getSpawnPosition());
	vehicles.Physic(this);
	return this;
}

is.update(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.hasPhysic())
	{
		return this;
	}

	new vehicles.physic = this.getPhysic();
	new vector = Vector(); // для хранения карт с данными игроков-пассажиров

	vehicles.physic.getPassengers().each(vehicles.passenger, index)
	{
		vector.addInteger(M:si(#player, vehicles.passenger.getPlayer()).si(#seat, vehicles.passenger.getSeat()));
	}

	vehicles.physic.destroy();
	vehicles.Physic(this);

	vector.each(map, index)
	{
		new player = map.gi(#player);
		player.putInVehicle(vehicle, map.gi(#seat));
	}

	return this;
}

is.repair(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	vehicle.setHealth(1000.0);
	vehicle.setDamageStatus(M:si(#panels, 0).si(#doors, 0).si(#lights, 0).si(#tires, 0));

	if (!this.hasPhysic())
	{
		return this;
	}

	this.getPhysic().repair();
	return this;
}

is.flip(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.hasPhysic())
	{
		return this;
	}

	this.getPhysic().flip();
	return this;
}

is.getNumber(this)
{
	new number[these.MaxNumberLength + 1];

	if (!this.exists())
	{
		err("Транспорта не существует");
		return number;
	}

	gs(Number, number);
	return number;
}

is.setNumber(this, number[])
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	ss(Number, number);
	return this;
}

is.getPaintjob(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gi(Paintjob);
}

is.setPaintjob(this, paintjob)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (paintjob < 0 || paintjob > 4)
	{
		paintjob = -1;
	}

	si(Paintjob, paintjob);
	return this;
}

is.isDead(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return gi(Dead);
}

is.setDead(this, dead)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	si(Dead, dead);
	return this;
}

// ----------------------------------------------------------------------

is.getAttachedAreas(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gv(AttachedAreas);
}

// ----------------------------------------------------------------------

is.getComponents(this)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return gv(Components);
}

is.hasComponent(this, vehicles.component)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	return this.getComponents().hasInteger(vehicles.component);
}

is.setComponent(this, vehicles.component)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.getModel().hasComponent(vehicles.component))
	{
		err("Модель данного транспорта не поддерживает данный компонент транспорта");
		return this;
	}

	if (!this.hasComponent(vehicles.component))
	{
		this.getComponents().addInteger(vehicles.component);
	}

	if (!this.hasPhysic())
	{
		return this;
	}

	this.getPhysic().setComponent(vehicles.component);
	return this;
}

is.removeComponent(this, vehicles.component)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!this.hasComponent(vehicles.component))
	{
		return this;
	}

	this.getComponents().removeInteger(vehicles.component);

	if (!this.hasPhysic())
	{
		return this;
	}

	this.getPhysic().removeComponent(vehicles.component);
	return this;
}

is.findComponentBySlot(this, slot)
{
	if (!this.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	this.getComponents().each(vehicles.component, index)
	{
		if (vehicles.component.getSlot() != slot)
		{
			continue;
		}

		return vehicles.component;
	}

	return -1;
}

// ----------------------------------------------------------------------

@is.(players).setVehicle(player, vehicle)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	@si.(Players).(Vehicle, player, vehicle);
	return player;
}

@is.(players).getVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(Vehicle, player);
}

@is.(players).hasVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return player.getVehicle().exists();
}

// ----------------------------------------------------------------------

@is.(players).putInVehicle(player, vehicle, seat = -1)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (!vehicle.exists())
	{
		err("Транспорта не существует");
		return this;
	}

	if (player.hasVehicle())
	{
		if (player.getVehicle() == vehicle)
		{
			if (player.getVehiclePassenger().getSeat() == seat)
			{
				PutPlayerInVehicle(player, vehicle.getPhysic().getSampVehicle(), seat);
				return this;
			}
		}
	}

	if (!vehicle.hasPhysic())
	{
		vehicles.Physic(this);

		if (!vehicle.hasPhysic())
		{
			err("Не удалось создать физический транспорт");
			return this;
		}
	}

	new vehicles.physic = this.getPhysic();

	if (seat > -1)
	{
		if (vehicles.physic.findPassengerBySeat(seat).exists())
		{
			err("На месте транспорта, куда мы хотим переместить игрока, уже сидит другой игрок");
			return this;
		}

		PutPlayerInVehicle(player, vehicles.physic.getSampVehicle(), seat);
		return this;
	}

	seat = vehicles.physic.findFreeSeat();

	if (seat < 0)
	{
		return this;
	}

	PutPlayerInVehicle(player, vehicles.physic.getSampVehicle(), seat);
	return this;
}

@is.(players).leaveVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (!player.hasVehicle())
	{
		err("Игрок не находится в транспорте");
		return player;
	}

	new vehicle = player.getVehicle();

	if (!vehicle.hasPhysic())
	{
		err("Данный транспорт не имеет физического транспорта");
		return player;
	}

	RemovePlayerFromVehicle(player);
	return player;
}

@is.(players).throwFromVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	if (!player.hasVehicle())
	{
		err("Игрок не находится в транспорте");
		return player;
	}

	new vehicle = player.getVehicle();

	if (!vehicle.hasPhysic())
	{
		err("Данный транспорт не имеет физического транспорта");
		return player;
	}

	new vehicles.physic = vehicle.getPhysic();
	new position = vehicles.physic.getPosition();
	position.setZ(position.getZ() + 2.0);
	player.setPosition(position);
	return player;
}

@is.(players).stopEnterVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	player.setSpecialAction(SPECIAL_ACTION_DANCE1).setSpecialAction(SPECIAL_ACTION_NONE);
	return player;
}

@is.(players).getStreamingVehicles(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gv.(Players).(StreamingVehicles, player)
}

@is.(players).getVehicleStreamers(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gv.(Players).(VehicleStreamers, player);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.colors // b7
#define These vehicles.Colors // B7
#define this vehicles.color
#define This vehicles.Color

// ----------------------------------------------------------------------

initialize()
{
	new file = File("vehicles/colors.txt");
	new string[1024];

	while (file.readLine(string))
	{
		new integer, color[colors.MaxColorLength + 1];

		if (sscanf(string.trim(), "p<\t>ds[7]", integer, color))
		{
			err("Не удалось разобрать строку");
			continue;
		}

		This(color, integer);
	}

	file.close();
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(color[], integer)
{
	new this = create();
	ss(Color, color);
	si(Integer, integer);
	return this;
}

is.getColor(this)
{
	new color[colors.MaxColorLength + 1];

	if (!this.exists())
	{
		return color;
	}

	gs(Color, color);
	return color;
}

is.findByColor(color[])
{
	if (!color.isValid())
	{
		err("Неправильный цвет");
		return -1;
	}

	existent().each(this, index)
	{
		if (!this.getColor().is(color))
		{
			continue;
		}

		return this;
	}

	return -1;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.models // b8
#define These vehicles.Models // B8
#define this vehicles.model
#define This vehicles.Model

// ----------------------------------------------------------------------

dependencies()
{
	d(vehicles.components);
}

initialize()
{
	new file = File("vehicles/models.txt");
	new string[1024];

	while (file.readLine(string))
	{
		new this, name[these.MaxNameLength + 1], capacity, components[280 + 1];
		new formatter[32];
		strings.(formatter).format("p<\t>ds[%d]ds[%d]", these.MaxNameLength + 1, sizeof components);

		if (sscanf(string.trim(), formatter, this, name, capacity, components))
		{
			strings.(formatter).format("p<\t>ds[%d]d", these.MaxNameLength + 1);

			if (sscanf(string.trim(), formatter, this, name, capacity))
			{
				err("Не удалось разобрать строку");
				continue;
			}
		}

		This(this, name, capacity, strings.(components).hexify(2));
	}

	file.close();
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(this, name[], capacity, components)
{
	this = create(this);
	ss(Name, name);
	si(Capacity, capacity);

	vectors.(components).each(vehicles.component, index)
	{
		if (!vehicles.component.exists())
		{
			err("Компонента транспорта не существует");
			continue;
		}

		gv(Components).addInteger(vehicles.component);
	}

	return this;
}

is.findByName(name[], approximate = false)
{
	if (strings.(name).isEmpty())
	{
		err("Пустое название модели транспорта");
		return -1;
	}

	existent().each(this, index)
	{
		if (approximate)
		{
			if (this.getName().find(name, .ignoreCase = true) < 0)
			{
				continue;
			}

			return this;
		}

		if (!this.getName().is(name))
		{
			continue;
		}

		return this;
	}

	return -1;
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Модели транспорта не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.getCapacity(this)
{
	if (!this.exists())
	{
		err("Модели транспорта не существует");
		return 0;
	}

	return gi(Capacity);
}

is.getComponents(this)
{
	if (!this.exists())
	{
		err("Модели транспорта не существует");
		return -1;
	}

	return gv(Components);
}

is.hasComponent(this, vehicles.component)
{
	if (!this.exists())
	{
		err("Модели транспорта не существует");
		return false;
	}

	return this.getComponents().hasInteger(vehicles.component);
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

initialize()
{
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(vehicles.physic, player)
{
	if (!vehicles.physic.exists())
	{
		err("Невозможно создать стримера транспорта, физического транспорта не существует");
		return -1;
	}

	new this = create();
	si(Physic, vehicles.physic);
	si(Player, player);
	vehicles.physic.getStreamers().addInteger(this);
	player.getVehicleStreamers().addInteger(this);
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Стримера транспорта не существует");
		return;
	}

	this.getPhysic().getStreamers().removeInteger(this);
	this.getPlayer().getVehicleStreamers().removeInteger(this);
	destroy();
}

// ----------------------------------------------------------------------

is.getPhysic(this)
{
	if (!this.exists())
	{
		err("Стримера транспорта не существует");
		return -1;
	}

	return gi(Physic);
}

is.getPlayer(this)
{
	if (!this.exists())
	{
		err("Стримера транспорта не существует");
		return -1;
	}

	return gi(Player);
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

initialize()
{
	setInterval(#these.StreamOutTimer, 1 * 1000, "");
	return true;
}

ip.StreamOutTimer()
{
	new timestamp = Timestamp();

	existent().each(this, index)
	{
		if (!this.canDestroy())
		{
			continue;
		}

		if (this.getCreatedAt() + these.MaxAloneStreamTime > timestamp)
		{
			continue;
		}

		log("Решили уничтожить физический транспорт");
		new vehicle = this.getVehicle();
		emit(vehicles, "streamOut", M:i(vehicle));
		this.destroy();
	}
}

// ----------------------------------------------------------------------

@foundation;

is.create(vehicle)
{
	if (!vehicle.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	if (!vehicle.hasArea())
	{
		err("Транспорт не активирован, мы не можем создать физический транспорт");
		return -1;
	}

	new Float:posX, Float:posY, Float:posZ, Float:posR;
	vehicle.getPosition().getXYZR(posX, posY, posZ, posR);
	new color1 = vehicles.colors.findByColor(vehicle.getColor1());
	new color2 = vehicles.colors.findByColor(vehicle.getColor2());
	new sampVehicle = CreateVehicle(400 + vehicle.getModel(), posX, posY, posZ, posR, color1, color2, -1);

	if (sampVehicle == INVALID_VEHICLE_ID)
	{
		err("Невозможно создать физический транспорт");
		return -1;
	}

	new this = create();
	this.setSampVehicle(sampVehicle);
	this.setVehicle(vehicle);
	si(CreatedAt, Timestamp());

	SetVehicleNumberPlate(sampVehicle, vehicle.getNumber());

	if (vehicle.isDead())
	{
		vehicle.setHealth(1000.0);
		vehicle.setDamageStatus(M:si(#panels, 0).si(#doors, 0).si(#lights, 0).si(#tires, 0));
		vehicle.setDead(false);
	}

	if (vehicle.getHealth() < 1000.0)
	{
		SetVehicleHealth(sampVehicle, vehicle.getHealth());
	}

	if (vehicle.getPaintjob() != -1)
	{
		ChangeVehiclePaintjob(sampVehicle, vehicle.getPaintjob());
	}

	this.setDamageStatus(vehicle.getDamageStatus());
	this.setParams(vehicle.getParams());
	vehicle.setPhysic(this);
	vehicle.getArea().attachToVehicle(vehicle);

	vehicle.getArea().getPlayers().each(player, index)
	{
		vehicles.Streamer(this, player);
	}

	vehicle.getComponents().each(vehicles.component, index)
	{
		this.setComponent(vehicles.component);
	}

	emit(vehicles, #spawn, M:i(vehicle));
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return;
	}

	log("Физический транспорт был разрушен // this = %d", this);
	destroy();
}

// ----------------------------------------------------------------------

is.getCreatedAt(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return 0;
	}

	return gi(CreatedAt);
}

// ----------------------------------------------------------------------

is.findBySampVehicle(sampVehicle)
{
	existent().each(this, index)
	{
		if (this.getSampVehicle() != sampVehicle)
		{
			continue;
		}

		return this;
	}

	return -1;
}

// ----------------------------------------------------------------------

is.getVehicle(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	return gi(Vehicle);
}

is.setVehicle(this, vehicle)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	si(Vehicle, vehicle);
	return this;
}

is.getSampVehicle(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return INVALID_VEHICLE_ID;
	}

	return gi(SampVehicle);
}

is.setSampVehicle(this, sampVehicle)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	si(SampVehicle, sampVehicle);
	return this;
}

is.getStreamers(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	return gv(Streamers);
}

// ----------------------------------------------------------------------

is.findStreamerByPlayer(this, player)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	this.getStreamers().each(vehicles.streamer, index)
	{
		if (vehicles.streamer.getPlayer() != player)
		{
			continue;
		}

		return vehicles.streamer;
	}

	return -1;
}

// ----------------------------------------------------------------------

is.getPosition(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	new sampVehicle = this.getSampVehicle();
	new Float:x, Float:y, Float:z, Float:r;
	GetVehiclePos(sampVehicle, x, y, z);
	GetVehicleZAngle(sampVehicle, r);
	return Position().setXYZR(x, y, z, r);
}

is.setPosition(this, position)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	new sampVehicle = gi(SampVehicle);
	new Float:x, Float:y, Float:z, Float:r;
	position.getXYZR(x, y, z, r);
	SetVehiclePos(sampVehicle, x, y, z);
	SetVehicleZAngle(sampVehicle, r);
	return this;
}

is.setColors(this, color1[], color2[])
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	if (!color1.isValid())
	{
		err("Первый цвет невалидный");
	}

	if (!color2.isValid())
	{
		err("Второй цвет невалидный");
	}

	new vehicles.color1 = vehicles.colors.findByColor(color1);

	if (!vehicles.color1.exists())
	{
		err("Первого цвета транспорта не существует");
		return this;
	}

	new vehicles.color2 = vehicles.colors.findByColor(color2);

	if (!vehicles.color2.exists())
	{
		err("Второго цвета транспорта не существует");
		return this;
	}

	ChangeVehicleColor(this.getSampVehicle(), vehicles.color1, vehicles.color2);
	return this;
}

is.setHealth(this, Float:health)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	SetVehicleHealth(this.getSampVehicle(), health);
	return this;
}

is.getHealth(this, &Float:health)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		health = 0.0;
		return -1;
	}

	GetVehicleHealth(this.getSampVehicle(), health);
	return this;
}

is.setLastHealth(this, Float:lastHealth)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	sf(LastHealth, lastHealth);
	return this;
}

is.getLastHealth(this, &Float:lastHealth)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		lastHealth = 0.0;
		return -1;
	}

	lastHealth = gf(LastHealth);
	return this;
}

is.getDamageStatus(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	new panels, doors, lights, tires;
	GetVehicleDamageStatus(this.getSampVehicle(), panels, doors, lights, tires);
	return M:i(panels).i(doors).i(lights).i(tires);
}

is.setDamageStatus(this, damageStatus)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	new panels, doors, lights, tires;
	panels = maps.(damageStatus).gi(#panels);
	doors = maps.(damageStatus).gi(#doors);
	lights = maps.(damageStatus).gi(#lights);
	tires = maps.(damageStatus).gi(#tires);
	UpdateVehicleDamageStatus(this.getSampVehicle(), panels, doors, lights, tires);
	return this;
}

is.setParams(this, params)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	new engine, lights, alarm, doors, bonnet, boot, objective;
	engine = maps.(params).gi(#engine);
	lights = maps.(params).gi(#lights);
	doors = maps.(params).gi(#doors);
	bonnet = maps.(params).gi(#bonnet);
	boot = maps.(params).gi(#boot);
	objective = maps.(params).gi(#objective);
	SetVehicleParamsEx(this.getSampVehicle(), engine, lights, alarm, doors, bonnet, boot, objective);
	return this;
}

is.repair(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	RepairVehicle(this.getSampVehicle());
	return this;
}

is.getLastUpsideDown(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return false;
	}

	return gi(LastUpsideDown);
}

is.setLastUpsideDown(this, lastUpsideDown)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	si(LastUpsideDown, lastUpsideDown);
	return this;
}

is.isUpsideDown(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return false;
	}

	new Float:x, Float:y, Float:z, Float:w, Float:ry;
	GetVehicleRotationQuat(this.getSampVehicle(), w, x, y, z);
	ry = atan2(2 * (y * z + w * x), (w * w - x * x) - (y * y - z * z));
	return (ry > 90.0 || ry < -90.0);
}

is.flip(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return false;
	}

	new Float:velocity[3];
	GetVehicleVelocity(this.getSampVehicle(), velocity[0], velocity[1], velocity[2]);
	this.setPosition(this.getPosition());
	SetVehicleVelocity(this.getSampVehicle(), velocity[0], velocity[1], velocity[2]);
	return this;
}

is.setComponent(this, vehicles.component)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	// log("vehicle = %d, component = %d", this.getSampVehicle(), 1000 + vehicles.component.getPart0());
	AddVehicleComponent(this.getSampVehicle(), 1000 + vehicles.component.getPart0());

	if (vehicles.component.hasPart1())
	{
		// log("vehicle = %d, component = %d", this.getSampVehicle(), 1000 + vehicles.component.getPart1());
		AddVehicleComponent(this.getSampVehicle(), 1000 + vehicles.component.getPart1());
	}

	return this;
}

is.removeComponent(this, vehicles.component)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	RemoveVehicleComponent(this.getSampVehicle(), 1000 + vehicles.component.getPart0());

	if (vehicles.component.hasPart1())
	{
		RemoveVehicleComponent(this.getSampVehicle(), 1000 + vehicles.component.getPart1());
	}

	return this;
}

is.canDestroy(this)
{
	if (!this.exists())
	{
		err("Физического транспорта не существует");
		return false;
	}

	if (this.getStreamers().length() > 0)
	{
		return false;
	}

	if (this.getPassengers().length() > 0)
	{
		return false;
	}

	if (this.getSurfers().length() > 0)
	{
		return false;
	}

	// if (this.getUpdatedAt())

	return true;
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

initialize()
{
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(player, vehicles.physic, seat)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	if (vehicles.physic.findPassengerByPlayer(player).exists())
	{
		err("Игрок уже является пассажиром данного транспорта");
		return -1;
	}

	if (vehicles.physic.findPassengerBySeat(seat).exists())
	{
		err("В этом физическом транспорте на данном месте уже находится игрок");
		return -1;
	}

	new this = create();
	si(Player, player);
	si(Physic, vehicles.physic);
	si(Seat, seat);
	vehicles.physic.getPassengers().addInteger(this);
	player.setVehicle(vehicles.physic.getVehicle());
	player.setVehiclePassenger(this);
	return this;
}

is.destroy(this)
{
	this.getPhysic().getPassengers().removeInteger(this);
	this.getPlayer().setVehicle(-1).setVehiclePassenger(-1);
	destroy();
}

is.getPhysic(this)
{
	if (!this.exists())
	{
		err("Пассажира транспорта не существует");
		return -1;
	}

	return gi(Physic);
}

is.getPlayer(this)
{
	if (!this.exists())
	{
		err("Пассажира транспорта не существует");
		return -1;
	}

	return gi(Player);
}

is.getSeat(this)
{
	if (!this.exists())
	{
		err("Пассажира транспорта не существует");
		return -1;
	}

	return gi(Seat);
}

is.isDriver(this)
{
	if (!this.exists())
	{
		return false;
	}

	return this.getSeat() == 0;
}

// ----------------------------------------------------------------------

@is.(players).setVehiclePassenger(player, this)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	@si.(Players).(VehiclePassenger, player, this);
	return player;
}

@is.(players).getVehiclePassenger(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(VehiclePassenger, player);
}

// ----------------------------------------------------------------------

@is.(vehicles.physics).getPassengers(vehicles.physic)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	return @gv.(vehicles.Physics).(Passengers, vehicles.physic);
}

@is.(vehicles.physics).findPassengerBySeat(vehicles.physic, seat)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	vehicles.physic.getPassengers().each(vehicles.passenger, index)
	{
		if (vehicles.passenger.getSeat() != seat)
		{
			continue;
		}

		return vehicles.passenger;
	}

	return -1;
}

@is.(vehicles.physics).findPassengerByPlayer(vehicles.physic, player)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	vehicles.physic.getPassengers().each(vehicles.passenger, index)
	{
		if (vehicles.passenger.getPlayer() != player)
		{
			continue;
		}

		return vehicles.passenger;
	}

	return -1;
}

@is.(vehicles.physics).findFreeSeat(vehicles.physic)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	for (new seat = 0, count = vehicles.physic.getVehicle().getModel().getCapacity(); seat < count; ++seat)
	{
		if (vehicles.physic.findPassengerBySeat(seat).exists())
		{
			continue;
		}

		return seat;
	}

	return -1;
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

initialize()
{
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(player, vehicles.physic)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	if (vehicles.physic.findSurferByPlayer(player).exists())
	{
		err("Игрок уже является сёрфером данного транспорта");
		return -1;
	}

	new this = create();
	si(Player, player);
	si(Physic, vehicles.physic);
	vehicles.physic.getSurfers().addInteger(this);
	player.setSurfingVehicle(vehicles.physic.getVehicle());
	player.setVehicleSurfer(this);
	return this;
}

is.destroy(this)
{
	this.getPhysic().getSurfers().removeInteger(this);
	this.getPlayer().setSurfingVehicle(-1).setVehicleSurfer(-1);
	destroy();
}

is.getPhysic(this)
{
	if (!this.exists())
	{
		err("Сёрфера транспорта не существует");
		return -1;
	}

	return gi(Physic);
}

is.getPlayer(this)
{
	if (!this.exists())
	{
		err("Сёрфера транспорта не существует");
		return -1;
	}

	return gi(Player);
}

// ----------------------------------------------------------------------

@is.(players).setVehicleSurfer(player, this)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	@si.(Players).(VehicleSurfer, player, this);
	return player;
}

@is.(players).getVehicleSurfer(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(VehicleSurfer, player);
}

// ----------------------------------------------------------------------

@is.(players).setSurfingVehicle(player, vehicle)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	@si.(Players).(SurfingVehicle, player, vehicle);
	return player;
}

@is.(players).getSurfingVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(SurfingVehicle, player);
}

@is.(players).hasSurfingVehicle(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	return player.getSurfingVehicle().exists();
}

// ----------------------------------------------------------------------

@is.(vehicles.physics).getSurfers(vehicles.physic)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	return @gv.(vehicles.Physics).(Surfers, vehicles.physic);
}

@is.(vehicles.physics).findSurferByPlayer(vehicles.physic, player)
{
	if (!vehicles.physic.exists())
	{
		err("Физического транспорта не существует");
		return -1;
	}

	vehicles.physic.getSurfers().each(vehicles.surfer, index)
	{
		if (vehicles.surfer.getPlayer() != player)
		{
			continue;
		}

		return vehicles.surfer;
	}

	return -1;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.components // c3
#define These vehicles.Components // C3
#define this vehicles.component
#define This vehicles.Component

// ----------------------------------------------------------------------

initialize()
{
	new file = File("vehicles/components.txt");
	new string[1024];

	while (file.readLine(string))
	{
		new this, part0, part1, name[these.MaxNameLength + 1];
		new formatter[32];
		strings.(formatter).format("p<\t>ddds[%d]", these.MaxNameLength + 1);

		if (sscanf(string.trim(), formatter, this, part0, part1, name))
		{
			err("Не удалось разобрать строку");
			continue;
		}

		This(this, part0, part1, name);
	}

	file.close();
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(this, part0, part1, name[])
{
	this = create(this);
	si(Part0, part0);
	si(Part1, part1);
	ss(Name, name);
	return this;
}

is.getPart0(this)
{
	if (!this.exists())
	{
		err("Компонента транспорта не существует");
		return -1;
	}

	return gi(Part0);
}

is.getPart1(this)
{
	if (!this.exists())
	{
		err("Компонента транспорта не существует");
		return -1;
	}
	
	return gi(Part1);
}

is.hasPart1(this)
{
	if (!this.exists())
	{
		err("Компонента транспорта не существует");
		return false;
	}

	return this.getPart1() > -1;
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Компонента транспорта не существует");
		return name;
	}

	gs(Name, name);
	return name;
}

is.getSlot(this)
{
	if (!this.exists())
	{
		err("Компонента транспорта не существует");
		return -1;
	}

	return GetVehicleComponentType(1000 + this.getPart0());
}

is.findByName(name[])
{
	existent().each(this, index)
	{
		if (!this.getName().is(name))
		{
			continue;
		}

		return this;
	}

	return -1;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This