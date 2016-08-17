#define these commands // b1
#define These Commands // B1
#define this command
#define This Command

// ----------------------------------------------------------------------

#define command(%0)						if(b1_condition(q_i:%0))
#define b1_condition(%0q_i:%1,%2)		b1_condition(%0!strcmp(%1, command, false) || q_i:%2)
#define q_i:%0)							!strcmp(%0, command))

// ----------------------------------------------------------------------

#define b1_@@command			OnPlayerCommandText

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This