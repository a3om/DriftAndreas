#define these areas // b5
#define These Areas // B5
#define this area
#define This Area

// ----------------------------------------------------------------------

beforeInitialize()
{
	log("Перед инициализацией");
}

dependencies()
{
	d(players);
	d(vehicles);
}

initialize()
{
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.createCircle(position, Float:size, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	new sampArea = CreateDynamicCircle(position.getX(), position.getY(), size, worldid, interiorid, playerid);

	if (!IsValidDynamicArea(sampArea))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Area, sampArea);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.createCylinder(position, Float:minz, Float:maxz, Float:size, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	new sampArea = CreateDynamicCylinder(position.getX(), position.getY(), minz, maxz, size, worldid, interiorid, playerid);

	if (!IsValidDynamicArea(sampArea))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Area, sampArea);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.createSphere(position, Float:size, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	new sampArea = CreateDynamicSphere(position.getX(), position.getY(), position.getZ(), size, worldid, interiorid, playerid);

	if (!IsValidDynamicArea(sampArea))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Area, sampArea);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.createRectangle(position0, position1, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	new sampArea = CreateDynamicRectangle(position0.getX(), position0.getY(), position1.getX(), position1.getY(), worldid, interiorid, playerid);

	if (!IsValidDynamicArea(sampArea))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Area, sampArea);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.createCuboid(position0, position1, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	new sampArea = CreateDynamicCuboid(position0.getX(), position0.getY(), position0.getZ(), position1.getX(), position1.getY(), position1.getZ(), worldid, interiorid, playerid);

	if (!IsValidDynamicArea(sampArea))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Area, sampArea);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.createCube(position0, position1, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	new sampArea = CreateDynamicCube(position0.getX(), position0.getY(), position0.getZ(), position1.getX(), position1.getY(), position1.getZ(), worldid, interiorid, playerid);

	if (!IsValidDynamicArea(sampArea))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Area, sampArea);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return;
	}
	
	destroy();
}

// ----------------------------------------------------------------------

is.getArea(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	return gi(Area);
}

is.getClass(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	return gi(Class);
}

is.setClass(this, class)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	si(Class, class);
	return this;
}

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	return gi(Index);
}

is.setIndex(this, index)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	si(Index, index);
	return this;
}

// ----------------------------------------------------------------------

is.setPosition(this, position)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z;
	position.getXYZ(x, y, z);
	new sampArea = this.getArea();
	Streamer_SetFloatData(STREAMER_TYPE_AREA, sampArea, E_STREAMER_X, x);
	Streamer_SetFloatData(STREAMER_TYPE_AREA, sampArea, E_STREAMER_Y, y);
	Streamer_SetFloatData(STREAMER_TYPE_AREA, sampArea, E_STREAMER_Z, z);
	return this;
}

is.getPlayers(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	return gv(Players);
}

// ----------------------------------------------------------------------

@is.(players).getAreas(player)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return -1;
	}

	return @gi.(Players).(Areas, player);
}

@is.(players).isInArea(player, area)
{
	if (!player.exists())
	{
		err("Игрока не существует");
		return false;
	}

	if (!area.exists())
	{
		err("Территории не существует");
		return false;
	}

	return player.getAreas().hasInteger(area);
}

// ----------------------------------------------------------------------

is.getAttachingVehicle(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}
	
	return gi(AttachingVehicle);
}

is.hasAttachingVehicle(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return false;
	}

	return this.getAttachingVehicle().exists();
}

is.setAttachingVehicle(this, vehicle)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	si(AttachingVehicle, vehicle);
	return this;
}

is.attachToVehicle(this, vehicle)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	if (this.hasAttachingVehicle())
	{
		err("Эта территория уже прикреплена к транспорту");
		return this;
	}

	if (!vehicle.exists())
	{
		err("Транспорта не существует");
		return this;
	}

	if (!vehicle.hasArea())
	{
		err("Мы не можем прикрепить территорию к неактивированному транспорту");
		return this;
	}

	this.setAttachingVehicle(vehicle);
	vehicle.getAttachedAreas().addInteger(this);

	if (!vehicle.hasPhysic())
	{
		return this.setPosition(vehicle.getPosition());
	}

	AttachDynamicAreaToVehicle(this.getArea(), vehicle.getPhysic().getSampVehicle());
	return this;
}

is.detachFromVehicle(this)
{
	if (!this.exists())
	{
		err("Территории не существует");
		return -1;
	}

	if (!this.hasAttachingVehicle())
	{
		err("Эта территория не прикреплена ни к какому транспорту");
		return this;
	}

	new vehicle = this.getAttachingVehicle();
	vehicle.getAttachedAreas().removeInteger(this);
	this.setAttachingVehicle(-1);

	if (!vehicle.hasPhysic())
	{
		return this;
	}

	AttachDynamicAreaToVehicle(this.getArea(), INVALID_VEHICLE_ID);
	this.setPosition(vehicle.getPosition());
	return this;
}

// ----------------------------------------------------------------------

@is.(vehicles).getAreas(vehicle)
{
	if (!vehicle.exists())
	{
		err("Транспорта не существует");
		return -1;
	}

	return @gi.(Vehicles).(Areas, vehicle);
}

@is.(vehicles).isInArea(vehicle, this)
{
	if (!vehicle.exists())
	{
		err("Транспорта не существует");
		return false;
	}

	if (!this.exists())
	{
		err("Территории не существует");
		return false;
	}

	return vehicle.getAreas().hasInteger(this);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This