#define these areas // b5
#define These Areas // B5
#define this area
#define This Area

// ----------------------------------------------------------------------

#define area				areaid
#define areaid.%0(%1)		b5_%0(_:area,%1)
#define area0.%0(%1)		b5_%0(_:area0,%1)
#define area1.%0(%1)		b5_%0(_:area1,%1)
#define area2.%0(%1)		b5_%0(_:area2,%1)
#define area3.%0(%1)		b5_%0(_:area3,%1)
#define area4.%0(%1)		b5_%0(_:area4,%1)
#define area5.%0(%1)		b5_%0(_:area5,%1)

// ----------------------------------------------------------------------

#define b5_(%0).%1(%2)							b5_%1(_:%0, %2)
#define b5_createCircle(%0).%1(%2)				b5_%1(_:b5_createCircle(%0), %2)
#define b5_createCylinder(%0).%1(%2)			b5_%1(_:b5_createCylinder(%0), %2)
#define b5_createSphere(%0).%1(%2)				b5_%1(_:b5_createSphere(%0), %2)
#define b5_createRectangle(%0).%1(%2)			b5_%1(_:b5_createRectangle(%0), %2)
#define b5_createCuboid(%0).%1(%2)				b5_%1(_:b5_createCuboid(%0), %2)
#define b5_createCube(%0).%1(%2)				b5_%1(_:b5_createCube(%0), %2)
#define b5_setClass(%0).%1(%2)					b5_%1(_:b5_setClass(%0), %2)
#define b5_setIndex(%0).%1(%2)					b5_%1(_:b5_setIndex(%0), %2)
#define b5_getPlayers(%0).%1(%2)				vectors.%1(_:b5_getPlayers(%0), %2)
#define b5_getAttachingVehicle(%0).%1(%2)		vehicles.%1(_:b5_getAttachingVehicle(%0), %2)
#define b5_setAttachingVehicle(%0).%1(%2)		b5_%1(_:b5_setAttachingVehicle(%0), %2)
#define b5_attachToVehicle(%0).%1(%2)			b5_%1(_:b5_attachToVehicle(%0), %2)
#define b5_detachFromVehicle(%0).%1(%2)			b5_%1(_:b5_detachFromVehicle(%0), %2)

// ---------------------------------------------------------------------- // players

#define ae_getAreas(%0).%1(%2)					vectors.%1(_:ae_getAreas(%0), %2)

// ---------------------------------------------------------------------- // vehicles

#define b6_getAreas(%0).%1(%2)					vectors.%1(_:b6_getAreas(%0), %2)

// ----------------------------------------------------------------------

#define CircleArea(%0)							b5_createCircle(%0)
#define CylinderArea(%0)						b5_createCylinder(%0)
#define SphereArea(%0)							b5_createSphere(%0)
#define RectangleArea(%0)						b5_createRectangle(%0)
#define CuboidArea(%0)							b5_createCuboid(%0)
#define CubeArea(%0)							b5_createCube(%0)

// ----------------------------------------------------------------------

#define b5_@@playerEnter						OnPlayerEnterDynamicArea
#define b5_@@playerLeave						OnPlayerLeaveDynamicArea

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This