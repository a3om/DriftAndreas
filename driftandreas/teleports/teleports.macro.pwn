#define these teleports // a03
#define These Teleports // a03
#define this teleport
#define This Teleport

// ----------------------------------------------------------------------

#define teleport				teleportid
#define teleportid.%0(%1)		a03_%0(_:teleport,%1)
#define teleport0.%0(%1)		a03_%0(_:teleport0,%1)
#define teleport1.%0(%1)		a03_%0(_:teleport1,%1)
#define teleport2.%0(%1)		a03_%0(_:teleport2,%1)
#define teleport3.%0(%1)		a03_%0(_:teleport3,%1)
#define teleport4.%0(%1)		a03_%0(_:teleport4,%1)
#define teleport5.%0(%1)		a03_%0(_:teleport5,%1)

// ----------------------------------------------------------------------

#define Teleport(%0)				a03_create(%0)

// ----------------------------------------------------------------------

#define a03_(%0).%1(%2)						a03_%1(_:a03_(%0), %2)
#define a03_create(%0).%1(%2)				a03_%1(_:a03_create(%0), %2)
#define a03_destroy(%0).%1(%2)				a03_%1(_:a03_destroy(%0), %2)
#define a03_save(%0).%1(%2)					a03_%1(_:a03_save(%0), %2)
#define a03_getName(%0).%1(%2)				a03_%1(_:a03_getName(%0), %2)
#define a03_findByCommand(%0).%1(%2)		a03_%1(_:a03_findByCommand(%0), %2)
#define a03_getCommand(%0).%1(%2)			strings.%1(_:a03_getCommand(%0), %2)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This