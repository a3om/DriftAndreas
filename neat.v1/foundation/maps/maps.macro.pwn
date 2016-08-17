#define these maps // ad
#define These Maps // AD
#define this map
#define This Map

// ----------------------------------------------------------------------

#define map									mapid
#define mapid.%0(%1)						ad_%0(_:map,%1)
#define map0.%0(%1)							ad_%0(_:map0,%1)
#define map1.%0(%1)							ad_%0(_:map1,%1)
#define map2.%0(%1)							ad_%0(_:map2,%1)
#define map3.%0(%1)							ad_%0(_:map3,%1)
#define map4.%0(%1)							ad_%0(_:map4,%1)
#define map5.%0(%1)							ad_%0(_:map5,%1)

// ----------------------------------------------------------------------

#define ad_(%0).%1(%2)						ad_%1(_:ad_(%0), %2)
#define ad_create(%0).%1(%2)				ad_%1(_:ad_create(%0), %2)
#define ad_getKeys(%0).%1(%2)				vectors.%1(_:ad_getKeys(%0), %2)
#define ad_getValues(%0).%1(%2)				vectors.%1(_:ad_getValues(%0), %2)
#define ad_setInteger(%0).%1(%2)			ad_%1(_:ad_setInteger(%0), %2)
#define ad_getInteger(%0).(%1).%2(%3)		%1.%2(_:ad_getInteger(%0), %3)
#define ad_setFloat(%0).%1(%2)				ad_%1(_:ad_setFloat(%0), %2)
#define ad_setString(%0).%1(%2)				ad_%1(_:ad_setString(%0), %2)
#define ad_remove(%0).%1(%2)				ad_%1(_:ad_remove(%0), %2)
#define ad_print(%0).%1(%2)					ad_%1(_:ad_print(%0), %2)
#define ad_clear(%0).%1(%2)					ad_%1(_:ad_clear(%0), %2)
#define ad_copyFrom(%0).%1(%2)				ad_%1(_:ad_copyFrom(%0), %2)
#define ad_copyTo(%0).%1(%2)				ad_%1(_:ad_copyTo(%0), %2)
#define ad_clone(%0).%1(%2)					ad_%1(_:ad_clone(%0), %2)

// ----------------------------------------------------------------------

#define ad_si								ad_setInteger
#define ad_gi								ad_getInteger
#define ad_sf								ad_setFloat
#define ad_gf								ad_getFloat
#define ad_ss								ad_setString
#define ad_gs								ad_getString
#define ad_gso								ad_getStringOut
#define ad_h								ad_has
#define ad_r								ad_remove
#define ad_p								ad_print
#define ad_c								ad_clear
#define ad_d								ad_destroy

// ----------------------------------------------------------------------

#define ad_i(%0,%1) 						ad_si(%0, #%1, %1)
#define ad_f(%0,%1) 						ad_sf(%0, #%1, %1)
#define ad_s(%0,%1) 						ad_ss(%0, #%1, %1)

// ----------------------------------------------------------------------

#define Map(%0)								ad_create(%0)
#define M:									Map().

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This