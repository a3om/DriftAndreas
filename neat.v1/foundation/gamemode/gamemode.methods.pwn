#define these gamemode // a0
#define These Gamemode // A0

// ----------------------------------------------------------------------

is.initialize()
{
	these.setName("Loading...");
	these.classes.initialize();

	for (new callback[32], address = 0xA0; address < 0xFFF; ++address)
	{
		format(callback, sizeof callback, "%s_initialize", integers.(address).toHexString());

		if (funcidx(callback) < 0)
		{
			continue;
		}

		if (these.classes.create(address) < 0)
		{
			err("Ошибка инициализации класса с адресом %h", address);
			these.setName("Initialization Fail");
			return false;
		}
	}

	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	these.setName(these.name);
	return true;
}

is.setName(name[])
{
	SetGameModeText(name);
}

is.restart()
{
	if (these.Shutdown)
	{
		return;
	}

	these.Shutdown = true;
	emit(these, "shutdown", .inverse = true);
	SendRconCommand("gmx");
}

// ----------------------------------------------------------------------

#undef these
#undef These

// ----------------------------------------------------------------------

#define these gamemode.classes // a2
#define These gamemode.Classes // A2
#define this gamemode.class
#define This gamemode.Class

// ----------------------------------------------------------------------

is.initialize()
{
	These.Address = Vector("gamemode.Class.Address");
	These.Dependencies = Vector("gamemode.Class.Dependencies");
	// These.Initialized = Vector("gamemode.Class.Initialized");
}

is.exists(this)
{
	return this >= 0 && this < vectors.(These).getLength();
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Класса не существует");
		return name;
	}

	vectors.(These.Name).getStringOut(this, name);
	return name;
}

is.getAddress(this)
{
	if (!this.exists())
	{
		err("Класса не существует");
		return -1;
	}

	return vectors.(These.Address).getInteger(this);
}

is.create(address)
{
	if (vectors.(These.Address).findInteger(address) > -1)
	{
		return vectors.(These.Address).findInteger(address);
	}

	new callback[32];
	new this = vectors.(These.Address).getLength();

	// 0 до инициализации

	format(callback, sizeof callback, "%s_beforeInitialize", integers.(address).toHexString());
	
	if (funcidx(callback) > -1)
	{
		call(callback, "");
	}

	// 1 зависимости

	format(callback, sizeof callback, "%s_dependencies", integers.(address).toHexString());

	if (funcidx(callback) > -1)
	{
		call(callback, "");
	}

	vectors.(These.Address).addInteger(address);
	vectors.(These.Dependencies).addInteger(Vector("Dependencies of class"));

	// 2 стурктура

	format(callback, sizeof callback, "%s_structure", integers.(address).toHexString());

	if (funcidx(callback) > -1)
	{
		call(callback, "");
	}

	// 3 инициализация

	format(callback, sizeof callback, "%s_initialize", integers.(address).toHexString());
	
	if (funcidx(callback) > -1 && !call(callback, ""))
	{
		return -1;
	}

	return this;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This