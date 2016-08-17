#define these keys // b0
#define These Keys // B0
#define this key
#define This Key

// ----------------------------------------------------------------------

#define b0_Action			0
#define b0_Crouch			1
#define b0_Fire				2
#define b0_Sprint			3
#define b0_SecondaryAttack	4
#define b0_Jump				5
#define b0_LookRight		6
#define b0_Handbrake		7
#define b0_LookLeft			8
#define b0_Submission		9
#define b0_LookBehind		9
#define b0_Walk				10
#define b0_AnalogUp			11
#define b0_AnalogDown		12
#define b0_AnalogLeft		13
#define b0_AnalogRight		14
#define b0_Yes				16
#define b0_No				17
#define b0_CtrlBack			18
#define b0_Up				19
#define b0_Down				20
#define b0_Left				21
#define b0_Right			22

#define b0_Max				19

// ----------------------------------------------------------------------

@p.(Players).Keys;

exports()
{
	@v.(Players).Keys();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This