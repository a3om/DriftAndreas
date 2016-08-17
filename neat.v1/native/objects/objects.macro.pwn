#define these objects // a0
#define These Objects // A0
#define this object
#define This Object

// ----------------------------------------------------------------------

#define object						objectid
#define objectid.%0(%1)				a0_%0(_:object,%1)
#define object0.%0(%1)				a0_%0(_:object0,%1)
#define object1.%0(%1)				a0_%0(_:object1,%1)
#define object2.%0(%1)				a0_%0(_:object2,%1)
#define object3.%0(%1)				a0_%0(_:object3,%1)
#define object4.%0(%1)				a0_%0(_:object4,%1)
#define object5.%0(%1)				a0_%0(_:object5,%1)

// ----------------------------------------------------------------------

#define a0_create(%0).%1(%2)		a0_%1(_:a0_create(%0), %2)
#define a0_save(%0).%1(%2)			a0_%1(_:a0_save(%0), %2)

// ----------------------------------------------------------------------

#define Object(%0)					a0_create(%0)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This