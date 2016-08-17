#define these positions // b2
#define These Positions // B2
#define this position
#define This Position

// ----------------------------------------------------------------------

#define b2_DefaultName		"Unknown"

// ----------------------------------------------------------------------

define():

p.X;
p.Y;
p.Z;
p.RX;
p.RY;
p.RZ;
p.Name;

initialize()
{
	create():

	f.X(0.0);
	f.Y(0.0);
	f.Z(0.0);
	f.RX(0.0);
	f.RY(0.0);
	f.RZ(0.0);
	s.Name(these.DefaultName);
}

new these.Suicide;

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This