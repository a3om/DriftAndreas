#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

dependencies()
{
	// d(players);
}

initialize()
{
	log("»нициализируем класс houses");
	
	existent().each(this, i)
    {
        this.setArea(SphereArea(Position(gf(PosX), gf(PosY), gf(PosZ)), these.PickupDistance).setClass(houses).setIndex(this));
		
		if(this.hasOwner())
		{
			if(this.isOnSale())
			{
				this.setPickup(Pickup(1314, 1, Position(gf(PosX), gf(PosY), gf(PosZ)), .class = houses, .index = this));
			}
			else
			{
				this.setPickup(Pickup(1272, 1, Position(gf(PosX), gf(PosY), gf(PosZ)), .class = houses, .index = this));
			}
		}
		else
		{
			this.setPickup(Pickup(1273, 1, Position(gf(PosX), gf(PosY), gf(PosZ)), .class = houses, .index = this));
		}
		
		this.setWorld(World());
    }
	
	return true;
}

// ----------------------------------------------------------------------

is.exists(this)
{
	return exists();
}

is.create(position, price)
{
	new 
		this = create(),
		Float:x,
		Float:y,
		Float:z
	;
	
	position.getXYZ(x, y, z);
	
	sf(PosX, x);
	sf(PosY, y);
	sf(PosZ, z);
	si(Price, price);
	si(Interior, 1);
	si(Owner, -1);
	si(Close, -1);
	si(SellPrice, -1);
	

	this.setArea(SphereArea(position, these.PickupDistance).setClass(houses).setIndex(this));	
	this.setPickup(Pickup(1273, 1, position, .class = houses, .index = this));
	this.setWorld(World());
	
	return this;
}

is.destroy(this)
{
	if (this.hasArea())
	{
		this.getArea().destroy();
	}
	
	if (this.hasPickup())
	{
		house.getPickup().destroy();
	}
	
	if(this.hasOwner())
	{
		house.getOwner().giveMoney(house.getPrice()).save();
	}
	
	house.getWorld().destroy();
	destroy();
}

is.changePickup(this)
{
	if (this.hasPickup())
	{
		house.getPickup().destroy();
	}
	
	if(this.hasOwner())
	{
		if(this.isOnSale())
		{
			this.setPickup(Pickup(1314, 1, Position(gf(PosX), gf(PosY), gf(PosZ)), .class = houses, .index = this));
		}
		else
		{
			this.setPickup(Pickup(1272, 1, Position(gf(PosX), gf(PosY), gf(PosZ)), .class = houses, .index = this));
		}
	}
	else
	{
		this.setPickup(Pickup(1273, 1, Position(gf(PosX), gf(PosY), gf(PosZ)), .class = houses, .index = this));
	}
	
	return this;
}

is.getPosition(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	return Position().setXYZ(gf(PosX), gf(PosY), gf(PosZ));
}

is.setArea(this, area)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	si(Area, area);
	return this;
}

is.hasArea(this)
{
	if (!this.exists())
	{
		err("Дом не существует");
		return false;
	}

	return gi(Area) > -1;
}

is.getArea(this)
{
	if (!this.exists())
	{
		err("Дом не существует");
		return -1;
	}

	return gi(Area);
}


is.setPickup(this, pickup)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	si(Pickup, pickup);
	return this;
}

is.hasPickup(this)
{
	if (!this.exists())
	{
		err("Дом не существует");
		return false;
	}

	return gi(Pickup) > -1;
}

is.getPickup(this)
{
	if (!this.exists())
	{
		err("Дом не существует");
		return -1;
	}

	return gi(Pickup);
}

is.save(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	save();
	return this;
}

is.getPrice(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}

	return gi(Price);
}

is.getOwner(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	return gi(Owner);
}

is.hasOwner(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return false;
	}
	
	return this.getOwner() > -1;
}

is.setOwner(this, account)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	
	if(this.hasOwner())
	{
		if(account.exists())
		{
			emit(these, #houseWasSolt, M:i(house));
			si(Owner, account);
			emit(these, #houseWasBought, M:i(house).i(account));
		}
		else
		{
			emit(these, #houseWasSolt, M:i(house));
			sd(Owner);
			this.changePickup();
		}
	}
	else
	{
		if(account.exists())
		{
			si(Owner, account);
			emit(these, #houseWasBought, M:i(house).i(account));
			this.changePickup();
		}
	}

	return this;
}

is.getInterior(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	return gi(Interior);
}

is.setInterior(this, interior)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	si(Interior, interior);
	
	new	
		position = this.getInterior().getPosition()
	;
	
	this.getPlayers().each(player, index)
	{
		player.setPosition(position);
	}
	
	return this;
}

is.isClose(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return false;
	}
	
	return gi(Close);
}

is.setClose(this, close)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	si(Close, close);
	return this;
}

is.isOpen(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	return this.getDoor() > -1;
}

is.isOnSale(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return false;
	}
	
	return this.getSellPrice() > 0;
}

is.getSellPrice(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
		
	return gi(SellPrice);
}

is.setSellPrice(this, price)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}

	si(SellPrice, price);
	this.changePickup();
	return this;
}

is.getPlayers(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	return gv(Players);
}

is.getWorld(this)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
		
	return gi(World);
}

is.setWorld(this, world)
{
	if(!this.exists())
	{
		err("Дом не существует");
		return -1;
	}
	
	si(World, world);
	return this;
}


// ----------------------------------------------------------------------

@is.(players).getNearestHouse(player)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return -1;
	}

	return @gi.(Players).(NearestHouse, player);
}


@is.(players).setNearestHouse(player, house)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return -1;
	}
	
	@si.(Players).(NearestHouse, player, house);
	return player;
}

@is.(players).hasNearestHouse(player)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return false;
	}
	
	return player.getNearestHouse().exists();
}

// ----------------------------------------------------------------------

@is.(accounts).getHouse(account)
{
	if (!account.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}

	return @gi.(Accounts).(House, account);
}


@is.(accounts).setHouse(account, house)
{
	if (!account.exists())
	{
		err("Аккаунта не существует");
		return -1;
	}
	
	@si.(Accounts).(House, account, house);
	return account;
}

@is.(accounts).hasHouse(account)
{
	if (!account.exists())
	{
		err("Аккаунта не существует");
		return false;
	}
	
	return account.getHouse().exists();
}

// ----------------------------------------------------------------------

@is.(players).getHouse(player)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return -1;
	}

	return @gi.(Players).(House, player);
}


@is.(players).setHouse(player, house)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return -1;
	}
	
	@si.(Players).(House, player, house);
	return player;
}

@is.(players).hasHouse(player)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return false;
	}
	
	return player.getHouse().exists();
}

// ----------------------------------------------------------------------

@is.(players).moveToHouse(player, house)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return -1;
	}
	
	if (!house.exists())
	{
		err("Дома не существует");
		return player;
	}
	
	new houses.interior = house.getInterior();
	player.setPosition(houses.interior.getPosition());
	player.setWorld(house.getWorld());
	player.setHouse(house);
	
	player.getAccount().setHouse(house).save();
	
	house.getPlayers().addInteger(player);
	emit(players, #enterHouse, M:i(player).i(house));
	
	return player;
}

@is.(players).leaveHouse(player)
{
	if (!player.exists())
	{
		err("»грока не существует");
		return -1;
	}
	
	new
		house = player.getHouse()
	;
	
	if (!house.exists())
	{
		err("Дома не существует");
		return player;
	}
	
	player.setPosition(house.getPosition());
	player.setWorld(0);
	player.setHouse(-1);
	
	player.getAccount().setHouse(-1).save();
	
	emit(players, #leaveHouse, M:i(player).i(house));
	house.getPlayers().removeInteger(player);
	
	return player;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these houses.interiors // a02
#define These houses.Interiors // a02
#define this houses.interior
#define This houses.Interior

// ----------------------------------------------------------------------

initialize()
{
	existent().each(this, i)
	{
		this.setArea(SphereArea(houses.interior.getPosition(), these.PickupDistance).setClass(these).setIndex(this));
		this.setPickup(Pickup(1277, 1, houses.interior.getPosition(), .class = these, .index = this));
	}
	return true;
}

// ----------------------------------------------------------------------

@foundation;

// ----------------------------------------------------------------------

is.create(position, name[], price)
{
	new 
		this = create(),
		Float:x,
		Float:y,
		Float:z,
		Float:r
	;
	
	position.getXYZR(x, y, z, r);
	
	sf(PosX, x);
	sf(PosY, y);
	sf(PosZ, z);
	sf(PosR, r);
	ss(Name, name);
	si(Price, price);
	si(Interior, 1);

	this.setArea(SphereArea(houses.interior.getPosition(), these.PickupDistance).setClass(these).setIndex(this));
	this.setPickup(Pickup(1277, 1, houses.interior.getPosition(), .class = these, .index = this));
	
	return this;
}

is.save(this)
{
	if(!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}
	
	save();
	return this;
}

is.getPrice(this)
{
	if(!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}

	return gi(Price);
}

is.getName(this)
{
	new 
		name[these.MaxNameLenght + 1]
	;
	
	if(!this.exists())
	{
		err("Интерьера дома не существует");
		return name;
	}
	
	gs(Name, name);
	
	return name;
}

is.getPosition(this)
{
	if(!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}
	
	return Position().setXYZR(gf(PosX), gf(PosY), gf(PosZ), gf(PosR));
}


is.setArea(this, area)
{
	if(!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}
	
	si(Area, area);
	return this;
}

is.hasArea(this)
{
	if (!this.exists())
	{
		err("Интерьера дома не существует");
		return false;
	}

	return gi(Area) > -1;
}

is.getArea(this)
{
	if (!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}

	return gi(Area);
}


is.setPickup(this, pickup)
{
	if(!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}
	
	si(Pickup, pickup);
	return this;
}

is.hasPickup(this)
{
	if (!this.exists())
	{
		err("Интерьера дома не существует");
		return false;
	}

	return gi(Pickup) > -1;
}

is.getPickup(this)
{
	if (!this.exists())
	{
		err("Интерьера дома не существует");
		return -1;
	}

	return gi(Pickup);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This