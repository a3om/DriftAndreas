#define these maps // ad
#define These Maps // AD
#define this map
#define This Map

// ----------------------------------------------------------------------

is.initialize()
{
	setInterval(#these._destroySuicide, 1000, "");
}

is.(this)
{
	return this;
}

// ----------------------------------------------------------------------

is.exists(this)
{
	if (this < 0 || this >= vector_size(these.VectorOfMaps))
	{
		return false;
	}

	return vector_get(these.VectorOfMaps, this) == 1;
}

is.create(name[] = these.UnknownMapName)
{
	if (name[0] == EOS)
	{
		err("Карта не может иметь пустое название");
		return -1;
	}

	new this = vector_find(these.VectorOfMaps, -1);
	new data[128];
	format(data, sizeof data, "keys vector of map %s", name);

	if (this < 0)
	{
		this = vector_size(these.VectorOfMaps);
		vector_push_back(these.VectorOfMaps, 1);
		vector_push_back_arr(these.VectorOfMapNames, name);
		vector_push_back(these.VectorOfMapKeysVector, Vector(data));
		vector_push_back(these.VectorOfMapValuesVector, Vector(data));
	}
	else
	{
		vector_set(these.VectorOfMaps, this, 1);
		vector_set_arr(these.VectorOfMapNames, this, name);
		vector_set(these.VectorOfMapKeysVector, this, Vector(data));
		vector_set(these.VectorOfMapValuesVector, this, Vector(data));
	}

	if (strcmp(name, these.UnknownMapName, true) == 0)
	{
		vector_push_back(these.VectorOfSuicide, this);
	}

	return this;
}

ip.destroy(this)
{
	if (!this.exists())
	{
		return false;
	}

	// log("Карта был уничтожен // this = %d", this);

	this.getKeys().destroy();
	this.getValues().destroy();
	vector_set(these.VectorOfMaps, this, -1);
	return true;
}

// ----------------------------------------------------------------------

is.getKeys(this)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	return vector_get(these.VectorOfMapKeysVector, this);
}

is.getValues(this)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	return vector_get(these.VectorOfMapValuesVector, this);
}

// ----------------------------------------------------------------------

is.getInteger(this, key[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return 0;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		err("Ключа в карте не существует");
		return 0;
	}

	return this.getValues().getInteger(slot);
}

is.setInteger(this, key[], integer)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	if (key[0] == EOS)
	{
		err("Ключ не может быть пустым");
		return -1;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		this.getKeys().addString(key, false);
		this.getValues().addInteger(integer, false);
	}
	else
	{
		this.getValues().setInteger(slot, integer, false);
	}

	return this;
}

// ----------------------------------------------------------------------

fs.getFloat(this, key[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return 0.0;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		err("Ключа в карте не существует");
		return 0.0;
	}

	return this.getValues().getFloat(slot);
}

is.setFloat(this, key[], Float:float)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	if (key[0] == EOS)
	{
		err("Ключ не может быть пустым");
		return -1;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		this.getKeys().addString(key);
		this.getValues().addFloat(float, false);
	}
	else
	{
		this.getValues().setFloat(slot, float, false);
	}

	return this;
}

// ----------------------------------------------------------------------

is.getString(this, key[])
{
	new string[these.MaxStringLength + 1];

	if (!this.exists())
	{
		err("Карты не существует");
		return string;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		err("Ключа в карте не существует");
		return string;
	}

	this.getValues().getStringOut(slot, string);
	return string;
}

is.getStringOut(this, key[], string[], size_of_string = sizeof string)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		err("Ключа в карте не существует");
		return this;
	}

	this.getValues().getStringOut(slot, string, size_of_string);
	return this;
}

is.setString(this, key[], string[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	if (key[0] == EOS)
	{
		err("Ключ не может быть пустым");
		return -1;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		this.getKeys().addString(key);
		this.getValues().addString(string, false);
	}
	else
	{
		this.getValues().setString(slot, string, false);
	}
	
	return this;
}

// ----------------------------------------------------------------------

is.getType(this, key[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return 0;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		err("Ключа в карте не существует");
		return 0;
	}

	return this.getValues().getType(slot);
}

is.find(this, key[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	return this.getKeys().findString(key);
}

is.has(this, key[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return false;
	}

	return this.find(key) > -1;
}

is.remove(this, key[])
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	new slot = this.find(key);

	if (slot < 0)
	{
		err("Ключа в карте не существует");
		return this;
	}

	this.getKeys().remove(slot);
	this.getValues().remove(slot);
	return this;
}

// ----------------------------------------------------------------------

is.getName(this)
{
	new name[these.MaxMapNameLength + 1];

	if (!this.exists())
	{
		err("Карты не существует");
		return name;
	}

	vector_get_arr(these.VectorOfMapNames, this, name, these.MaxMapNameLength + 1);
	return name;
}

// ----------------------------------------------------------------------

is.clear(this)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	this.getKeys().clear();
	this.getValues().clear();
	return this;
}

is.copyFrom(this, map1)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	if (this == map1)
	{
		err("Вы не можете скопировать карту в ту же самую карту");
		return -1;
	}

	if (!map1.exists())
	{
		err("Карты, из которой мы хотим взять данные, не существует");
		return -1;
	}

	this.clear();
	this.getKeys().copyFrom(map1.getKeys());
	this.getValues().copyFrom(map1.getValues());
	return this;
}

is.copyTo(this, map1)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	if (this == map1)
	{
		err("Вы не можете скопировать карту в ту же самую карту");
		return -1;
	}

	if (!map1.exists())
	{
		err("Карты, в которую мы хотим записать данные, не существует");
		return -1;
	}
	
	map1.copyFrom(this);
	return this;
}

is.clone(this, name[] = these.UnknownMapName)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	return these.create(name).copyFrom(this);
}

// ----------------------------------------------------------------------

is.print(this)
{
	if (!this.exists())
	{
		err("Карты не существует");
		return -1;
	}

	new vector0 = this.getKeys();
	new vector1 = this.getValues();
	
	printf("[map]	%s [map = %d] (%d)", this.getName(), this, vector0.getLength());
	
	vector0.foreachString(key, slot)
	{
		switch (vector1.getType(slot))
		{
			case 'i':
			{
				printf("[map]	%s: %d", key, vector1.getInteger(slot));
			}
			case 'f':
			{
				printf("[map]	%s: %f", key, vector1.getFloat(slot));
			}
			case 's':
			{
				printf("[map]	%s: %s", key, vector1.getString(slot));
			}
		}
	}

	return this;
}

// ----------------------------------------------------------------------

ip._destroySuicide()
{
	for (new this, length = vector_size(these.VectorOfSuicide); length != 0; --length)
	{
		this = vector_get(these.VectorOfSuicide, 0);
		this.destroy();
		vector_remove(these.VectorOfSuicide, 0);
	}
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This