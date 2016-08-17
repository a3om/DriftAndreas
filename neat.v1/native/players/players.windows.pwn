#define these players // ae
#define These Players // AE
#define this player
#define This Player

// ----------------------------------------------------------------------

w.mainMenu(window, player, click, button, single, windows.item, windows.textdraw)
{
	if (click)
	{
		log("window = %d, player = %d, click = %d, button = %d, single = %d, windows.item = %d, windows.textdraw = %d", window, player, click, button, single, windows.item, windows.textdraw);

		if (windows.textdraw.exists())
		{
			if (windows.textdraw.isName(#nameOfTextdraw))
			{
				log("(Нашли текстдрав) Открываем новое окно // param = %d", windows.textdraw.getParam());
				return Window(#mainMenu, player);
			}

			log("(Не нашли текстдрав) Закрываем это окно");
			return -1;
		}

		if (button) // при нажатии на кнопку выбора
		{
			switch (windows.item.getIndex())
			{
				case 0:
				{
					log("type = %s", window.getData().getString(#type));
					return Window(#mainMenu, player); // открываем второе игровое меню поверх первого
				}
				case 1:
				{
					return window; // обновляем игровое меню (диалог остается тем же, только данные обновляются внутри него)
				}
			}

			return -1;
		}
		
		return -1; // переходим назад или закрываем диалог
	}

	window.setStyle(windows.StyleList);

	if (single)
	{
		window.setTitle("Главное меню (самый первый)");
	}
	else
	{
		window.setTitle("Главное меню");
	}
	
	window.addItem("Открыть такое же меню", 100500, 1, "ff0000", 0, "Test2");
	window.addItem("Обновить этот диалог", 100500, 2, "6cf6ff", 0, "Test2");
	window.setButtons("Выбрать", "Закрыть"); // Вторая кнопка в случае листового диалога всегда будет "Закрыть"
	window.getData().setInteger(#player, 7).setString(#type, "Покупка автомобиля");
	window.addTextdraw(#nameOfTextdraw, 300.0, 300.0, "test textdraw on the top of the screen", 100500).selectable().show();
	return window;
}

// w.infoDialogBlaBlaBla(dialog, player, click, button, single)
// {
	// if (click)
	// {
	// 	if (button) // при нажатии на первую кнопку (самую левую)
	// 	{
	// 		return Dialog(#infoDialogBlaBlaBla, player); // открываем новый !такой же! диалог
	// 	}
		
	// 	return -1; // переходим назад или закрываем диалог
	// }

	// dialog.setStyle(dialogs.StyleMessageBox).setTitle("Диалог с информацией").setButton1("Окей");

	// if (single)
	// {
	// 	dialog.setButton2("Закрыть");
	// }
	// else
	// {
	// 	dialog.setButton2("Назад");
	// }

	// dialog.addLine("Первая линия информации").addLine("Вторая линия информации").addLine("Третяя зеленая линия информации", "00ff00");
	// return dialog;
// }

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This