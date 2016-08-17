#define these textdraws // af
#define These Textdraws // AF
#define this textdraw
#define This Textdraw

// ----------------------------------------------------------------------

#define textdraw							textdrawid
#define textdrawid.%0(%1)					af_%0(_:textdraw,%1)
#define textdraw0.%0(%1)					af_%0(_:textdraw0,%1)
#define textdraw1.%0(%1)					af_%0(_:textdraw1,%1)
#define textdraw2.%0(%1)					af_%0(_:textdraw2,%1)
#define textdraw3.%0(%1)					af_%0(_:textdraw3,%1)
#define textdraw4.%0(%1)					af_%0(_:textdraw4,%1)
#define textdraw5.%0(%1)					af_%0(_:textdraw5,%1)

// ----------------------------------------------------------------------

#define af_create(%0).%1(%2)				af_%1(_:af_create(%0), %2)
#define af_setClass(%0).%1(%2)				af_%1(_:af_setClass(%0), %2)
#define af_setIndex(%0).%1(%2)				af_%1(_:af_setIndex(%0), %2)
#define af_setLetterSize(%0).%1(%2)			af_%1(_:af_setLetterSize(%0), %2)
#define af_setAlignment(%0).%1(%2)			af_%1(_:af_setAlignment(%0), %2)
#define af_setColor(%0).%1(%2)				af_%1(_:af_setColor(%0), %2)
#define af_useBox(%0).%1(%2)				af_%1(_:af_useBox(%0), %2)
#define af_setBoxColor(%0).%1(%2)			af_%1(_:af_setBoxColor(%0), %2)
#define af_setShadow(%0).%1(%2)				af_%1(_:af_setShadow(%0), %2)
#define af_setOutline(%0).%1(%2)			af_%1(_:af_setOutline(%0), %2)
#define af_setFont(%0).%1(%2)				af_%1(_:af_setFont(%0), %2)
#define af_setBackgroundColor(%0).%1(%2)	af_%1(_:af_setBackgroundColor(%0), %2)
#define af_setProportional(%0).%1(%2)		af_%1(_:af_setProportional(%0), %2)
#define af_setSelectable(%0).%1(%2)			af_%1(_:af_setSelectable(%0), %2)
#define af_show(%0).%1(%2)					af_%1(_:af_show(%0), %2)
#define af_setText(%0).%1(%2)				af_%1(_:af_setText(%0), %2)
#define af_setPreviewModel(%0).%1(%2)		af_%1(_:af_setPreviewModel(%0), %2)
#define af_setPreviewRotation(%0).%1(%2)	af_%1(_:af_setPreviewRotation(%0), %2)
#define af_setPreviewColor(%0).%1(%2)		af_%1(_:af_setPreviewColor(%0), %2)
#define af_setTextSize(%0).%1(%2)			af_%1(_:af_setTextSize(%0), %2)

// ----------------------------------------------------------------------

#define af_letterSize						af_setLetterSize
#define af_alignment						af_setAlignment
#define af_color							af_setColor
#define af_boxColor							af_setBoxColor
#define af_shadow							af_setShadow
#define af_outline							af_setOutline
#define af_font								af_setFont
#define af_backgroundColor					af_setBackgroundColor
#define af_proportional						af_setProportional
#define af_selectable						af_setSelectable
#define af_text								af_setText
#define af_setString						af_setText
#define af_string							af_setText
#define af_previewModel						af_setPreviewModel
#define af_model							af_setPreviewModel
#define af_previewRotation					af_setPreviewRotation
#define af_rotation							af_setPreviewRotation
#define af_previewColor						af_setPreviewColor
#define af_textSize							af_setTextSize

// ----------------------------------------------------------------------

#define Textdraw(%0)						af_create(%0)

// ----------------------------------------------------------------------

#define af_@@click							OnPlayerClickPlayerTextDraw
#define af_@@globalClick					OnPlayerClickTextDraw

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This