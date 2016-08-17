#define these vectors // a1
#define These Vectors // A1
#define this vector
#define This Vector

// ----------------------------------------------------------------------

#define vector				vectorid
#define vectorid.%0(%1)		a1_%0(_:vector,%1)
#define vector0.%0(%1)		a1_%0(_:vector0,%1)
#define vector1.%0(%1)		a1_%0(_:vector1,%1)
#define vector2.%0(%1)		a1_%0(_:vector2,%1)
#define vector3.%0(%1)		a1_%0(_:vector3,%1)
#define vector4.%0(%1)		a1_%0(_:vector4,%1)
#define vector5.%0(%1)		a1_%0(_:vector5,%1)

// ----------------------------------------------------------------------

#define a1_(%0).%1(%2)						a1_%1(_:%0, %2)
#define a1_create(%0).%1(%2)				a1_%1(_:a1_create(%0), %2)
#define a1_addInteger(%0).%1(%2)			a1_%1(_:a1_addInteger(%0), %2)
#define a1_setInteger(%0).%1(%2)			a1_%1(_:a1_setInteger(%0), %2)
#define a1_getInteger(%0).(%1).%2(%3)		%1.%2(_:a1_getInteger(%0), %3)
#define a1_getLastInteger(%0).(%1).%2(%3)	%1.%2(_:a1_getLastInteger(%0), %3)
#define a1_removeInteger(%0).%1(%2)			a1_%1(_:a1_removeInteger(%0), %2)
#define a1_addFloat(%0).%1(%2)				a1_%1(_:a1_addFloat(%0), %2)
#define a1_setFloat(%0).%1(%2)				a1_%1(_:a1_setFloat(%0), %2)
#define a1_getFloat(%0).%1(%2)				floats.%1(Float:_:a1_getFloat(%0), %2)
#define a1_removeFloat(%0).%1(%2)			a1_%1(_:a1_removeFloat(%0), %2)
#define a1_addString(%0).%1(%2)				a1_%1(_:a1_addString(%0), %2)
#define a1_setString(%0).%1(%2)				a1_%1(_:a1_setString(%0), %2)
#define a1_removeString(%0).%1(%2)			a1_%1(_:a1_removeString(%0), %2)
#define a1_remove(%0).%1(%2)				a1_%1(_:a1_remove(%0), %2)
#define a1_print(%0).%1(%2)					a1_%1(_:a1_print(%0), %2)
#define a1_clear(%0).%1(%2)					a1_%1(_:a1_clear(%0), %2)
#define a1_copyFrom(%0).%1(%2)				a1_%1(_:a1_copyFrom(%0), %2)
#define a1_copyTo(%0).%1(%2)				a1_%1(_:a1_copyTo(%0), %2)
#define a1_clone(%0).%1(%2)					a1_%1(_:a1_clone(%0), %2)
#define a1_reverse(%0).%1(%2)				a1_%1(_:a1_reverse(%0), %2)
#define a1_sort(%0).%1(%2)					a1_%1(_:a1_sort(%0), %2)
#define a1_filter(%0).%1(%2)				a1_%1(_:a1_filter(%0), %2)
#define a1_join(%0).%1(%2)					strings.%1(_:a1_join(%0), %2)
#define a1_addVector(%0).%1(%2)				a1_%1(_:a1_addVector(%0), %2)
#define a1_concat(%0).%1(%2)				a1_%1(_:a1_concat(%0), %2)
#define a1_slice(%0).%1(%2)					a1_%1(_:a1_slice(%0), %2)
#define a1_hexify(%0).%1(%2)				strings.%1(_:a1_hexify(%0), %2)
#define a1_getLength(%0).%1(%2)				integers.%1(_:a1_getLength(%0), %2)

// ----------------------------------------------------------------------

#define a1_ai			a1_addInteger
#define a1_a			a1_addInteger
#define a1_i			a1_addInteger
#define a1_si			a1_setInteger
#define a1_gi			a1_getInteger
#define a1_g			a1_getInteger
#define a1_gli			a1_getInteger
#define a1_gl			a1_getInteger
#define a1_fi			a1_findInteger
#define a1_ri			a1_removeInteger
#define a1_r			a1_removeInteger
#define a1_af			a1_addFloat
#define a1_f			a1_addFloat
#define a1_sf			a1_setFloat
#define a1_gf			a1_getFloat
#define a1_glf			a1_getLastFloat
#define a1_rf			a1_removeFloat
#define a1_as			a1_addString
#define a1_s			a1_addString
#define a1_ss			a1_setString
#define a1_gs			a1_getString
#define a1_gls			a1_getLastString
#define a1_gso			a1_getStringOut
#define a1_glso			a1_getLastStringOut
#define a1_rs			a1_removeString
#define a1_p			a1_print
#define a1_c			a1_clear
#define a1_d			a1_destroy
#define a1_length		a1_getLength
#define a1_lastInteger	a1_getLastInteger
#define a1_integer		a1_getInteger

// ----------------------------------------------------------------------

#define a1_foreachInteger(%0,%1,%2)			for (new %1_ = a1_clone(%0), %1__ = vector_size(%1_), %1, %2 = 0; vectors._foreachConditionInteger(%1_, %2, %1__, %1); ++%2)
#define a1_foreachFloat(%0,%1,%2)			for (new %1_ = a1_clone(%0), %1__ = vector_size(%1_), float:%1, %2 = 0; vectors._foreachConditionFloat(%1_, %2, %1__, %1); ++%2)
#define a1_foreachString(%0,%1,%2)			for (new %1_ = a1_clone(%0), %1__ = vector_size(%1_), %1[a1_MaxStringLength + 1], %2 = 0; vectors._foreachConditionString(%1_, %2, %1__, %1); ++%2)
#define a1_foreachReverseInteger(%0,%1,%2)	for (new %1_ = a1_clone(%0), %1__ = vector_size(%1_), %1, %2 = %1__ - 1; vectors._foreachConditionRInteger(%1_, %2, %1); --%2)

#define a1_foreach							a1_foreachInteger
#define a1_foreachReverse					a1_foreachReverseInteger
#define a1_each								a1_foreachInteger
#define a1_eachInteger						a1_foreachInteger
#define a1_eachFloat						a1_foreachFloat
#define a1_eachString						a1_foreachString
#define a1_eachReverse						a1_foreachReverse

// ----------------------------------------------------------------------

#define Vector(%0)							a1_create(%0)
#define V:									Vector().

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This