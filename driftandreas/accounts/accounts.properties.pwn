#define these accounts // a00
#define These Accounts // A00
#define this account
#define This Account

// ----------------------------------------------------------------------

#define a00_MaxNameLength				16
#define a00_MaxFormattedNameLength		(8 + 16 + 1 + 3 + 1)
#define a00_MaxPasswordHashLength		32
#define a00_ConnectionColor				#333333

// ----------------------------------------------------------------------

new players.LoggedIn = -1;

// ----------------------------------------------------------------------

define():

p.Name;
p.PasswordHash;
p.Player;
p.PosX;
p.PosY;
p.PosZ;
p.PosR;
p.Skin;
p.Color;
p.Money;
p.Something;

initialize()
{
	create():

	ss.Name("");
	ss.PasswordHash("");
	si.Player(-1);
	sf.PosX(0.0);
	sf.PosY(0.0);
	sf.PosZ(0.0);
	sf.PosR(0.0);
	si.Skin(0);
	ss.Color(#000000);
	si.Money(0);
	si.Something(-1);

	export();
	sync();
}

@p.(Players).Account;

exports()
{
	@i.(Players).Account(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This