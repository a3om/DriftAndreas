#define these floats // a4
#define These Floats // A4
#define this float
#define This Float

// ----------------------------------------------------------------------

#define float.%0(%1)		a4_%0(_:float,%1)
#define float0.%0(%1)		a4_%0(_:float0,%1)
#define float1.%0(%1)		a4_%0(_:float1,%1)
#define float2.%0(%1)		a4_%0(_:float2,%1)
#define float3.%0(%1)		a4_%0(_:float3,%1)
#define float4.%0(%1)		a4_%0(_:float4,%1)
#define float5.%0(%1)		a4_%0(_:float5,%1)

// ----------------------------------------------------------------------

#define a4_(%0).%1(%2)						a4_%1(Float:_:%0, %2)
#define a4_print(%0).%1(%2)					a4_%1(Float:_:a4_print(%0), %2)
#define a4_toString(%0).%1(%2)				strings.%1(_:a4_toString(%0), %2)

// ----------------------------------------------------------------------

#define floor								a4_floor
#define ceil								a4_ceil
#define round								a4_round

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This