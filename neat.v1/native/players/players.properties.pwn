#define these players // a1
#define These Players // A1
#define this player
#define This Player

// ----------------------------------------------------------------------

#define ae_MaxNameLength				MAX_PLAYER_NAME
#define ae_MaxLoggedOutConnectionTime	120

// ----------------------------------------------------------------------

define():

p.ConnectedAt;
p.Name;
p.Color;
p.Spawned;
p.Position;
p.Skin;
p.Money;

initialize()
{
	create():
	
	i.ConnectedAt(0);
	s.Name("");
	s.Color(#000000);
	i.Spawned(false);
	i.Position(-1);
	i.Skin(0);
	i.Money(0);

	export();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This