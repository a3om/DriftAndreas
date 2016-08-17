#define these strings // a5
#define these strings // a5
#define These Strings // A5
#define this string
#define This Stirng

// ----------------------------------------------------------------------

#if defined string
	#error string already defined
#endif

// ----------------------------------------------------------------------

#define string.%0(%1)							a5_%0(_:string,%1)
#define string0.%0(%1)							a5_%0(_:string0,%1)
#define string1.%0(%1)							a5_%0(_:string1,%1)
#define string2.%0(%1)							a5_%0(_:string2,%1)
#define string3.%0(%1)							a5_%0(_:string3,%1)
#define string4.%0(%1)							a5_%0(_:string4,%1)
#define string5.%0(%1)							a5_%0(_:string5,%1)

// ----------------------------------------------------------------------

#define a5_(%0).%1(%2)							a5_%1(_:%0, %2)
#define a5_toInteger(%0).%1(%2)					integers.%1(_:a5_toInteger(%0), %2)
#define a5_clone(%0).%1(%2)						a5_%1(_:a5_clone(%0), %2)
#define a5_toLowerCase(%0).%1(%2)				a5_%1(_:a5_toLowerCase(%0), %2)
#define a5_toUpperCase(%0).%1(%2)				a5_%1(_:a5_toUpperCase(%0), %2)
#define a5_slice(%0).%1(%2)						a5_%1(_:a5_slice(%0), %2)
#define a5_substr(%0).%1(%2)					a5_%1(_:a5_substr(%0), %2)
#define a5_replace(%0).%1(%2)					a5_%1(_:a5_replace(%0), %2)
#define a5_concat(%0).%1(%2)					a5_%1(_:a5_concat(%0), %2)
#define a5_charAt(%0).%1(%2)					a5_%1(_:a5_charAt(%0), %2)
#define a5_split(%0).%1(%2)						vectors.%1(_:a5_split(%0), %2)
#define a5_getLength(%0).%1(%2)					integers.%1(_:a5_getLength(%0), %2)
#define a5_format(_:%0,%1)						format(%0, sizeof %0, %1)
#define a5_makeFromRepeatingChar(%0).%1(%2)		a5_%1(_:a5_makeFromRepeatingChar(%0), %2)
#define a5_trim(%0).%1(%2)						a5_%1(_:a5_trim(%0), %2)
#define a5_hexify(%0).%1(%2)					vectors.%1(_:a5_hexify(%0), %2)

#define a5_length								a5_getLength
#define a5_search								a5_indexOf
#define a5_find									a5_indexOf

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This