#define these structures // a7
#define These Structures // A7
#define this structure
#define This Structure

// ----------------------------------------------------------------------

is.(this)
{
	return this;
}

is.create(name[], objectName[], address, &existentVectorIndex, table[] = "")
{
	new this = vector_size(these.VectorOfName);
	vector_push_back_arr(these.VectorOfName, name);
	vector_push_back_arr(these.VectorOfObjectName, objectName);
	vector_push_back(these.VectorOfAddress, address);

	if (table[0] == EOS)
	{
		vector_push_back_arr(these.VectorOfTable, {1, EOS});
	}
	else
	{
		vector_push_back_arr(these.VectorOfTable, table);
	}

	new data[128];
	format(data, sizeof data, "structure %s existent", name);
	existentVectorIndex = Vector(data);
	vector_push_back(these.VectorOfExistent, existentVectorIndex);
	format(data, sizeof data, "structure %s property name vector", name);
	vector_push_back(these.VectorOfPropertyName, Vector(data));
	format(data, sizeof data, "structure %s property vector vector", name);
	vector_push_back(these.VectorOfPropertyVector, Vector(data));
	format(data, sizeof data, "structure %s property type vector", name);
	vector_push_back(these.VectorOfPropertyType, Vector(data));
	format(data, sizeof data, "structure %s property storable vector", name);
	vector_push_back(these.VectorOfPropertyStorable, Vector(data));
	format(data, sizeof data, "structure %s property default vector", name);
	vector_push_back(these.VectorOfPropertyDefault, Vector(data));
	format(data, sizeof data, "structure %s changes vector", name);
	vector_push_back(these.VectorOfUpdates, Vector(data));

	new temp;
	this.addProperty("existent", 'i', temp);
	this.addProperty("id", 'i', temp);

	return this;
}

// ----------------------------------------------------------------------

is.exists(this)
{
	new length = vector_size(these.VectorOfName);
	return this >= 0 && this < length;
}

is.existent()
{
	new vector = Vector();

	for (new this = 0; this < vector_size(these.VectorOfName); ++this)
	{
		vector.ai(this);
	}

	return vector;
}

is.synchronize(this)
{
	if (!this.exists())
	{
		err("Структуры не существует");
		return -1;
	}

	new table[these.MaxTableLength + 1];
	vector_get_arr(these.VectorOfTable, this, table, sizeof table);

	if (table[0] == 1 && table[1] == EOS)
	{
		new name[these.MaxNameLength + 1];
		vector_get_arr(these.VectorOfName, this, name, sizeof name);
		format(table, sizeof table, "%s", name);
		vector_set_arr(these.VectorOfTable, this, table);
	}

	new propertiesDefaults = vector_get(these.VectorOfPropertyDefault, this); // получили вектор значений по-умолчанию
	new propertiesNames = vector_get(these.VectorOfPropertyName, this); // получили вектор имен
	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств
	new propertiesStorable = vector_get(these.VectorOfPropertyStorable, this); // получили вектор имен
	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств

	// 1. Синхронизация существования таблицы

	format(these.BigString, sizeof these.BigString, "SHOW TABLES LIKE '%s'", table);
	mysql.query(these.BigString);

	if (cache_get_row_count() == 0)
	{
		format(these.BigString, sizeof these.BigString, "CREATE TABLE IF NOT EXISTS `%s` (`id` int(10) unsigned NOT NULL AUTO_INCREMENT, `case` int(10) unsigned NOT NULL", table);

		new countOfStorableProperties = 0;

		for (new length = vectors.getLength(propertiesDefaults), property = 0; property < length; ++property)
		{
			if (!vectors.getInteger(propertiesStorable, property))
			{
				continue;
			}

			new propertyName[these.MaxPropertyNameLength + 1];
			vector_get_arr(propertiesNames, property, propertyName, sizeof propertyName);

			++countOfStorableProperties;

			switch (vectors.getInteger(propertiesTypes, property))
			{
				case 'i':
				{
					format(these.BigString, sizeof these.BigString, "%s, `%s` int(11) NOT NULL", these.BigString, propertyName);
				}
				case 'f':
				{
					format(these.BigString, sizeof these.BigString, "%s, `%s` float(8,2) NOT NULL", these.BigString, propertyName);
				}
				case 's':
				{
					format(these.BigString, sizeof these.BigString, "%s, `%s` varchar(255) COLLATE utf8_unicode_ci NOT NULL", these.BigString, propertyName);
				}
			}
		}

		if (countOfStorableProperties == 0)
		{
			err("Нет ни одного сохраняемого поля в этой структуре");
			return this;
		}

		format(these.BigString, sizeof these.BigString, "%s, PRIMARY KEY (`id`), UNIQUE KEY `case` (`case`)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1", these.BigString);
		mysql.query(these.BigString);
	}

	// 2. Синхронизация существования всех полей

	format(these.BigString, sizeof these.BigString, "SHOW COLUMNS FROM  `%s`", table);
	mysql.query(these.BigString);
	new queries = Vector();

	for (new propertyName[these.MaxPropertyNameLength + 1], propertiesCount = vectors.getLength(propertiesNames), property = 0; property < propertiesCount; ++property)
	{
		if (!vectors.getInteger(propertiesStorable, property))
		{
			continue;
		}

		new found = false;
		vector_get_arr(propertiesNames, property, propertyName, sizeof propertyName);

		for (new fieldName[these.MaxPropertyNameLength + 1], rowsCount = cache_get_row_count(), row = 0; row < rowsCount; ++row)
		{
			cache_get_row(row, 0, fieldName);

			if (strcmp(propertyName, fieldName, true) != 0)
			{
				continue;
			}

			found = true;
			break;
		}

		if (found)
		{
			continue;
		}

		switch (vectors.getInteger(propertiesTypes, property))
		{
			case 'i':
			{
				format(these.BigString, sizeof these.BigString, "ALTER TABLE `%s` ADD `%s` int(11) NOT NULL", table, propertyName);
			}
			case 'f':
			{
				format(these.BigString, sizeof these.BigString, "ALTER TABLE `%s` ADD `%s` float(8,2) NOT NULL", table, propertyName);
			}
			case 's':
			{
				format(these.BigString, sizeof these.BigString, "ALTER TABLE `%s` ADD `%s` varchar(255) COLLATE utf8_unicode_ci NOT NULL", table, propertyName);
			}
		}

		vectors.(queries).addString(these.BigString);

		switch (vectors.getInteger(propertiesTypes, property))
		{
			case 'i':
			{
				format(these.BigString, sizeof these.BigString, "UPDATE `%s` SET `%s` = %d", table, propertyName, vectors.getInteger(propertiesDefaults, property));
			}
			case 'f':
			{
				format(these.BigString, sizeof these.BigString, "UPDATE `%s` SET `%s` = %01.4f", table, propertyName, vectors.getFloat(propertiesDefaults, property));
			}
			case 's':
			{
				new temp[vectors.MaxStringLength * 2 + 1];
				mysql_escape_string(vectors.getString(propertiesDefaults, property), temp);
				format(these.BigString, sizeof these.BigString, "UPDATE `%s` SET `%s` = '%s'", table, propertyName, temp);
			}
		}

		vectors.(queries).addString(these.BigString);
	}

	vectors.(queries).eachString(query, index)
	{
		mysql.query(query);
	}

	// 3. подгружаем существующие объекты

	format(these.BigString, sizeof these.BigString, "SELECT * FROM `%s`", table);
	mysql.query(these.BigString);

	for (new rowsCount = cache_get_row_count(), row = 0; row < rowsCount; ++row)
	{
		new slot = -1;

		for (new fieldName[these.MaxPropertyNameLength + 1], fieldsCount = cache_get_field_count(), field = 0; field < fieldsCount; ++field)
		{
			cache_get_field_name(field, fieldName);

			if (strcmp(fieldName, "case", true) != 0)
			{
				continue;
			}

			slot = cache_get_row_int(row, field);
			break;
		}

		if (slot < 0)
		{
			err("Не удалось получить слот объекта");
			continue;
		}

		slot = this.createObject(slot, true);
		
		if (slot < 0)
		{
			err("Не удалось создать объект");
			continue;
		}

		for (new propertyName[these.MaxPropertyNameLength + 1], propertiesCount = vectors.getLength(propertiesNames), property = 0; property < propertiesCount; ++property)
		{
			vector_get_arr(propertiesNames, property, propertyName, sizeof propertyName);

			if (strcmp(propertyName, "id", true) != 0 && !vectors.getInteger(propertiesStorable, property))
			{
				continue;
			}

			new foundField = -1;

			for (new fieldName[these.MaxPropertyNameLength + 1], fieldsCount = cache_get_field_count(), field = 0; field < fieldsCount; ++field)
			{
				cache_get_field_name(field, fieldName);

				if (strcmp(fieldName, propertyName, true) != 0)
				{
					continue;
				}

				foundField = field;
			}

			if (foundField < 0)
			{
				continue;
			}

			new propertyVector = vectors.getInteger(propertiesVectors, property);

			switch (vectors.getInteger(propertiesTypes, property))
			{
				case 'i':
				{
					vectors.setInteger(propertyVector, slot, cache_get_row_int(row, foundField), false);
				}
				case 'f':
				{
					vectors.setFloat(propertyVector, slot, cache_get_row_float(row, foundField), false);
				}
				case 's':
				{
					new string[vectors.MaxStringLength + 1];
					cache_get_row(row, foundField, string);
					vectors.setString(propertyVector, slot, string, false);
				}
			}
		}

		emit(this.getAddress(), #create, M:si(this.getObjectName(), slot).si(#fromDatabase, true));
	}

	return this;
}

is.getName(this)
{
	new name[these.MaxNameLength + 1];

	if (!this.exists())
	{
		err("Структура не существует");
		return name;
	}

	vector_get_arr(these.VectorOfName, this, name, sizeof name);
	return name;
}

is.getAddress(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return vector_get(these.VectorOfAddress, this);
}

is.getObjectName(this)
{
	new name[these.MaxObjectNameLength + 1];

	if (!this.exists())
	{
		err("Структура не существует");
		return name;
	}

	vector_get_arr(these.VectorOfObjectName, this, name, sizeof name);
	return name;
}

is.addProperty(this, name[], type, &indexVector, storable = false, defaultInteger = 0, Float:defaultFloat = 0.0, defaultString[] = "")
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (name[0] == EOS)
	{
		err("Невозможно создать свойство с пустым именем");
		return this;
	}

	if (type != 'i' && type != 'f' && type != 's' && type != 'v' && type != 'm')
	{
		err("Неверный тип свойства");
		return this;
	}

	name[0] = tolower(name[0]);
	storable = (type == 'v') ? 0 : storable;

	new vector;
	vector = vector_get(these.VectorOfPropertyName, this); // вектор имен свойств
	vector.addString(name);
	vector = vector_get(these.VectorOfPropertyVector, this); // вектор векторов свойств
	new data[128];
	format(data, sizeof data, "%s.%s vector", this.getName(), name);
	indexVector = Vector(data);
	vector.addInteger(indexVector);
	vector = vector_get(these.VectorOfPropertyType, this); // вектор типов свойств
	vector.addInteger(type, false);
	vector = vector_get(these.VectorOfPropertyStorable, this);
	vector.addInteger(storable, false);
	vector = vector_get(these.VectorOfPropertyDefault, this);

	switch (type)
	{
		case 'i':
		{
			vector.addInteger(defaultInteger, false);
		}
		case 'f':
		{
			vector.addFloat(defaultFloat, false);
		}
		case 's':
		{
			vector.addString(defaultString, false);
		}
		case 'v':
		{
			vector.addInteger(0, false);
		}
		case 'm':
		{
			vector.addInteger(0, false);
		}
	}

	return this;
}

is.propertyExists(this, propertyVector)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return false;
	}

	new vector = vector_get(these.VectorOfPropertyVector, this); // вектор векторов свойств
	return vector.hasInteger(propertyVector);
}

is.getNamesOfProperties(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return vector_get(these.VectorOfPropertyName, this);
}

is.getNamesOfCustomProperties(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return this.getNamesOfProperties().slice(2);
}

is.getTypesOfProperties(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return vector_get(these.VectorOfPropertyType, this);
}

is.getStorablelsOfProperties(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return vector_get(these.VectorOfPropertyStorable, this);
}

is.getVectorsOfProperties(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return vector_get(these.VectorOfPropertyVector, this);
}

is.getCountOfObjects(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return false;
	}

	new existentObjects = vector_get(these.VectorOfExistent, this); // получили вектор существующих объектов
	return vectors.(existentObjects).length();
}

is.getObjects(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	return vector_get(these.VectorOfExistent, this); // получили вектор существующих объектов
}

is.getObjectValues(this, slot)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return -1; 
	}

	new vectorOfVector = this.getVectorsOfProperties();
	new vectorOfTypes = this.getTypesOfProperties();
	new vectorOfValues = Vector();

	vectors.(vectorOfVector).each(vector, index)
	{
		switch (vectors.(vectorOfTypes).getInteger(index))
		{
			case 'i', 'v', 'm':
			{
				vectors.(vectorOfValues).addInteger(vector.getInteger(slot), false);
			}
			case 'f':
			{
				vectors.(vectorOfValues).addFloat(vector.getFloat(slot), false);
			}
			case 's':
			{
				vectors.(vectorOfValues).addString(vector.getString(slot), false);
			}
		}
	}

	return vectorOfValues;
}

is.getObjectCustomValues(this, slot)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return -1; 
	}

	return this.getObjectValues(slot).slice(2);
}

is.objectExists(this, slot)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return false;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesVectorExistent = vectors.getInteger(propertiesVectors, 0); // получили первый вектор из векторов свойства (это вектор свойства existent)

	if (slot < 0 || slot >= vectors.getLength(propertiesVectorExistent))
	{
		return false;
	}
	
	return vectors.getInteger(propertiesVectorExistent, slot);
}

is.createObject(this, slot = -1, fromDatabase = false)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesVectorExistent = vectors.getInteger(propertiesVectors, 0); // получили первый вектор из векторов свойства (это вектор свойства existent)
	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств
	new propertiesDefaults = vector_get(these.VectorOfPropertyDefault, this); // получили вектор значений по-умолчанию
	new propertiesNames = vector_get(these.VectorOfPropertyName, this); // получили вектор имен
	new existentObjects = vector_get(these.VectorOfExistent, this); // получили вектор существующих объектов
	new updates = vector_get(these.VectorOfUpdates, this); // получили вектор обновлений свойств

	if (slot < 0)
	{
		slot = vectors.findInteger(propertiesVectorExistent, false);

		if (slot < 0)
		{
			slot = vectors.getLength(propertiesVectorExistent);
		}
	}

	while (slot >= vectors.getLength(propertiesVectorExistent))
	{
		for (new lengthOfProperties = vectors.getLength(propertiesVectors), property = 0; property < lengthOfProperties; ++property)
		{
			new propertyVector = vectors.getInteger(propertiesVectors, property);

			switch (vectors.getInteger(propertiesTypes, property))
			{
				case 'i':
				{
					vectors.addInteger(propertyVector, vectors.getInteger(propertiesDefaults, property), false);
				}
				case 'f':
				{
					vectors.addFloat(propertyVector, vectors.getFloat(propertiesDefaults, property), false);
				}
				case 's':
				{
					vectors.addString(propertyVector, vectors.getString(propertiesDefaults, property), false);
				}
				case 'v':
				{
					new data[128], propertyName[these.MaxPropertyNameLength + 1];
					vector_get_arr(propertiesNames, property, propertyName, sizeof propertyName);
					format(data, sizeof data, "%s.%s", this.getName(), propertyName);
					vectors.addInteger(propertyVector, Vector(data), false);
				}
				case 'm':
				{
					new data[128], propertyName[these.MaxPropertyNameLength + 1];
					vector_get_arr(propertiesNames, property, propertyName, sizeof propertyName);
					format(data, sizeof data, "%s.%s", this.getName(), propertyName);
					vectors.addInteger(propertyVector, Map(data), false);
				}
			}
		}

		vectors.(updates).addInteger(Vector("updated object properties"), false);
	}

	vectors.setInteger(propertiesVectorExistent, slot, true, false);
	vectors.addInteger(existentObjects, slot);

	if (!fromDatabase)
	{
		for (new lengthOfProperties = vectors.getLength(propertiesVectors), property = 2; property < lengthOfProperties; ++property)
		{
			this.setObjectPropertyAsUpdated(slot, property);
		}
	}
	
	return slot;
}

is.destroyObject(this, slot)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return slot;
	}

	// emit(this.getAddress(), #beforeDestroy, Map().i(this.getObjectName(), slot));
	emit(this.getAddress(), #destroy, M:si(this.getObjectName(), slot));
	// emit(this.getAddress(), #afterDestroy, Map().i(this.getObjectName(), slot));

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств
	new propertiesDefaults = vector_get(these.VectorOfPropertyDefault, this); // получили вектор значений по-умолчанию
	new propertiesNames = vector_get(these.VectorOfPropertyName, this); // получили вектор имен
	new idPropertyIndex = vectors.findString(propertiesNames, "id");
	new existentObjects = vector_get(these.VectorOfExistent, this); // получили вектор существующих объектов
	new updates = vector_get(these.VectorOfUpdates, this); // получили вектор обновлений свойств

	if (idPropertyIndex < 0)
	{
		err("Невозможно найти свойство id");
		return slot;
	}

	new propertyIdVector = vectors.getInteger(propertiesVectors, idPropertyIndex);
	new objectId = vectors.getInteger(propertyIdVector, slot);

	for (new lengthOfProperties = vectors.getLength(propertiesVectors), property = 0; property < lengthOfProperties; ++property)
	{
		new propertyVector = vectors.getInteger(propertiesVectors, property);

		switch (vectors.getInteger(propertiesTypes, property))
		{
			case 'i':
			{
				vectors.setInteger(propertyVector, slot, vectors.getInteger(propertiesDefaults, property), false);
			}
			case 'f':
			{
				vectors.setFloat(propertyVector, slot, vectors.getFloat(propertiesDefaults, property), false);
			}
			case 's':
			{
				vectors.setString(propertyVector, slot, vectors.getString(propertiesDefaults, property), false);
			}
			case 'v':
			{
				vectors.clear(vectors.getInteger(propertyVector, slot));
			}
			case 'm':
			{
				maps.clear(vectors.getInteger(propertyVector, slot));
			}
		}
	}

	vectors.(updates).getInteger(slot).(vectors).clear();
	vectors.removeInteger(existentObjects, slot);

	new table[these.MaxTableLength + 1];
	vector_get_arr(these.VectorOfTable, this, table, sizeof table);

	if (table[0] == 1 && table[1] == EOS)
	{
		new name[these.MaxNameLength + 1];
		vector_get_arr(these.VectorOfName, this, name, sizeof name);
		format(table, sizeof table, "%s", name);
		vector_set_arr(these.VectorOfTable, this, table);
	}

	if (objectId != 0)
	{
		format(these.BigString, sizeof these.BigString, "DELETE FROM `%s` WHERE `id` = %d", table, objectId);
		mysql.query(these.BigString);
	}

	return slot;
}

is.saveObject(this, slot)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return slot;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств
	new propertiesNames = vector_get(these.VectorOfPropertyName, this); // получили вектор имен
	new propertiesStorable = vector_get(these.VectorOfPropertyStorable, this); // получили вектор имен
	new idPropertyIndex = vectors.findString(propertiesNames, "id");
	new updates = vector_get(these.VectorOfUpdates, this); // получили вектор обновлений свойств
	new updatesOfObject = vectors.(updates).getInteger(slot);

	if (idPropertyIndex < 0)
	{
		err("Невозможно найти свойство id");
		return slot;
	}

	if (vectors.(propertiesStorable).getLength() == 0)
	{
		err("Нет ни одного сохраняемого поля в этой структуре");
		return slot;
	}

	if (vectors.(updatesOfObject).getLength() == 0)
	{
		return slot;
	}

	new table[these.MaxTableLength + 1];
	vector_get_arr(these.VectorOfTable, this, table, sizeof table);

	if (table[0] == 1 && table[1] == EOS)
	{
		new name[these.MaxNameLength + 1];
		vector_get_arr(these.VectorOfName, this, name, sizeof name);
		format(table, sizeof table, "%s", name);
		vector_set_arr(these.VectorOfTable, this, table);
	}

	new propertyIdVector = vectors.getInteger(propertiesVectors, idPropertyIndex);
	new objectId = vectors.getInteger(propertyIdVector, slot);

	if (objectId == 0)
	{
		format(these.BigString, sizeof these.BigString, "INSERT INTO `%s` SET `case` = %d, ", table, slot);
	}
	else
	{
		format(these.BigString, sizeof these.BigString, "UPDATE `%s` SET ", table);
	}

	vectors.(updatesOfObject).each(property, index)
	{
		if (index != 0)
		{
			format(these.BigString, sizeof these.BigString, "%s, ", these.BigString);
		}

		new propertyVector = vectors.getInteger(propertiesVectors, property);
		new propertyName[these.MaxPropertyNameLength + 1];
		vector_get_arr(propertiesNames, property, propertyName, sizeof propertyName);

		switch (vectors.getInteger(propertiesTypes, property))
		{
			case 'i':
			{
				format(these.BigString, sizeof these.BigString, "%s`%s` = %d", these.BigString, propertyName, vectors.getInteger(propertyVector, slot));
			}
			case 'f':
			{
				format(these.BigString, sizeof these.BigString, "%s`%s` = %01.4f", these.BigString, propertyName, vectors.getFloat(propertyVector, slot));
			}
			case 's':
			{
				new temp[vectors.MaxStringLength * 2 + 1];
				mysql_escape_string(vectors.getString(propertyVector, slot), temp);
				format(these.BigString, sizeof these.BigString, "%s`%s` = '%s'", these.BigString, propertyName, temp);
			}
		}
	}

	if (objectId != 0)
	{
		format(these.BigString, sizeof these.BigString, "%s WHERE `id` = %d", these.BigString, objectId);
	}

	// log("these.BigString = %s", these.BigString);

	if (!mysql.query(these.BigString))
	{
		err("Ошибка MySQL // errno = %d", mysql_errno());
		return slot;
	}

	if (objectId == 0)
	{
		vectors.setInteger(propertyIdVector, slot, cache_insert_id());
	}

	vectors.(updatesOfObject).clear();
	return slot;
}

is.copyObjectFromObject(this, slot, slot1)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return -1;
	}

	if (!this.objectExists(slot1))
	{
		err("Копируемого объекта не существует");
		return slot;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств

	for (new lengthOfProperties = vectors.getLength(propertiesVectors), property = 2; property < lengthOfProperties; ++property)
	{
		new propertyVector = vectors.getInteger(propertiesVectors, property);

		switch (vectors.getInteger(propertiesTypes, property))
		{
			case 'i':
			{
				vectors.setInteger(propertyVector, slot, vectors.getInteger(propertyVector, slot1), false);
				this.setObjectPropertyAsUpdated(slot, property);
			}
			case 'f':
			{
				vectors.setFloat(propertyVector, slot, vectors.getFloat(propertyVector, slot1), false);
				this.setObjectPropertyAsUpdated(slot, property);
			}
			case 's':
			{
				vectors.setString(propertyVector, slot, vectors.getString(propertyVector, slot1), false);
				this.setObjectPropertyAsUpdated(slot, property);
			}
			case 'v':
			{
				vectors.copyFrom(vectors.getInteger(propertyVector, slot), vectors.getInteger(propertyVector, slot1));
			}
			case 'm':
			{
				maps.copyFrom(vectors.getInteger(propertyVector, slot), vectors.getInteger(propertyVector, slot1));
			}
		}
	}

	return slot;
}

is.copyObjectToObject(this, slot, slot1)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return -1;
	}

	if (!this.objectExists(slot1))
	{
		err("Копируемого объекта не существует");
		return slot;
	}

	return this.copyFrom(slot1, slot);
}

is.cloneObject(this, slot1)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	if (!this.objectExists(slot1))
	{
		err("Объекта не существует");
		return slot1;
	}

	new slot = this.createObject();
	this.copyObjectFrom(slot, slot1);
	emit(this.getAddress(), #create, Map().i(this.getObjectName(), slot).i(#fromDatabase, false));
	return slot;
}

is.getObjectId(this, slot)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return 0;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return 0;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesVectorId = vectors.getInteger(propertiesVectors, 1); // получили первый вектор из векторов свойства (это вектор свойства id)
	return vectors.getInteger(propertiesVectorId, slot);
}

is.findObjectId(this, id)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return -1;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new propertiesVectorId = vectors.getInteger(propertiesVectors, 1); // получили первый вектор из векторов свойства (это вектор свойства id)
	return vectors.findInteger(propertiesVectorId, id);
}

is.setObjectPropertyAsUpdated(this, slot, property)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return;
	}

	new propertiesStorable = vector_get(these.VectorOfPropertyStorable, this);

	if (!vectors.(propertiesStorable).getInteger(property))
	{
		return;
	}

	new updates = vector_get(these.VectorOfUpdates, this); // получили вектор обновлений свойств
	new updatesOfObject = vectors.(updates).getInteger(slot);

	if (!vectors.(updatesOfObject).hasInteger(property))
	{
		vectors.(updatesOfObject).addInteger(property);
	}
}

is.getObjectIntegerProperty(this, slot, propertyVector)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return 0;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return 0;
	}

	return vectors.getInteger(propertyVector, slot);
}

fs.getObjectFloatProperty(this, slot, propertyVector)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return 0.0;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return 0.0;
	}

	return vectors.getFloat(propertyVector, slot);
}

fs.getObjectStringProperty(this, slot, propertyVector, string[], string_size = sizeof string)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return;
	}

	vectors.getStringOut(propertyVector, slot, string, string_size);
}

is.setObjectIntegerProperty(this, slot, propertyVector, integer)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new property = vectors.(propertiesVectors).findInteger(propertyVector);

	if (property < 0)
	{
		err("Невозможно найти свойство по вектору свойства");
		return;
	}

	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств

	if (vectors.getInteger(propertiesTypes, property) != 'i')
	{
		err("Невозможно установить integer значение не integer свойству");
		return;
	}

	vectors.setInteger(propertyVector, slot, integer, false);
	this.setObjectPropertyAsUpdated(slot, property);
}

is.setObjectFloatProperty(this, slot, propertyVector, Float:float)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new property = vectors.(propertiesVectors).findInteger(propertyVector);

	if (property < 0)
	{
		err("Невозможно найти свойство по вектору свойства");
		return;
	}

	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств

	if (vectors.getInteger(propertiesTypes, property) != 'f')
	{
		err("Невозможно установить float значение не float свойству");
		return;
	}

	vectors.setFloat(propertyVector, slot, float, false);
	this.setObjectPropertyAsUpdated(slot, property);
}

is.setObjectStringProperty(this, slot, propertyVector, string[])
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new property = vectors.(propertiesVectors).findInteger(propertyVector);

	if (property < 0)
	{
		err("Невозможно найти свойство по вектору свойства");
		return;
	}

	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств

	if (vectors.getInteger(propertiesTypes, property) != 's')
	{
		err("Невозможно установить string значение не string свойству");
		return;
	}

	vectors.setString(propertyVector, slot, string, false);
	this.setObjectPropertyAsUpdated(slot, property);
}

is.setDefaultObjectProperty(this, slot, propertyVector)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}

	if (!this.objectExists(slot))
	{
		err("Объекта не существует");
		return;
	}

	new propertiesVectors = vector_get(these.VectorOfPropertyVector, this); // получили вектор векторов свойств
	new property = vectors.(propertiesVectors).findInteger(propertyVector);

	if (property < 0)
	{
		err("Невозможно найти свойство по вектору свойства");
		return;
	}

	new propertiesTypes = vector_get(these.VectorOfPropertyType, this); // получили вектор типов свойств
	new propertiesDefaults = vector_get(these.VectorOfPropertyDefault, this); // получили вектор значений по-умолчанию

	switch (vectors.getInteger(propertiesTypes, property))
	{
		case 'i':
		{
			vectors.setInteger(propertyVector, slot, vectors.getInteger(propertiesDefaults, property), false);
			this.setObjectPropertyAsUpdated(slot, property);
		}
		case 'f':
		{
			vectors.setFloat(propertyVector, slot, vectors.getFloat(propertiesDefaults, property), false);
			this.setObjectPropertyAsUpdated(slot, property);
		}
		case 's':
		{
			vectors.setString(propertyVector, slot, vectors.getString(propertiesDefaults, property), false);
			this.setObjectPropertyAsUpdated(slot, property);
		}
		case 'v':
		{
			vectors.clear(vectors.getInteger(propertyVector, slot));
		}
		case 'm':
		{
			maps.clear(vectors.getInteger(propertyVector, slot));
		}
	}
}

// ----------------------------------------------------------------------

is.exportProperties(this)
{
	if (!this.exists())
	{
		err("Структура не существует");
		return;
	}
	
	for (new callback[32], address = 0xA0; address < 0xFFF; ++address)
	{
		format(callback, sizeof callback, "%s_@exports", integers.(address).toHexString());

		if (funcidx(callback) < 0)
		{
			continue;
		}

		call(callback, "i", this);
	}
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This