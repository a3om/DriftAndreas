#define these positions // b2
#define These Positions // B2
#define this position
#define This Position

// ----------------------------------------------------------------------

#define position						positionid
#define positionid.%0(%1)				b2_%0(_:position,%1)
#define position0.%0(%1)				b2_%0(_:position0,%1)
#define position1.%0(%1)				b2_%0(_:position1,%1)
#define position2.%0(%1)				b2_%0(_:position2,%1)
#define position3.%0(%1)				b2_%0(_:position3,%1)
#define position4.%0(%1)				b2_%0(_:position4,%1)
#define position5.%0(%1)				b2_%0(_:position5,%1)

// ----------------------------------------------------------------------

#define b2_Suicide.%0(%1)				vectors.%0(_:b2_Suicide, %1)

// ----------------------------------------------------------------------

#define b2_(%0).%1(%2)					b2_%1(_:%0, %2)
#define b2_create(%0).%1(%2)			b2_%1(_:b2_create(%0), %2)
#define b2_getX(%0).%1(%2)				b2_%1(_:b2_getX(%0), %2)
#define b2_setX(%0).%1(%2)				b2_%1(_:b2_setX(%0), %2)
#define b2_getY(%0).%1(%2)				b2_%1(_:b2_getY(%0), %2)
#define b2_setY(%0).%1(%2)				b2_%1(_:b2_setY(%0), %2)
#define b2_getZ(%0).%1(%2)				b2_%1(_:b2_getZ(%0), %2)
#define b2_setZ(%0).%1(%2)				b2_%1(_:b2_setZ(%0), %2)
#define b2_getRX(%0).%1(%2)				b2_%1(_:b2_getRX(%0), %2)
#define b2_setRX(%0).%1(%2)				b2_%1(_:b2_setRX(%0), %2)
#define b2_getRY(%0).%1(%2)				b2_%1(_:b2_getRY(%0), %2)
#define b2_setRY(%0).%1(%2)				b2_%1(_:b2_setRY(%0), %2)
#define b2_getRZ(%0).%1(%2)				b2_%1(_:b2_getRZ(%0), %2)
#define b2_setRZ(%0).%1(%2)				b2_%1(_:b2_setRZ(%0), %2)
#define b2_getR(%0).%1(%2)				b2_%1(_:b2_getR(%0), %2)
#define b2_setR(%0).%1(%2)				b2_%1(_:b2_setR(%0), %2)
#define b2_getXY(%0).%1(%2)				b2_%1(_:b2_getXY(%0), %2)
#define b2_setXY(%0).%1(%2)				b2_%1(_:b2_setXY(%0), %2)
#define b2_getXYZ(%0).%1(%2)			b2_%1(_:b2_getXYZ(%0), %2)
#define b2_setXYZ(%0).%1(%2)			b2_%1(_:b2_setXYZ(%0), %2)
#define b2_getXYZR(%0).%1(%2)			b2_%1(_:b2_getXYZR(%0), %2)
#define b2_setXYZR(%0).%1(%2)			b2_%1(_:b2_setXYZR(%0), %2)
#define b2_get(%0).%1(%2)				b2_%1(_:b2_get(%0), %2)
#define b2_set(%0).%1(%2)				b2_%1(_:b2_set(%0), %2)
#define b2_copyFrom(%0).%1(%2)			b2_%1(_:b2_copyFrom(%0), %2)
#define b2_clone(%0).%1(%2)				b2_%1(_:b2_clone(%0), %2)
#define b2_move(%0).%1(%2)				b2_%1(_:b2_move(%0), %2)
#define b2_rotate(%0).%1(%2)			b2_%1(_:b2_rotate(%0), %2)
#define b2_move(%0).%1(%2)				b2_%1(_:b2_move(%0), %2)
#define b2_offsetX(%0).%1(%2)			b2_%1(_:b2_offsetX(%0), %2)
#define b2_offsetY(%0).%1(%2)			b2_%1(_:b2_offsetY(%0), %2)
#define b2_offsetZ(%0).%1(%2)			b2_%1(_:b2_offsetZ(%0), %2)
#define b2_rotateX(%0).%1(%2)			b2_%1(_:b2_rotateX(%0), %2)
#define b2_rotateY(%0).%1(%2)			b2_%1(_:b2_rotateY(%0), %2)
#define b2_rotateZ(%0).%1(%2)			b2_%1(_:b2_rotateZ(%0), %2)

// ----------------------------------------------------------------------

#define Position(%0)					b2_create(%0)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This