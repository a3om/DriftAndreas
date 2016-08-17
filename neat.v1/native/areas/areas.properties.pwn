#define these areas // b5
#define These Areas // B5
#define this area
#define This Area

// ----------------------------------------------------------------------

define():

p.Area;
p.Class;
p.Index;
p.Players;
p.Vehicles;
p.AttachingVehicle;

initialize()
{
	create():

	i.Area(0);
	i.Class(-1);
	i.Index(-1);
	v.Players();
	v.Vehicles();
	i.AttachingVehicle(-1);
	
	export();
}

@p.(Players).Areas;
@p.(Vehicles).Areas;

exports()
{
	@v.(Players).Areas();
	@v.(Vehicles).Areas();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This