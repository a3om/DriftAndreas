#define these vectors // a1
#define These Vectors // A1
#define this vector
#define This Vector

// ----------------------------------------------------------------------

is.initialize()
{
	setInterval(#these._destroySuicide, 1000, "");
}

is.(this) return this;

// ----------------------------------------------------------------------

is.exists(this)
{
	if (this < 0 || this >= vector_size(these.VectorOfVectors))
	{
		return false;
	}

	return vector_get(these.VectorOfVectors, this) == 1;
}

is.create(name[] = these.UnknownVectorName)
{
	if (name[0] == EOS)
	{
		err("Вектор не может иметь пустое название");
		return -1;
	}

	new this = vector_find(these.VectorOfVectors, -1);

	if (this < 0)
	{
		this = vector_size(these.VectorOfVectors);
		vector_push_back(these.VectorOfVectors, 1);
		vector_push_back_arr(these.VectorOfVectorNames, name);
	}
	else
	{
		vector_set(these.VectorOfVectors, this, 1);
		vector_set_arr(these.VectorOfVectorNames, this, name);
	}

	if (strcmp(name, these.UnknownVectorName, true) == 0)
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

	// log("Вектор был уничтожен // this = %d", this);

	vector_set(these.VectorOfVectors, this, -1);
	vector_clear(this);
	return true;
}

// ----------------------------------------------------------------------

is.addInteger(this, integer, uniqueOnly = true)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (integer >= 0)
	{
		++integer;
	}

	if (uniqueOnly && this.findInteger(integer - 1) > -1)
	{
		err("Вектор уже содержит значение типа Integer");
		return this;
	}

	vector_push_back(this, integer);
	return this;
}

is.getInteger(this, slot)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return 0;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return 0;
	}

	new integer = vector_get(this, slot);

	if (integer > 0)
	{
		--integer;
	}

	return integer;
}

is.getLastInteger(this)
{
	if (!this.exists())
	{
		err("Вектора не существует");
		return 0;
	}

	new length = this.getLength();

	if (length == 0)
	{
		err("Вектор пустой");
		return 0;
	}

	return this.getInteger(length - 1);
}

is.setInteger(this, slot, integer, uniqueOnly = true)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return this;
	}

	if (integer >= 0)
	{
		++integer;
	}

	if (uniqueOnly && this.findInteger(integer - 1) > -1)
	{
		err("Вектор уже содержит значение типа Integer");
		return this;
	}

	vector_set(this, slot, integer);
	return this;
}

is.removeInteger(this, integer)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new slot = this.findInteger(integer);

	if (slot < 0)
	{
		err("Удаляемого значения типа Integer не существует в векторе");
		return -1;
	}

	vector_remove(this, slot);
	return this;
}

is.findInteger(this, integer)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (integer >= 0)
	{
		++integer;
	}

	return vector_find(this, integer);
}

is.hasInteger(this, integer)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return false;
	}

	return this.findInteger(integer) > -1;
}

// ----------------------------------------------------------------------

is.addFloat(this, Float:float, uniqueOnly = true)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (uniqueOnly && this.findFloat(float) > -1)
	{
		err("Вектор уже содержит значение типа Float");
		return this;
	}

	vector_push_back_float(this, float);
	return this;
}

fs.getFloat(this, slot)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return 0.0;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return 0.0;
	}

	return vector_get_float(this, slot);
}

fs.getLastFloat(this)
{
	if (!this.exists())
	{
		err("Вектора не существует");
		return 0.0;
	}

	new length = this.getLength();

	if (length == 0)
	{
		err("Вектор пустой");
		return 0.0;
	}

	return this.getFloat(length - 1);
}

is.setFloat(this, slot, Float:float, uniqueOnly = true)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return this;
	}

	if (uniqueOnly && this.findFloat(float) > -1)
	{
		err("Вектор уже содержит значение типа Float");
		return this;
	}

	vector_set_float(this, slot, float);
	return this;
}

is.removeFloat(this, Float:float)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new slot = this.findFloat(float);

	if (slot < 0)
	{
		err("Удаляемого значения типа Float не существует в векторе");
		return -1;
	}

	vector_remove(this, slot);
	return this;
}

is.findFloat(this, Float:float)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	return vector_find_float(this, float);
}

is.hasFloat(this, Float:float)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return false;
	}

	return this.findFloat(float) > -1;
}

// ----------------------------------------------------------------------

is.addString(this, string[], uniqueOnly = true)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (uniqueOnly && this.findString(string) > -1)
	{
		err("Вектор уже содержит значение типа String");
		return this;
	}

	if (string[0] == EOS)
	{
		vector_push_back_arr(this, {1, EOS});
	}
	else
	{
		vector_push_back_arr(this, string);
	}

	return this;
}

is.getString(this, slot)
{
	new string[these.MaxStringLength + 1];

	if (!this.exists())
	{
		err("Вектор не существует");
		return string;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return string;
	}

	vector_get_arr(this, slot, string, these.MaxStringLength + 1);

	if (string[0] == 1 && string[1] == EOS)
	{
		string = "";
	}

	return string;
}

is.getLastString(this)
{
	new string[these.MaxStringLength + 1];

	if (!this.exists())
	{
		err("Вектора не существует");
		return string;
	}

	new length = this.getLength();

	if (length == 0)
	{
		err("Вектор пустой");
		return string;
	}

	this.getStringOut(length - 1, string);
	return string;
}

is.getStringOut(this, slot, string[], size_of_string = sizeof string)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return this;
	}

	vector_get_arr(this, slot, string, size_of_string);

	if (string[0] == 1 && string[1] == EOS)
	{
		string[0] = EOS;
	}

	return this;
}

is.getLastStringOut(this, string[], size_of_string = sizeof string)
{
	if (!this.exists())
	{
		err("Вектора не существует");
		return -1;
	}

	new length = this.getLength();

	if (length == 0)
	{
		err("Вектор пустой");
		return this;
	}

	this.getStringOut(length - 1, string);
	return this;
}

is.setString(this, slot, string[], uniqueOnly = true)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return this;
	}

	if (uniqueOnly && this.findString(string) > -1)
	{
		err("Вектор уже содержит значение типа String");
		return this;
	}

	if (string[0] == EOS)
	{
		vector_set_arr(this, slot, {1, EOS});
	}
	else
	{
		vector_set_arr(this, slot, string);
	}
	
	return this;
}

is.removeString(this, string[])
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new slot = this.findString(string);

	if (slot < 0)
	{
		err("Удаляемого значения типа String не существует в векторе");
		return -1;
	}

	vector_remove(this, slot);
	return this;
}

is.findString(this, string[])
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (string[0] == EOS)
	{
		return vector_find_arr(this, {1, EOS});
	}

	return vector_find_arr(this, string);
}

is.hasString(this, string[])
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return false;
	}

	return this.findString(string) > -1;
}

// ----------------------------------------------------------------------

is.has(this, slot)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return false;
	}

	return slot >= 0 && slot < vector_size(this);
}

is.remove(this, slot)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return -1;
	}

	vector_remove(this, slot);
	return this;
}

// ----------------------------------------------------------------------

is.getName(this)
{
	new name[these.MaxVectorNameLength + 1];

	if (!this.exists())
	{
		err("Вектор не существует");
		return name;
	}

	vector_get_arr(these.VectorOfVectorNames, this, name, these.MaxVectorNameLength + 1);
	return name;
}

is.getLength(this)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return 0;
	}

	return vector_size(this);
}

// ----------------------------------------------------------------------

is.getType(this, slot)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return 0;
	}

	if (!this.has(slot))
	{
		err("Слота в векторе не существует");
		return 0;
	}

	switch (vector_entry_type(this, slot))
	{
		case VEC_ENTRY_TYPE_CELL:
		{
			return 'i';
		}
		case VEC_ENTRY_TYPE_FLOAT:
		{
			return 'f';
		}
		case VEC_ENTRY_TYPE_ARRAY:
		{
			return 's';
		}
	}

	return 0;
}

is.clear(this)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	vector_clear(this);
	return this;
}

is.copyFrom(this, vector1)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (this == vector1)
	{
		err("Вы не можете скопировать вектор в тот же самый вектор");
		return -1;
	}

	if (!vector1.exists())
	{
		err("Вектор, из которого мы хотим взять данные, не существует");
		return -1;
	}

	this.clear();

	new length = vector_size(vector1);

	for (new slot = 0; slot < length; ++slot)
	{
		switch (vector1.getType(slot))
		{
			case 'i':
			{
				this.addInteger(vector1.getInteger(slot), false);
			}
			case 'f':
			{
				this.addFloat(vector1.getFloat(slot), false);
			}
			case 's':
			{
				this.addString(vector1.getString(slot), false);
			}
		}
	}

	return this;
}

is.copyTo(this, vector1)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	if (this == vector1)
	{
		err("Вы не можете скопировать вектор в тот же самый вектор");
		return -1;
	}

	if (!vector1.exists())
	{
		err("Вектор, в который мы хотим записать данные, не существует");
		return -1;
	}
	
	vector1.copyFrom(this);
	return this;
}

is.clone(this, name[] = these.UnknownVectorName)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	return these.create(name).copyFrom(this);
}

is.reverse(this)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new length = this.getLength();

	for (new slot = length - 1; slot >= 0; --slot)
	{
		switch (this.getType(slot))
		{
			case 'i':
			{
				this.addInteger(this.getInteger(slot), false);
			}
			case 'f':
			{
				this.addFloat(this.getFloat(slot), false);
			}
			case 's':
			{
				this.addString(this.getString(slot), false);
			}
		}

		this.remove(slot);
	}

	return this;
}

is.getAkinType(this, defaultAkinType = 'i')
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new length = this.getLength();

	if (length == 0)
	{
		return defaultAkinType;
	}

	new akinType = this.getType(0);

	for (new slot = 1; slot < length; ++slot)
	{
		if (akinType == this.getType(slot))
		{
			continue;
		}

		akinType = 0;
		break;
	}

	return akinType;
}

is.isIntegral(this)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return 0;
	}

	return this.getAkinType() == 'i';
}

is.sort(this, inverse = false, sorter[] = "")
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new length = vector_size(this);

	if (length == 0)
	{
		return this;
	}

	new akinType = this.getAkinType();

	if (akinType == -1)
	{
		err("Вектор не был отсортирован, так как он содержит значения разных типов данных");
		return this;
	}

	if (akinType == 'i' && sorter[0] != EOS)
	{
		if (funcidx(sorter) < 0)
		{
			err("Не удалось найти функцию-сортировщика для сортировки вектора");
			return this;
		}

		new tempInteger;

		for (new slot0 = 0; slot0 < length; ++slot0)
		{
			for (new slot1 = slot0 + 1; slot1 < length; ++slot1)
			{
				if (call(sorter, "ii", vector.getInteger(slot0), vector.getInteger(slot1)) == inverse)
				{
					continue;
				}

				tempInteger = vector.getInteger(slot1);
				vector.setInteger(slot1, vector.getInteger(slot0), false);
				vector.setInteger(slot0, tempInteger, false);
			}
		}

		return this;
	}

	switch (akinType)
	{
		case 'i':
		{
			new tempInteger;

			for (new slot0 = 0; slot0 < length; ++slot0)
			{
				for (new slot1 = slot0 + 1; slot1 < length; ++slot1)
				{
					if (vector.getInteger(slot0) > vector.getInteger(slot1) == bool:inverse)
					{
						continue;
					}

					tempInteger = vector.getInteger(slot1);
					vector.setInteger(slot1, vector.getInteger(slot0), false);
					vector.setInteger(slot0, tempInteger, false);
				}
			}
		}
		case 'f':
		{
			new Float:tempFloat;

			for (new slot0 = 0; slot0 < length; ++slot0)
			{
				for (new slot1 = slot0 + 1; slot1 < length; ++slot1)
				{
					if (inverse ? (vector.getFloat(slot0) > vector.getFloat(slot1)) : (vector.getFloat(slot0) < vector.getFloat(slot1)))
					{
						continue;
					}

					tempFloat = vector.getFloat(slot1);
					vector.setFloat(slot1, vector.getFloat(slot0), false);
					vector.setFloat(slot0, tempFloat, false);
				}
			}
		}
		case 's':
		{
			new tempString[these.MaxStringLength + 1];

			for (new slot0 = 0; slot0 < length; ++slot0)
			{
				for (new slot1 = slot0 + 1; slot1 < length; ++slot1)
				{
					if (strcmp(vector.getString(slot0), vector.getString(slot1), false) != (inverse ? -1 : 1))
					{
						continue;
					}

					vector.getStringOut(slot1, tempString);
					vector.setString(slot1, vector.getString(slot0), false);
					vector.setString(slot0, tempString, false);
				}
			}
		}
	}
	
	return this;
}

is.isLast(this, slot)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return false;
	}

	return this.getLength() - 1 == slot;
}

is.isEmpty(this)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return true;
	}

	return this.getLength() == 0;
}

is.filter(this, filter[]= "")
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new vector0 = Vector();

	if (strings.(filter).isEmpty())
	{
		err("Функция-фильтр указана пустой");
		return vector0;
	}

	if (funcidx(filter) < 0)
	{
		err("Не найдена функция-фильтр");
		return vector0;
	}

	if (this.isEmpty())
	{
		return vector0;
	}

	new length = this.getLength();

	switch (this.getAkinType())
	{
		case 'i':
		{
			for (new tempInteger, slot = 0; slot < length; ++slot)
			{
				tempInteger = this.getInteger(slot);

				if (!call(filter, "i", tempInteger))
				{
					continue;
				}

				vector0.addInteger(tempInteger, false);
			}

			return vector0;
		}
		case 'f':
		{
			for (new Float:tempFloat, slot = 0; slot < length; ++slot)
			{
				tempFloat = this.getFloat(slot);
				
				if (!call(filter, "f", tempFloat))
				{
					continue;
				}

				vector0.addFloat(tempFloat, false);
			}

			return vector0;
		}
		case 's':
		{
			for (new tempString[vectors.MaxStringLength + 1], slot = 0; slot < length; ++slot)
			{
				this.getStringOut(slot, tempString);

				if (strings.(tempString).isEmpty())
				{
					continue;
				}
				
				if (!call(filter, "s", tempString))
				{
					continue;
				}

				vector0.addString(tempString, false);
			}

			return vector0;
		}
	}

	err("Нельзя отфильтровать этот вектор, так как он содержит значения разных типов данных");
	return vector0;
}

is.join(this, glue[] = "")
{
	new string[strings.MaxStringLength + 1];

	if (!this.exists())
	{
		err("Вектор не существует");
		return string;
	}

	if (this.isEmpty())
	{
		return string;
	}

	new length = this.getLength();

	for (new slot = 0; slot < length; ++slot)
	{
		if (slot != 0)
		{
			strcat(string, glue);
		}

		switch (this.getType(slot))
		{
			case 'i':
			{
				strcat(string, this.getInteger(slot).(integers).toString());
			}
			case 'f':
			{
				strcat(string, this.getFloat(slot).toString());
			}
			case 's':
			{
				strcat(string, this.getString(slot));
			}
		}
	}

	return string;
}

is.addVector(this, vector0)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new length = vector0.getLength();

	for (new slot = 0; slot < length; ++slot)
	{
		switch (vector0.getType(slot))
		{
			case 'i':
			{
				this.addInteger(vector0.getInteger(slot), false);
			}
			case 'f':
			{
				this.addFloat(vector0.getFloat(slot), false);
			}
			case 's':
			{
				this.addString(vector0.getString(slot), false);
			}
		}
	}

	return this;
}

is.concat(this, ...)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new vector0 = Vector();
	vector0.addVector(this);

	for (new i = 1; i < numargs(); ++i)
	{
		new vector1 = getarg(i);

		if (!vector1.exists())
		{
			continue;
		}

		vector0.addVector(vector1);
	}

	return vector0;
}

is.slice(vector1, begin, end = 0)
{
	new this = This();

	if (vector1.isEmpty())
	{
		return this;
	}

	while(begin < 0)
	{
		begin += vector1.length();
	}

	if (begin > vector1.length())
	{
		return this;
	}

	while(end <= 0)
	{
		end += vector1.length();
	}

	if (end > vector1.length())
	{
		end = vector1.length();
	}

	for (new slot = begin; slot < end; ++slot)
	{
		switch (vector1.getType(slot))
		{
			case 'i':
			{
				this.addInteger(vector1.getInteger(slot), false);
			}
			case 'f':
			{
				this.addFloat(vector1.getFloat(slot), false);
			}
			case 's':
			{
				this.addString(vector1.getString(slot), false);
			}
		}
	}
	
	return this;
}

is.hexify(this, count = 4)
{
	new string[strings.MaxStringLength + 1];

	if (!this.isIntegral())
	{
		return string;
	}

	this.each(integer, index)
	{
		new string0[32];
		string0.format("%%0%dh", count);
		new string1[32];
		string1.format(string0, integer);
		strcat(string, string1.toLowerCase());
	}

	return string;
}

// ----------------------------------------------------------------------

is.print(this)
{
	if (!this.exists())
	{
		err("Вектор не существует");
		return -1;
	}

	new count = this.getLength();
	
	printf("[vec]	%s [vector = %d] (%d)", this.getName(), this, count);
	
	for(new slot = 0; slot < count; ++slot)
	{
		switch (this.getType(slot))
		{
			case 'i':
			{
				printf("[vec]	%d: %d", slot, this.getInteger(slot));
			}
			case 'f':
			{
				printf("[vec]	%d: %f", slot, this.getFloat(slot));
			}
			case 's':
			{
				printf("[vec]	%d: %s", slot, this.getString(slot));
			}
		}
	}

	return this;
}

// ----------------------------------------------------------------------

is._print(this)
{
	new count = vector_size(this);

	printf("[vec] [vector = %d] (%d)", this, count);

	for (new slot = 0; slot < count; ++slot)
	{
		switch (vector_entry_type(this, slot))
		{
			case VEC_ENTRY_TYPE_CELL:
			{
				printf("[vec]	%d: %d", slot, vector_get(this, slot));
			}
			case VEC_ENTRY_TYPE_ARRAY:
			{
				new string[vectors.MaxStringLength + 1];
				vector_get_arr(this, slot, string, vectors.MaxStringLength + 1);
				printf("[vec]	%d: %s", slot, string);
			}
			case VEC_ENTRY_TYPE_FLOAT:
			{
				printf("[vec]	%d: %f", slot, vector_get_float(this, slot));
			}
		}
	}
}

is._foreachConditionInteger(this, iteration, length, &element)
{
	if (iteration >= length)
	{
		return false;
	}

	if (vector_entry_type(this, iteration) != VEC_ENTRY_TYPE_CELL)
	{
		err("Проход по вектору, содержащему что-то кроме типа Integer");
		this.print();
		return false;
	}

	element = vector_get(this, iteration);

	if (element > 0)
	{
		--element;
	}
	
	return true;
}

is._foreachConditionFloat(this, iteration, length, &Float:element)
{
	if (iteration >= length)
	{
		return false;
	}

	if (vector_entry_type(this, iteration) != VEC_ENTRY_TYPE_FLOAT)
	{
		err("Проход по вектору, содержащему что-то кроме типа Float");
		this.print();
		return false;
	}

	element = vector_get_float(this, iteration);
	return true;
}

is._foreachConditionString(this, iteration, length, element[], element_size = sizeof element)
{
	if (iteration >= length)
	{
		return false;
	}

	if (vector_entry_type(this, iteration) != VEC_ENTRY_TYPE_ARRAY)
	{
		err("Проход по вектору, содержащему что-то кроме типа String");
		this.print();
		return false;
	}

	vector_get_arr(this, iteration, element, element_size);

	if (element[0] == 1 && element[1] == EOS)
	{
		element[0] = EOS;
	}

	return true;
}


is._foreachConditionRInteger(this, iteration, &element)
{
	if (iteration < 0)
	{
		return false;
	}

	element = vector_get(this, iteration);

	if (element > 0)
	{
		--element;
	}

	return true;
}

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