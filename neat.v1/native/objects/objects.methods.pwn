#define these objects // a0
#define These Objects // A0
#define this object
#define This Object

// ----------------------------------------------------------------------

initialize()
{
	log("Класс объектов был проинициализирован");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create()
{
	new this = create();
	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Объект не существует");
		return -1;
	}

	return destroy();
}

is.save(this)
{
	if (!this.exists())
	{
		err("Объект не существует");
		return -1;
	}

	return save();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This