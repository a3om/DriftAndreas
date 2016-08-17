#define these integers // a3
#define These Integers // A3
#define this integer
#define This Integer

// ----------------------------------------------------------------------

#define integer.%0(%1)		a3_%0(_:integer,%1)
#define integer0.%0(%1)		a3_%0(_:integer0,%1)
#define integer1.%0(%1)		a3_%0(_:integer1,%1)
#define integer2.%0(%1)		a3_%0(_:integer2,%1)
#define integer3.%0(%1)		a3_%0(_:integer3,%1)
#define integer4.%0(%1)		a3_%0(_:integer4,%1)
#define integer5.%0(%1)		a3_%0(_:integer5,%1)

// ----------------------------------------------------------------------

#define a3_(%0).%1(%2)						a3_%1(_:%0, %2)
#define a3_print(%0).%1(%2)					a3_%1(_:a3_print(%0), %2)
#define a3_toString(%0).%1(%2)				strings.%1(_:a3_toString(%0), %2)
#define a3_toHexString(%0).%1(%2)			strings.%1(_:a3_toHexString(%0), %2)
#define a3_swap(%0).%1(%2)					a3_%1(_:a3_swap(%0), %2)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This