#define these textdraws // af
#define These Textdraws // AF
#define this textdraw
#define This Textdraw

// ----------------------------------------------------------------------

define():

p.Class;
p.Index;
p.Player;
p.SampTextdraw;
p.Shown;
p.X;
p.Y;
p.Text;

initialize()
{
	create():
	
	i.Class(-1);
	i.Index(-1);
	i.Player(-1);
	i.SampTextdraw(INVALID_TEXT_DRAW);
	i.Shown(false);
	f.X(0.0);
	f.Y(0.0);
	s.Text("_");
}

@p.(Players).DisableTextdrawHandle;

exports()
{
	@i.(Players).DisableTextdrawHandle(false);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This