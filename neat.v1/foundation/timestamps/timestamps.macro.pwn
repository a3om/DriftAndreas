#define these timestamps // b3
#define These Timestamps // B3
#define this timestamp
#define This Timestamp

// ----------------------------------------------------------------------

#define timestamp				timestampid
#define timestampid.%0(%1)		b3_%0(_:timestamp,%1)
#define timestamp0.%0(%1)		b3_%0(_:timestamp0,%1)
#define timestamp1.%0(%1)		b3_%0(_:timestamp1,%1)
#define timestamp2.%0(%1)		b3_%0(_:timestamp2,%1)
#define timestamp3.%0(%1)		b3_%0(_:timestamp3,%1)
#define timestamp4.%0(%1)		b3_%0(_:timestamp4,%1)
#define timestamp5.%0(%1)		b3_%0(_:timestamp5,%1)

// ----------------------------------------------------------------------

#define b3_(%0).%1(%2)				b3_%1(_:%0, %2)
#define b3_create(%0).%1(%2)		b3_%1(_:b3_create(%0), %2)

// ----------------------------------------------------------------------

#define Timestamp				b3_create

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This