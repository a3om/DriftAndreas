#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

c(player, command[], params[])
{
	command(#c-h)
	{
		new price;
		if(sscanf(params, "i", price))
		{
			player.sendMessage(#ffffff, "������ ����� ����������");
			return true;
		}
		
		new 
			position = player.getPosition()
		;
		position.setR(position.getR() + 180);
		House(position, price).save();
		player.sendMessage(#ffffff, "������� ���");
		return 1;
	}
	
	command(#d-h)
	{
		new 
			house = player.getNearestHouse()
		;
		
		house.destroy();
		player.sendMessage(#ffffff, "������� ����");
		return 1;
	}
	
	command("c-h-i")
	{
		new 
			price,
			string[128]
		;
		if(sscanf(params, "is[128]", price, string))
		{
			player.sendMessage(#ffffff, "������ ����� ����������");
			return true;
		}
		
		houses.interiors.create(player.getPosition(), string, price).save();
		player.sendMessage(#ffffff, "������� ��������");
		return 1;
	}
	
	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This