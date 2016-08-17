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
				log("(����� ���������) ��������� ����� ���� // param = %d", windows.textdraw.getParam());
				return Window(#mainMenu, player);
			}

			log("(�� ����� ���������) ��������� ��� ����");
			return -1;
		}

		if (button) // ��� ������� �� ������ ������
		{
			switch (windows.item.getIndex())
			{
				case 0:
				{
					log("type = %s", window.getData().getString(#type));
					return Window(#mainMenu, player); // ��������� ������ ������� ���� ������ �������
				}
				case 1:
				{
					return window; // ��������� ������� ���� (������ �������� ��� ��, ������ ������ ����������� ������ ����)
				}
			}

			return -1;
		}
		
		return -1; // ��������� ����� ��� ��������� ������
	}

	window.setStyle(windows.StyleList);

	if (single)
	{
		window.setTitle("������� ���� (����� ������)");
	}
	else
	{
		window.setTitle("������� ����");
	}
	
	window.addItem("������� ����� �� ����", 100500, 1, "ff0000", 0, "Test2");
	window.addItem("�������� ���� ������", 100500, 2, "6cf6ff", 0, "Test2");
	window.setButtons("�������", "�������"); // ������ ������ � ������ ��������� ������� ������ ����� "�������"
	window.getData().setInteger(#player, 7).setString(#type, "������� ����������");
	window.addTextdraw(#nameOfTextdraw, 300.0, 300.0, "test textdraw on the top of the screen", 100500).selectable().show();
	return window;
}

// w.infoDialogBlaBlaBla(dialog, player, click, button, single)
// {
	// if (click)
	// {
	// 	if (button) // ��� ������� �� ������ ������ (����� �����)
	// 	{
	// 		return Dialog(#infoDialogBlaBlaBla, player); // ��������� ����� !����� ��! ������
	// 	}
		
	// 	return -1; // ��������� ����� ��� ��������� ������
	// }

	// dialog.setStyle(dialogs.StyleMessageBox).setTitle("������ � �����������").setButton1("����");

	// if (single)
	// {
	// 	dialog.setButton2("�������");
	// }
	// else
	// {
	// 	dialog.setButton2("�����");
	// }

	// dialog.addLine("������ ����� ����������").addLine("������ ����� ����������").addLine("������ ������� ����� ����������", "00ff00");
	// return dialog;
// }

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This