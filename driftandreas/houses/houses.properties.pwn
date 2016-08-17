#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

#define a01_PickupDistance				2

#define a01_SellHouse					1
#define a01_NoSellHouse					-1

// ----------------------------------------------------------------------

define():

p.PosX;
p.PosY;
p.PosZ;
p.PosR;
p.Area;
p.Price;
p.Interior;
p.Pickup;
p.Owner;
p.Close;
p.SellPrice;
p.World;
p.Players;

initialize() 
{
	create():	

	sf.PosX(0.0);
	sf.PosY(0.0);
	sf.PosZ(0.0);
	sf.PosR(0.0);
	si.Price(0);
	si.Close(true);
	si.SellPrice(0);
	si.Interior(-1);
	ni.Pickup(-1);
	si.Owner(-1);
	ni.World(-1);
	ni.Area(-1);
	nv.Players();
	
	export();
	sync();
}


@p.(Players).NearestHouse;
@p.(Players).House;
@p.(Accounts).House;

exports()
{
	@i.(Players).NearestHouse(-1);
	@i.(Players).House(-1);
	@si.(Accounts).House(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This


#define these houses.interiors // a02
#define These houses.Interiors // a02
#define this houses.interior
#define This houses.Interior

// ----------------------------------------------------------------------

#define a02_PickupDistance				2
#define a02_MaxNameLenght				64

// ----------------------------------------------------------------------

define():

p.Name;
p.Price;
p.Interior;
p.PosX;
p.PosY;
p.PosZ;
p.PosR;
p.Pickup;
p.Area;

initialize()
{
	create():

	ss.Name("");
	si.Price(-1);
	si.Interior(-1);
	sf.PosX(0.0);
	sf.PosY(0.0);
	sf.PosZ(0.0);
	sf.PosR(0.0);
	ni.Pickup(-1);
	ni.Area(-1);
	
	sync();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This