#define these gamemode // a0
#define These Gamemode // A0

// ----------------------------------------------------------------------

new these.Shutdown = false;

// ----------------------------------------------------------------------

#undef these
#undef These

// ----------------------------------------------------------------------

#define these gamemode.classes // a2
#define These gamemode.Classes // A2
#define this gamemode.class
#define This gamemode.Class

// ----------------------------------------------------------------------

#define a2_MaxNameLength		32
#define a2_MaxAddressLength		32

// ----------------------------------------------------------------------

new These;
new These.Address;
new These.Dependencies;

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This