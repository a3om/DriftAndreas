#define these worlds // bd
#define These Worlds // BD
#define this world
#define This World

// ----------------------------------------------------------------------

define():

p.Players;
p.Class;
p.Index;

initialize()
{
	create():

	v.Players();
	i.Class(-1);
	i.Index(-1);
}

new these.Default;

@p.(Players).World;

exports()
{
	@i.(Players).World(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This