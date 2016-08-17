#define these houses // a01
#define These Houses // a01
#define this house
#define This House

// ----------------------------------------------------------------------

#define house				houseid
#define houseid.%0(%1)		a01_%0(_:house,%1)
#define house0.%0(%1)		a01_%0(_:house0,%1)
#define house1.%0(%1)		a01_%0(_:house1,%1)
#define house2.%0(%1)		a01_%0(_:house2,%1)
#define house3.%0(%1)		a01_%0(_:house3,%1)
#define house4.%0(%1)		a01_%0(_:house4,%1)
#define house5.%0(%1)		a01_%0(_:house5,%1)

// ----------------------------------------------------------------------

#define House(%0)				a01_create(%0)

// ----------------------------------------------------------------------

#define a01_(%0).%1(%2)						a01_%1(_:a01_(%0), %2)
#define a01_create(%0).%1(%2)				a01_%1(_:a01_create(%0), %2)
#define a01_destroy(%0).%1(%2)				a01_%1(_:a01_destroy(%0), %2)
#define a01_save(%0).%1(%2)					a01_%1(_:a01_save(%0), %2)
#define a01_setOwner(%0).%1(%2)				a01_%1(_:a01_setOwner(%0), %2)
#define a01_setClose(%0).%1(%2)				a01_%1(_:a01_setClose(%0), %2)
#define a01_setSell(%0).%1(%2)				a01_%1(_:a01_setSell(%0), %2)
#define a01_setSellPrice(%0).%1(%2)			a01_%1(_:a01_setSellPrice(%0), %2)
#define a01_changePickup(%0).%1(%2)			a01_%1(_:a01_changePickup(%0), %2)
#define a01_setInterior(%0).%1(%2)			a01_%1(_:a01_setInterior(%0), %2)
#define a01_getWorld(%0).%1(%2)				worlds.%1(_:a01_getWorld(%0), %2)
#define a01_getInterior(%0).%1(%2)			houses.interiors.%1(_:a01_getInterior(%0), %2)
#define a01_getOwner(%0).%1(%2)				accounts.%1(_:a01_getOwner(%0), %2)
#define a01_getArea(%0).%1(%2)				areas.%1(_:a01_getArea(%0), %2)
#define a01_getPickup(%0).%1(%2)			pickups.%1(_:a01_getPickup(%0), %2)
#define a01_getPrice(%0).%1(%2)				integers.%1(_:a01_getPrice(%0), %2)
#define a01_getPlayers(%0).%1(%2)			vectors.%1(_:a01_getPlayers(%0), %2)

// ---------------------------------------------------------------------- \\PLAYERS//

#define ae_getNearestHouse(%0).%1(%2)			houses.%1(_:ae_getNearestHouse(%0), %2)
#define ae_setNearestHouse(%0).%1(%2)			ae_%1(_:ae_setNearestHouse(%0), %2)
#define ae_moveToHouse(%0).%1(%2)				ae_%1(_:ae_moveToHouse(%0), %2)

#define ae_getHouse(%0).%1(%2)					houses.%1(_:ae_getHouse(%0), %2)
#define ae_setHouse(%0).%1(%2)					ae_%1(_:ae_setHouse(%0), %2)

// ---------------------------------------------------------------------- \\ACCOUNTS//

#define a00_getHouse(%0).%1(%2)					houses.%1(_:a00_getHouse(%0), %2)
#define a00_setHouse(%0).%1(%2)					a00_%1(_:a00_setHouse(%0), %2)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This


#define these houses.interiors // a02
#define These houses.Interiors // a02
#define this houses.interior
#define This houses.Interior

// ----------------------------------------------------------------------

#define a01_interior				a01_interiorid
#define a01_interiorid.%0(%1)		a02_%0(_:a01_interior,%1)
#define a01_interior0.%0(%1)		a02_%0(_:a01_interior0,%1)
#define a01_interior1.%0(%1)		a02_%0(_:a01_interior1,%1)
#define a01_interior2.%0(%1)		a02_%0(_:a01_interior2,%1)
#define a01_interior3.%0(%1)		a02_%0(_:a01_interior3,%1)
#define a01_interior4.%0(%1)		a02_%0(_:a01_interior4,%1)
#define a01_interior5.%0(%1)		a02_%0(_:a01_interior5,%1)

// ----------------------------------------------------------------------

#define a02_(%0).%1(%2)						a02_%1(_:a02_(%0), %2)
#define a02_create(%0).%1(%2)				a02_%1(_:a02_create(%0), %2)
#define a02_save(%0).%1(%2)					a02_%1(_:a02_save(%0), %2)
#define a02_getPosition(%0).%1(%2)			positions.%1(_:a02_getPosition(%0), %2)

// ----------------------------------------------------------------------

#define a02_existent(%0).%1(%2)					vectors.%1(_:a02_existent(%0), %2)
// #define a02_getInterior(%0).%1(%2)					interiors.%1(_:a02_getInterior(%0), %2)

// ----------------------------------------------------------------------

// #define a01_interior				a02_create

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This