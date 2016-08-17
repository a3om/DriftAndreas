#define these keys // b0
#define These Keys // B0
#define this key
#define This Key

// ----------------------------------------------------------------------

#define key(%0)			if (key == keys.%0)
// #define isKeyDown(%0)	vectors.(playerKeys).hasInteger(keys.%0)

// ----------------------------------------------------------------------

#define b0_@@stateChange			OnPlayerKeyStateChange

// ----------------------------------------------------------------------

#define ae_getKeys(%0).%1(%2)		vectors.%1(_:ae_getKeys(%0), %2)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This