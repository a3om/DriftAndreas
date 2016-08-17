#define these test0
#define These Test0

// ----------------------------------------------------------------------

w.structures(window, player, click, button, close)
{
	if (click)
	{
		if (button)
		{
			i.windows.row;
			new structure = windows.row.getInteger();
			player.openWindow(#structureObjects, .map = M:i(structure));
			return;
		}

		if (close)
		{
			player.closeAllWindows();
			return;
		}

		player.closeWindow();
		return;
	}

	window.setStyle(windows.StyleTable);
	window.setTitle("Структуры системы");
	window.setHeaders(V:s("Название структуры").s("Количество объектов"));

	structures.existent().each(structure, index)
	{
		window.addRow(V:s(structure.getName()).i(structure.getCountOfObjects()), structure);
	}

	window.setButtons("Выбрать", "Закрыть");
}

w.structureObjects(window, player, click, button, close)
{
	i.map;

	if (click)
	{
		if (button)
		{
			i.windows.item;

			new structure = map.gi(#structure);
			new object = windows.item.getInteger();
			player.openWindow(#structureObject, .map = M:i(structure).i(object));
			return;
		}

		if (close)
		{
			player.closeAllWindows();
			return;
		}

		player.closeWindow();
		return;
	}

	new structure = map.gi(#structure);
	new string[128];
	string.format("Объекты структуры %s", structure.getName());
	window.style(windows.StyleList).title(string);

	structure.getObjects().sort().each(object, index)
	{
		window.addItem(integers.(object).toString(), object);
	}

	window.buttons("Выбрать", "Закрыть");
}

w.structureObject(window, player, click, button, close)
{
	if (click)
	{
		if (button)
		{
			player.showWindow();
			return;
		}

		if (close)
		{
			player.closeAllWindows();
			return;
		}

		player.closeWindow();
		return;
	}

	i.map;
	new structure = map.gi(#structure);
	new object = map.gi(#object);

	new string[128];
	string.format("Объект #%d структуры %s", object, structure.getName());
	window.style(windows.StyleTable).title(string).headers(V:s("Имя свойства").s("Тип свойства").s("Значение свойства"));

	new typesOfProperties = structure.getTypesOfProperties();
	new namesOfProperties = structure.getNamesOfProperties();
	new vectorsOfProperties = structure.getVectorsOfProperties();

	vectors.(typesOfProperties).each(type, property)
	{
		new vector = Vector();
		vector.addString(vectors.(namesOfProperties).getString(property));
		new vector1 = vectors.(vectorsOfProperties).getInteger(property);

		switch (type)
		{
			case 'i':
			{
				vector.addString("integer");
				vector.addInteger(vector1.getInteger(object), false);
			}
			case 'f':
			{
				vector.addString("float");
				vector.addFloat(vector1.getFloat(object), false);
			}
			case 's':
			{
				vector.addString("string");
				vector.addString(vector1.getString(object), false);
			}
			case 'v':
			{
				vector.addString("vector");
				vector.addInteger(vector1.getInteger(object), false);
			}
			case 'm':
			{
				vector.addString("map");
				vector.addInteger(vector1.getInteger(object), false);
			}
		}

		window.addRow(vector);
	}

	window.buttons("Выбрать", "Закрыть");
}

w.exampleTable(window, player, click, button, close)
{
	if (click)
	{
		player.closeWindow();
		return;
	}

	window.style(windows.StyleTable);
	window.title("Expample Table With Headers");
	window.headers(V:s("One").s("Two").s("Three"));

	window.addRow(V:i(1).i(2).i(3));
	window.addRow(V:i(4).i(5).i(6));
	window.addRow(V:i(7).i(8).i(9));
	window.addRow(V:i(10).i(11).i(12));

	window.button("Закрыть");
}

// ----------------------------------------------------------------------

#undef these
#undef These