#define these teleports // a03
#define These Teleports // a03
#define this teleport
#define This Teleport

// ----------------------------------------------------------------------

dependencies()
{
	// d(players);
}

initialize()
{
	log("»нициализируем класс teleports");

	
	return true;
}

// ----------------------------------------------------------------------

is.exists(this)
{
	return exists();
}

is.create(position, name[], command[])
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
	ss(Command, command);

	return this;
}

is.destroy(this)
{
	if(!this.exists())
	{
		err("Телепорта не существует");
		return -1;
	}
	
	destroy();
	return this;
}

is.getPosition(this)
{
	if(!this.exists())
	{
		err("Телепорта не существует");
		return -1;
	}
	
	return Position().setXYZR(gf(PosX), gf(PosY), gf(PosZ), gf(PosR));
}

is.save(this)
{
	if(!this.exists())
	{
		err("Телепорта не существует");
		return -1;
	}
	
	save();
	return this;
}

is.getName(this)
{
	new name[128];
	if(!this.exists())
	{
		err("Телепорта не существует");
		return name;
	}
	
	gs(Name, name);
	return name;
}

is.getCommand(this)
{
	new command[24];
	if(!this.exists())
	{
		err("Телепорта не существует");
		return command;
	}
	
	gs(Command, command);
	return command;
}

is.findByCommand(text[])
{
	existent().each(this, i)
	{
		if (!this.getCommand().is(text))
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