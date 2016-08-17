#define these teleports // a01
#define These Teleports // a01
#define this teleport
#define This Teleport

// ----------------------------------------------------------------------

define():

p.PosX;
p.PosY;
p.PosZ;
p.PosR;
p.Name;
p.Command;

initialize() 
{
	create():	

	sf.PosX(0.0);
	sf.PosY(0.0);
	sf.PosZ(0.0);
	sf.PosR(0.0);
	ss.Name("");
	ss.Command("");
	
	sync();
}


// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This