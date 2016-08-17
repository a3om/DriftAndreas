#define these windows // aa
#define These Windows // AA
#define this window
#define This Window

// ----------------------------------------------------------------------

#define window								windowid
#define windowid.%0(%1)						aa_%0(_:window,%1)
#define window0.%0(%1)						aa_%0(_:window0,%1)
#define window1.%0(%1)						aa_%0(_:window1,%1)
#define window2.%0(%1)						aa_%0(_:window2,%1)
#define window3.%0(%1)						aa_%0(_:window3,%1)
#define window4.%0(%1)						aa_%0(_:window4,%1)
#define window5.%0(%1)						aa_%0(_:window5,%1)

// ----------------------------------------------------------------------

#define aa_create(%0).%1(%2)				aa_%1(_:aa_create(%0), %2)
#define aa_setTitle(%0).%1(%2)				aa_%1(_:aa_setTitle(%0), %2)
#define aa_setText(%0).%1(%2)				aa_%1(_:aa_setText(%0), %2)
#define aa_setStyle(%0).%1(%2)				aa_%1(_:aa_setStyle(%0), %2)
#define aa_setInput(%0).%1(%2)				aa_%1(_:aa_setInput(%0), %2)
#define aa_addItem(%0).%1(%2)				aa_%1(_:aa_addItem(%0), %2)
#define aa_addTextdraw(%0).%1(%2)			textdraws.%1(_:aa_addTextdraw(%0), %2)
#define aa_addLine(%0).%1(%2)				aa_%1(_:aa_addLine(%0), %2)
#define aa_setButton1(%0).%1(%2)			aa_%1(_:aa_setButton1(%0), %2)
#define aa_setButton2(%0).%1(%2)			aa_%1(_:aa_setButton2(%0), %2)
#define aa_setButtons(%0).%1(%2)			aa_%1(_:aa_setButtons(%0), %2)
#define aa_stringifyItems(%0).%1(%2)		aa_%1(_:aa_stringifyItems(%0), %2)
#define aa_getItems(%0).%1(%2)				vectors.%1(_:aa_getItems(%0), %2)
#define aa_getRows(%0).%1(%2)				vectors.%1(_:aa_getRows(%0), %2)
#define aa_getTextdraws(%0).%1(%2)			vectors.%1(_:aa_getTextdraws(%0), %2)
#define aa_getPlayer(%0).%1(%2)				players.%1(_:aa_getPlayer(%0), %2)
#define aa_getData(%0).%1(%2)				maps.%1(_:aa_getData(%0), %2)
#define aa_getInput(%0).%1(%2)				strings.%1(_:aa_getInput(%0), %2)
#define aa_setHeaders(%0).%1(%2)			aa_%1(_:aa_setHeaders(%0), %2)
#define aa_getHeaders(%0).%1(%2)			vectors.%1(_:aa_getHeaders(%0), %2)

// ----------------------------------------------------------------------

#define aa_@@response						OnDialogResponse

// ----------------------------------------------------------------------

#define aa_setButton						aa_setButton1
#define aa_player							aa_getPlayer
#define aa_style 							aa_setStyle
#define aa_title 							aa_setTitle
#define aa_headers 							aa_setHeaders
#define aa_buttons 							aa_setButtons
#define aa_button							aa_setButton
#define aa_button1							aa_setButton1
#define aa_button2							aa_setButton2

// ----------------------------------------------------------------------

#define Window(%0)							aa_create(%0)

// ----------------------------------------------------------------------

// ae ~ players

// ----------------------------------------------------------------------

#define ae_getWindows(%0).%1(%2)			vectors.%1(_:ae_getWindows(%0), %2)
#define ae_openWindow(%0).%1(%2)			ae_%1(_:ae_openWindow(%0), %2)
#define ae_closeWindow(%0).%1(%2)			ae_%1(_:ae_closeWindow(%0), %2)
#define ae_closeAllWindows(%0).%1(%2)		ae_%1(_:ae_closeAllWindows(%0), %2)
#define ae_showWindow(%0).%1(%2)			ae_%1(_:ae_showWindow(%0), %2)
#define ae_hideWindow(%0).%1(%2)			ae_%1(_:ae_hideWindow(%0), %2)
#define ae_getLastWindow(%0).%1(%2)			windows.%1(_:ae_getLastWindow(%0), %2)

// ----------------------------------------------------------------------

#define ae_windows							ae_getWindows

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

#define aa_item								aa_itemid
#define aa_itemid.%0(%1)					ab_%0(_:aa_item,%1)
#define aa_item0.%0(%1)						ab_%0(_:aa_item0,%1)
#define aa_item1.%0(%1)						ab_%0(_:aa_item1,%1)
#define aa_item2.%0(%1)						ab_%0(_:aa_item2,%1)
#define aa_item3.%0(%1)						ab_%0(_:aa_item3,%1)
#define aa_item4.%0(%1)						ab_%0(_:aa_item4,%1)
#define aa_item5.%0(%1)						ab_%0(_:aa_item5,%1)

// ----------------------------------------------------------------------

#define ab_create(%0).%1(%2)				ab_%1(_:ab_create(%0), %2)
#define ab_getWindow(%0).%1(%2)				windows.%1(_:ab_getWindow(%0), %2)
#define ab_getName(%0).%1(%2)				strings.%1(_:ab_getName(%0), %2)

// ----------------------------------------------------------------------

#define aa_Item(%0)							ab_create(%0)

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

#define aa_textdraw							aa_textdrawid
#define aa_textdrawid.%0(%1)				ac_%0(_:aa_textdraw,%1)
#define aa_textdraw0.%0(%1)					ac_%0(_:aa_textdraw0,%1)
#define aa_textdraw1.%0(%1)					ac_%0(_:aa_textdraw1,%1)
#define aa_textdraw2.%0(%1)					ac_%0(_:aa_textdraw2,%1)
#define aa_textdraw3.%0(%1)					ac_%0(_:aa_textdraw3,%1)
#define aa_textdraw4.%0(%1)					ac_%0(_:aa_textdraw4,%1)
#define aa_textdraw5.%0(%1)					ac_%0(_:aa_textdraw5,%1)

// ----------------------------------------------------------------------

#define ac_create(%0).%1(%2)				ac_%1(_:ac_create(%0), %2)
#define ac_getName(%0).%1(%2)				strings.%1(_:ac_getName(%0), %2)
#define ac_getWindow(%0).%1(%2)				windows.%1(_:ac_getWindow(%0), %2)

// ----------------------------------------------------------------------

#define aa_Textdraw(%0)						ac_create(%0)

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

#define aa_row								aa_rowid
#define aa_rowid.%0(%1)						be_%0(_:aa_row,%1)
#define aa_row0.%0(%1)						be_%0(_:aa_row0,%1)
#define aa_row1.%0(%1)						be_%0(_:aa_row1,%1)
#define aa_row2.%0(%1)						be_%0(_:aa_row2,%1)
#define aa_row3.%0(%1)						be_%0(_:aa_row3,%1)
#define aa_row4.%0(%1)						be_%0(_:aa_row4,%1)
#define aa_row5.%0(%1)						be_%0(_:aa_row5,%1)

// ----------------------------------------------------------------------

#define be_create(%0).%1(%2)				be_%1(_:be_create(%0), %2)
#define be_getWindow(%0).%1(%2)				windows.%1(_:be_getWindow(%0), %2)
#define be_getData(%0).%1(%2)				vectors.%1(_:be_getData(%0), %2)
#define be_getName(%0).%1(%2)				strings.%1(_:be_getName(%0), %2)

// ----------------------------------------------------------------------

#define aa_Row(%0)							be_create(%0)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This