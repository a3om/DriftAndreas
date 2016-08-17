#define these files // c2
#define These Files // C2
#define this file
#define This File

// ----------------------------------------------------------------------

#define file				fileid
#define fileid.%0(%1)		c2_%0(_:file,%1)
#define file0.%0(%1)		c2_%0(_:file0,%1)
#define file1.%0(%1)		c2_%0(_:file1,%1)
#define file2.%0(%1)		c2_%0(_:file2,%1)
#define file3.%0(%1)		c2_%0(_:file3,%1)
#define file4.%0(%1)		c2_%0(_:file4,%1)
#define file5.%0(%1)		c2_%0(_:file5,%1)

// ----------------------------------------------------------------------

#define c2_open(%0).%1(%2)				c2_%1(_:c2_open(%0), %2)

// ----------------------------------------------------------------------

#define File(%0)						c2_open(%0)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This