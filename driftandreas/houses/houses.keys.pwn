#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

k(player, key, up, down)
{
	if(key == keys.SecondaryAttack)
	{
		if(up)
		{
			if(player.hasNearestHouse())
			{
				new 
					house = player.getNearestHouse()
				;
				player.stopEnterVehicle();

				player.openWindow(#houseMenu, .map = M:i(house));
				return;
			}
			
			if(player.hasHouse())
			{
				player.stopEnterVehicle();
				player.openWindow(#houseMenu, .map = M:si(#house, player.getHouse()));
				return;
			}
			
			return;
		}
		
		return;
	}
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This