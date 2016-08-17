#define these pickups // bb
#define These Pickups // BB
#define this pickup
#define This Pickup

// ----------------------------------------------------------------------

define():

p.Pickup;
p.Class;
p.Index;

initialize()
{
	create():

	i.Pickup(0);
	i.Class(-1);
	i.Index(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This