#define these worlds // bd
#define These Worlds // BD
#define this worlds
#define This Worlds

// ----------------------------------------------------------------------

#define world								worldid
#define worldid.%0(%1)						bd_%0(_:world,%1)
#define world0.%0(%1)						bd_%0(_:world0,%1)
#define world1.%0(%1)						bd_%0(_:world1,%1)
#define world2.%0(%1)						bd_%0(_:world2,%1)
#define world3.%0(%1)						bd_%0(_:world3,%1)
#define world4.%0(%1)						bd_%0(_:world4,%1)
#define world5.%0(%1)						bd_%0(_:world5,%1)

// ----------------------------------------------------------------------

#define bd_(%0).%1(%2)						bd_%1(_:%0, %2)
#define bd_create(%0).%1(%2)				bd_%1(_:bd_create(%0), %2)
#define bd_setClass(%0).%1(%2)				bd_%1(_:bd_setClass(%0), %2)
#define bd_setIndex(%0).%1(%2)				bd_%1(_:bd_setIndex(%0), %2)
#define bd_getPlayers(%0).%1(%2)			vectors.%1(_:bd_getPlayers(%0), %2)

// ----------------------------------------------------------------------

#define ae_getWorld(%0).%1(%2)				bd_%1(_:ae_getWorld(%0), %2)
#define ae_setWorld(%0).%1(%2)				ae_%1(_:ae_setWorld(%0), %2)
#define ae_moveToWorld(%0).%1(%2)			ae_%1(_:ae_moveToWorld(%0), %2)

// ----------------------------------------------------------------------

#define World(%0)							bd_create(%0)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This