#define these pickups // bb
#define These Pickups // BB
#define this pickup
#define This Pickup

// ----------------------------------------------------------------------

#define pickup									pickupid
#define pickupid.%0(%1)							bb_%0(_:pickup,%1)
#define pickup0.%0(%1)							bb_%0(_:pickup0,%1)
#define pickup1.%0(%1)							bb_%0(_:pickup1,%1)
#define pickup2.%0(%1)							bb_%0(_:pickup2,%1)
#define pickup3.%0(%1)							bb_%0(_:pickup3,%1)
#define pickup4.%0(%1)							bb_%0(_:pickup4,%1)
#define pickup5.%0(%1)							bb_%0(_:pickup5,%1)

// ----------------------------------------------------------------------

#define bb_(%0).%1(%2)							bb_%1(_:%0, %2)
#define bb_create(%0).%1(%2)					bb_%1(_:bb_create(%0), %2)
#define bb_setClass(%0).%1(%2)					bb_%1(_:bb_setClass(%0), %2)
#define bb_setIndex(%0).%1(%2)					bb_%1(_:bb_setIndex(%0), %2)

// ----------------------------------------------------------------------

#define Pickup(%0)								bb_create(%0)

// ----------------------------------------------------------------------

#define bb_@@playerPickUp					OnPlayerPickUpDynamicPickup

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This