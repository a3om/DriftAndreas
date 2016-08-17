#define these windows // aa
#define These Windows // AA
#define this window
#define This Window

// ----------------------------------------------------------------------

#define aa_MaxCallbackLength	32
#define aa_MaxBigStringLength	2048
#define aa_MaxCaptionLength		64
#define aa_MaxTitleLength		64
#define aa_MaxInputLength		128
#define aa_MaxButtonLength		16
#define aa_DefaultLineColor		"d7fffe"
#define aa_MaxHeadersLength		256

// ----------------------------------------------------------------------

#define aa_StyleNone				-1
#define aa_StyleMessageBox			DIALOG_STYLE_MSGBOX
#define aa_StyleInput				DIALOG_STYLE_INPUT
#define aa_StyleList				DIALOG_STYLE_LIST
#define aa_StylePassword			DIALOG_STYLE_PASSWORD
#define aa_StyleTable				DIALOG_STYLE_TABLIST

// ----------------------------------------------------------------------

define():

p.Title;
p.Text;
p.Style;
p.Player;
p.Callback;
p.Input;
p.Items;
p.Rows;
p.Textdraws;
p.Button1;
p.Button2;
p.Data;
p.State;
p.Shown;
p.Clicked;
p.Headers;

initialize()
{
	create():

	s.Title("Default Title");
	s.Text("");
	i.Style(these.StyleMessageBox);
	i.Player(-1);
	s.Callback("");
	s.Input("");
	v.Items();
	v.Rows();
	v.Textdraws();
	s.Button1("Button 1");
	s.Button2("");
	m.Data();
	i.State(0);
	i.Shown(false);
	i.Clicked(false);
	v.Headers();

	log("Проинициализировали структуру окон");
}

@p.(Players).Windows;

exports()
{
	@v.(Players).Windows();
	log("Экспортировали переменные");
}

// ----------------------------------------------------------------------

new these.BigString[these.MaxBigStringLength + 1];

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these windows.items // ab
#define These windows.Items // AB
#define this windows.item
#define This windows.Item

// ----------------------------------------------------------------------

#define ab_MaxTextLength		64
#define ab_MaxColorLength		6
#define ab_MaxOptionLength		32
#define ab_DefaultColor			"efefdc"
#define ab_MaxNameLength		32

// ----------------------------------------------------------------------

define():

p.Window;
p.Text;
p.Index;
p.Integer;
p.Formatter;
p.Name;
p.Color;
p.Option;
p.OptionColor;

initialize()
{
	create():

	ni.Window(-1);
	ns.Text("Default");
	ni.Index(-1);
	ni.Integer(-1);
	ni.Formatter(0);
	ns.Name("");
	ns.Color(these.DefaultColor);
	ns.Option("");
	ns.OptionColor("");
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these windows.textdraws // p
#define These windows.Textdraws // P
#define this windows.textdraw
#define This windows.Textdraw

// ----------------------------------------------------------------------

#define ac_DefaultName		"Unknown"
#define ac_MaxNameLength	64

// ----------------------------------------------------------------------

define():

p.Window;
p.Textdraw;
p.Name;
p.Param;

initialize()
{
	create():

	ni.Window(-1);
	ni.Textdraw(-1);
	ns.Name(these.DefaultName);
	ni.Param(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these windows.rows // be
#define These windows.Rows // BE
#define this windows.row
#define This windows.Row

// ----------------------------------------------------------------------

#define be_MaxTextLength		64
#define be_MaxColorLength		6
#define be_DefaultColor			"efefdc"
#define be_MaxNameLength		32

// ----------------------------------------------------------------------

define():

p.Window;
p.Data;
p.Index;
p.Integer;
p.Name;
p.Color;

initialize()
{
	create():

	ni.Window(-1);
	nv.Data();
	ni.Index(-1);
	ni.Integer(-1);
	ns.Name("");
	ns.Color(these.DefaultColor);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This