#define these pickups // bb
#define These Pickups // BB
#define this pickup
#define This Pickup

// ----------------------------------------------------------------------

on.playerPickUp(player, pickup)
{
	this = fi(Pickup, pickup);
	
	if (!this.exists())
	{
		err("Пикапа не существует");
		return;
	}

	emit(players, #pickUpPickup, M:i(player).i(this));
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This