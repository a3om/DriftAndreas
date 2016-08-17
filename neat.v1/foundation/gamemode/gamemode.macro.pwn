#define these gamemode // a
#define These Gamemode // A

// ----------------------------------------------------------------------

// #define a0_AddClass(%0)	a0__AddClass(#%0)

// ----------------------------------------------------------------------

#define a0_@@initialize(%0)		OnGameModeInit(%0)
#define a0_@@exit(%0)			OnGameModeExit(%0)

// ----------------------------------------------------------------------

#undef these
#undef These

// ----------------------------------------------------------------------

#define these gamemode.classes // a2
#define These gamemode.Classes // A2
#define this gamemode.class
#define This gamemode.Class

// ----------------------------------------------------------------------

#define a0_class				a0_classid
#define a0_classid.%0(%1)		a2_%0(_:a0_class,%1)
#define a0_class0.%0(%1)		a2_%0(_:a0_class0,%1)
#define a0_class1.%0(%1)		a2_%0(_:a0_class1,%1)
#define a0_class2.%0(%1)		a2_%0(_:a0_class2,%1)
#define a0_class3.%0(%1)		a2_%0(_:a0_class3,%1)
#define a0_class4.%0(%1)		a2_%0(_:a0_class4,%1)
#define a0_class5.%0(%1)		a2_%0(_:a0_class5,%1)

// ----------------------------------------------------------------------

#define a0_Class		a2_create

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This