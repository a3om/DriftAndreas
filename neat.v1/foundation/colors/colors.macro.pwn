#define these colors // b4
#define These Colors // B4
#define this color
#define This Color

// ----------------------------------------------------------------------

#define color				colorid
#define colorid.%0(%1)		b4_%0(_:color,%1)
#define color0.%0(%1)		b4_%0(_:color0,%1)
#define color1.%0(%1)		b4_%0(_:color1,%1)
#define color2.%0(%1)		b4_%0(_:color2,%1)
#define color3.%0(%1)		b4_%0(_:color3,%1)
#define color4.%0(%1)		b4_%0(_:color4,%1)
#define color5.%0(%1)		b4_%0(_:color5,%1)

// ----------------------------------------------------------------------

#define b4_(%0).%1(%2)						b4_%1(_:%0, %2)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This