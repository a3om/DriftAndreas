#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

handlers
{
	h.(players).create:
	{
		printf("€грок создан");
		return 0;
	}
	
	h.(players).loggedIn:
	{
		i.player;
		
		new account = player.getAccount();
		
		if(account.hasHouse())
		{
			new house = account.getHouse();
			
			player.setHouse(house);
			house.getPlayers().addInteger(player);
		}
		
		return 0;
	}

	h.(players).destroy:
	{
		i.player;
		
		if(player.hasHouse())
		{
			player.getHouse().getPlayers().removeInteger(player);
		}
		
		return 0;
	}
	
	h.(players).death:
	{
		i.player;
		
		if(player.hasHouse())
		{
			player.setPosition(player.getHouse().getInterior().getPosition());
		}
		
		return 0;
	}
	
	h.(houses).houseWasSolt:
	{
		i.house;
		
		new string[128];
		string.format("Дом %d был продан", house);
		players.existent().sendServerMessage(#ffffff, string);
		return 0;
	}
	
	h.(houses).houseWasBought:
	{
		i.house;
		i.account;
		
		new string[128];
		string.format("Дом %d был куплен аккаунтом %d", house, account);
		players.existent().sendServerMessage(#ffffff, string);
		return 0;
	}
	
	h.(players).enterWorld:
	{
		i.player;
		i.world;
		new string[256];
		string.format("»грок %d вошел в мир %d", player, world);
		log("%s", string);
		player.sendMessage(#00ff00, string);
		return 0;
	}
	
	h.(players).enterArea:
	{
		i.area;
		i.player;
		
		log("€грок вошел в территорию %d", area);
		
		if(area.getClass() != houses)
		{
			return 0;
		}
			
		player.setNearestHouse(area.getIndex());
		
		// player.sendMessage(#00ff00, "Игрок вошел в территорию");
		return 0;
	}

	h.(players).leaveArea:
	{
		i.area;
		i.player;
		
		if(area.getClass() != houses)
		{
			return 0;
		}
		
		player.setNearestHouse(-1);
		
		// player.sendMessage(#00ff00, "Игрок вышел с территории");
		return 0;
	}
	
	// h.(houses.interiors).create:
	// {
		// i.houses.interior;
	
		// houses.interior.getPosition().print();
		
		// log("‘оздание пикапа интерьера");	
			
		// houses.interior.setArea(SphereArea(houses.interior.getPosition(), these.PickupDistance).setClass(houses.interiors).setIndex(houses.interior));
		// houses.interior.setPickup(Pickup(1273, 1, houses.interior.getPosition(), .class = houses.interiors, .index = houses.interior));
		
		// return 0;
	// }
	
	// h.(players).enterHouse:
	// {
		// i.player;
		// i.house;
		
		// new string[128];
		// string.format("€грок %d вошел в дом %d", player, house);
		// players.sendMessageToExistent(#ff00ff, string);
		
		// return 0;
	// }

	return 0;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This