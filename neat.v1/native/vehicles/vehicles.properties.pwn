#define these vehicles // b6
#define These Vehicles // B6
#define this vehicle
#define This Vehicle

// ----------------------------------------------------------------------

#define b6_StreamDistance		50.0
#define b6_MaxNumberLength		32

// ----------------------------------------------------------------------

define():

p.Class;
p.Index;
p.Model;
p.SpawnPosX;
p.SpawnPosY;
p.SpawnPosZ;
p.SpawnPosR;
p.PosX;
p.PosY;
p.PosZ;
p.PosR;
p.Color1;
p.Color2;
p.Number;
p.Paintjob;
p.Area;
p.Physic;
p.AttachedAreas;
p.DisableAfterDeath;
p.Dead;
p.Health;
p.DamageStatus;
p.Params;
p.Components;

initialize()
{
	create():

	i.Class(-1);
	i.Index(-1);
	i.Model(-1);
	f.SpawnPosX(0.0);
	f.SpawnPosY(0.0);
	f.SpawnPosZ(0.0);
	f.SpawnPosR(0.0);
	f.PosX(0.0);
	f.PosY(0.0);
	f.PosZ(0.0);
	f.PosR(0.0);
	s.Color1(#ffffff);
	s.Color2(#ffffff);
	s.Number("DA :3");
	i.Paintjob(-1);
	i.Area(-1);
	i.Physic(-1);
	v.AttachedAreas();
	i.DisableAfterDeath(false);
	i.Dead(false);
	f.Health(1000.0);
	m.DamageStatus();
	m.Params();
	v.Components();

	export();
}

@p.(Players).Vehicle;
@p.(Players).StreamingVehicles;
@p.(Players).VehicleStreamers;


exports()
{
	@i.(Players).Vehicle(-1);
	@v.(Players).StreamingVehicles();
	@v.(Players).VehicleStreamers();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.colors // b7
#define These vehicles.Colors // B7
#define this vehicles.color
#define This vehicles.Color

// ----------------------------------------------------------------------

define():

p.Color;
p.Integer;

initialize()
{
	create():

	s.Color("");
	i.Integer(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.models // b8
#define These vehicles.Models // B8
#define this vehicles.model
#define This vehicles.Model

// ----------------------------------------------------------------------

#define b8_MaxNameLength 		255

// ----------------------------------------------------------------------

define():

p.Name;
p.Capacity;
p.Components;

initialize()
{
	create():

	ns.Name("Unknown");
	ni.Capacity(0);
	nv.Components();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.streamers // b9
#define These vehicles.Streamers // B9
#define this vehicles.streamer
#define This vehicles.Streamer

// ----------------------------------------------------------------------

define():

p.Physic;
p.Player;

initialize()
{
	create():

	i.Physic(-1);
	i.Player(-1);

	export();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.physics // ba
#define These vehicles.Physics // BA
#define this vehicles.physic
#define This vehicles.Physic

// ----------------------------------------------------------------------

#define ba_MaxAloneStreamTime	10

// ----------------------------------------------------------------------

define():

p.SampVehicle;
p.Vehicle;
p.Streamers;
p.Passengers;
p.LastHealth;
p.LastUpsideDown;
p.CreatedAt;

initialize()
{
	create():

	i.SampVehicle(INVALID_VEHICLE_ID);
	i.Vehicle(-1);
	v.Streamers();
	v.Passengers();
	f.LastHealth(1000.0);
	i.LastUpsideDown(false);
	i.CreatedAt(0);

	export();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.passengers // bc
#define These vehicles.Passengers // BC
#define this vehicles.passenger
#define This vehicles.Passenger

// ----------------------------------------------------------------------

define():

p.Player;
p.Physic;
p.Seat;

initialize()
{
	create():

	i.Player(-1);
	i.Physic(-1);
	i.Seat(-1);

	export();
}

@p.(Players).VehiclePassenger;

exports()
{
	@i.(Players).VehiclePassenger(-1);
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.surfers // c0
#define These vehicles.Surfers // C0
#define this vehicles.surfer
#define This vehicles.Surfer

// ----------------------------------------------------------------------

define():

p.Player;
p.Physic;

initialize()
{
	create():

	i.Player(-1);
	i.Physic(-1);

	export();
}

@p.(Players).VehicleSurfer;
@p.(Players).SurfingVehicle;
@p.(vehicles.Physics).Surfers;

exports()
{
	@i.(Players).VehicleSurfer(-1);
	@i.(Players).SurfingVehicle(-1);
	@v.(vehicles.Physics).Surfers();
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these vehicles.components // c3
#define These vehicles.Components // C3
#define this vehicles.component
#define This vehicles.Component

// ----------------------------------------------------------------------

#define c3_MaxNameLength 		255

#define c3_Spoilers				CARMODTYPE_SPOILER
#define c3_Hoods				CARMODTYPE_HOOD
#define c3_Roofs				CARMODTYPE_ROOF
#define c3_SideSkirts			CARMODTYPE_SIDESKIRT
#define c3_Lamps				CARMODTYPE_LAMPS
#define c3_Nitro				CARMODTYPE_NITRO
#define c3_Exhausts				CARMODTYPE_EXHAUST
#define c3_Wheels				CARMODTYPE_WHEELS
#define c3_Stereo				CARMODTYPE_STEREO
#define c3_Hydraulics			CARMODTYPE_HYDRAULICS
#define c3_FrontBumpers			CARMODTYPE_FRONT_BUMPER
#define c3_RearBumpers			CARMODTYPE_REAR_BUMPER
#define c3_RightVents			CARMODTYPE_VENT_RIGHT
#define c3_LeftVents			CARMODTYPE_VENT_LEFT

// ----------------------------------------------------------------------

define():

p.Part0;
p.Part1;
p.Name;

initialize()
{
	create():

	i.Part0(-1);
	i.Part1(-1);
	s.Name("");
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This