#define these pickups // bb
#define These Pickups // BB
#define this pickup
#define This Pickup

// ----------------------------------------------------------------------

initialize()
{
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(modelid, type, position, worldid = -1, interiorid = -1, playerid = -1, class = -1, index = -1)
{
	if (!position.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	new sampPickup = CreateDynamicPickup(modelid, type, position.getX(), position.getY(), position.getZ(), worldid, interiorid, playerid);

	if (!IsValidDynamicPickup(sampPickup))
	{
		err("Невозможно создать территорию");
		return -1;
	}

	new this = create();
	si(Pickup, sampPickup);
	si(Class, class);
	si(Index, index);
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Пикапа не существует");
		return;
	}

	new sampPickup = pickup.getPickup();

	if (IsValidDynamicPickup(sampPickup))
	{
		DestroyDynamicPickup(sampPickup);
	}

	destroy();
}

// ----------------------------------------------------------------------

is.getClass(this)
{
	if (!this.exists())
	{
		err("Пикапа не существует");
		return -1;
	}

	return gi(Class);
}

is.setClass(this, class)
{
	if (!this.exists())
	{
		err("Пикапа не существует");
		return -1;
	}

	si(Class, class);
	return this;
}

is.getIndex(this)
{
	if (!this.exists())
	{
		err("Пикапа не существует");
		return -1;
	}

	return gi(Index);
}

is.setIndex(this, index)
{
	if (!this.exists())
	{
		err("Пикапа не существует");
		return -1;
	}

	si(Index, index);
	return this;
}

is.getPickup(this)
{
	if (!this.exists())
	{
		err("Пикапа не существует");
		return -1;
	}

	return gi(Pickup);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This