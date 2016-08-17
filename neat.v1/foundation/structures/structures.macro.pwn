#define these structures // a7
#define These Structures // A7
#define this structure
#define This Structure

// ----------------------------------------------------------------------

#define structure				structureid
#define structureid.%0(%1)		a7_%0(_:structure,%1)
#define structure0.%0(%1)		a7_%0(_:structure0,%1)
#define structure1.%0(%1)		a7_%0(_:structure1,%1)
#define structure2.%0(%1)		a7_%0(_:structure2,%1)
#define structure3.%0(%1)		a7_%0(_:structure3,%1)
#define structure4.%0(%1)		a7_%0(_:structure4,%1)
#define structure5.%0(%1)		a7_%0(_:structure5,%1)

// ----------------------------------------------------------------------

#define a7_(%0).%1(%2)									a7_%1(_:a7_(%0), %2)
#define a7_existent(%0).%1(%2)							vectors.%1(_:a7_existent(%0), %2)
#define a7_getObjectIntegerProperty(%0).(%1).%2(%3)		%1.%2(_:a7_getObjectIntegerProperty(%0), %3)
#define a7_getObjectFloatProperty(%0).%1(%2)			floats.%1(_:a7_getObjectFloatProperty(%0), %2)
#define a7_getNamesOfProperties(%0).%1(%2)				vectors.%1(_:a7_getNamesOfProperties(%0), %2)
#define a7_getNamesOfCustomProperties(%0).%1(%2)		vectors.%1(_:a7_getNamesOfCustomProperties(%0), %2)
#define a7_getTypesOfProperties(%0).%1(%2)				vectors.%1(_:a7_getTypesOfProperties(%0), %2)
#define a7_getStorablelsOfProperties(%0).%1(%2)			vectors.%1(_:a7_getStorablelsOfProperties(%0), %2)
#define a7_getObjects(%0).%1(%2)						vectors.%1(_:a7_getObjects(%0), %2)
#define a7_getObjectValues(%0).%1(%2)					vectors.%1(_:a7_getObjectValues(%0), %2)
#define a7_getVectorsOfProperties(%0).%1(%2)			vectors.%1(_:a7_getVectorsOfProperties(%0), %2)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This