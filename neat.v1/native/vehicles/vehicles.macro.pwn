#define these vehicles // b6
#define These Vehicles // B6
#define this vehicle
#define This Vehicle

// ----------------------------------------------------------------------

#define vehicle									vehicleid
#define vehicleid.%0(%1)						b6_%0(_:vehicle,%1)
#define vehicle0.%0(%1)							b6_%0(_:vehicle0,%1)
#define vehicle1.%0(%1)							b6_%0(_:vehicle1,%1)
#define vehicle2.%0(%1)							b6_%0(_:vehicle2,%1)
#define vehicle3.%0(%1)							b6_%0(_:vehicle3,%1)
#define vehicle4.%0(%1)							b6_%0(_:vehicle4,%1)
#define vehicle5.%0(%1)							b6_%0(_:vehicle5,%1)

// ----------------------------------------------------------------------

#define b6_(%0).%1(%2)							b6_%1(_:%0, %2)
#define b6_create(%0).%1(%2)					b6_%1(_:b6_create(%0), %2)
#define b6_getArea(%0).%1(%2)					areas.%1(_:b6_getArea(%0), %2)
#define b6_setArea(%0).%1(%2)					b6_%1(_:b6_setArea(%0), %2)
#define b6_getPhysic(%0).%1(%2)					vehicles.physics.%1(_:b6_getPhysic(%0), %2)
#define b6_setPhysic(%0).%1(%2)					b6_%1(_:b6_setPhysic(%0), %2)
#define b6_getSpawnPosition(%0).%1(%2)			positions.%1(_:b6_getSpawnPosition(%0), %2)
#define b6_setSpawnPosition(%0).%1(%2)			b6_%1(_:b6_setSpawnPosition(%0), %2)
#define b6_getPosition(%0).%1(%2)				positions.%1(_:b6_getPosition(%0), %2)
#define b6_setPosition(%0).%1(%2)				b6_%1(_:b6_setPosition(%0), %2)
#define b6_stream(%0).%1(%2)					b6_%1(_:b6_stream(%0), %2)
#define b6_respawn(%0).%1(%2)					b6_%1(_:b6_respawn(%0), %2)
#define b6_getNumber(%0).%1(%2)					strings.%1(_:b6_getNumber(%0), %2)
#define b6_setNumber(%0).%1(%2)					b6_%1(_:b6_setNumber(%0), %2)
#define b6_setPaintjob(%0).%1(%2)				b6_%1(_:b6_setPaintjob(%0), %2)
#define b6_getAttachedAreas(%0).%1(%2)			vectors.%1(_:b6_getAttachedAreas(%0), %2)
#define b6_setDisableAfterDeath(%0).%1(%2)		b6_%1(_:b6_setDisableAfterDeath(%0), %2)
#define b6_setDead(%0).%1(%2)					b6_%1(_:b6_setDead(%0), %2)
#define b6_getColor1(%0).%1(%2)					colors.%1(_:b6_getColor1(%0), %2)
#define b6_setColor1(%0).%1(%2)					b6_%1(_:b6_setColor1(%0), %2)
#define b6_getColor2(%0).%1(%2)					colors.%1(_:b6_getColor2(%0), %2)
#define b6_setColor2(%0).%1(%2)					b6_%1(_:b6_setColor2(%0), %2)
#define b6_getDamageStatus(%0).%1(%2)			maps.%1(_:b6_getDamageStatus(%0), %2)
#define b6_setDamageStatus(%0).%1(%2)			b6_%1(_:b6_setDamageStatus(%0), %2)
#define b6_getParams(%0).%1(%2)					maps.%1(_:b6_getParams(%0), %2)
#define b6_setParams(%0).%1(%2)					b6_%1(_:b6_setParams(%0), %2)
#define b6_repair(%0).%1(%2)					b6_%1(_:b6_repair(%0), %2)
#define b6_getModel(%0).%1(%2)					vehicles.models.%1(_:b6_getModel(%0), %2)
#define b6_engine(%0).%1(%2)					b6_%1(_:b6_engine(%0), %2)
#define b6_lights(%0).%1(%2)					b6_%1(_:b6_lights(%0), %2)
#define b6_alarm(%0).%1(%2)						b6_%1(_:b6_alarm(%0), %2)
#define b6_getComponents(%0).%1(%2)				vectors.%1(_:b6_getComponents(%0), %2)
#define b6_setComponent(%0).%1(%2)				b6_.%1(_:b6_setComponent(%0), %2)
#define b6_removeComponent(%0).%1(%2)			b6_.%1(_:b6_removeComponent(%0), %2)

// ----------------------------------------------------------------------

#define b6_disableAfterDeath 					b6_setDisableAfterDeath

// ----------------------------------------------------------------------

#define Vehicle(%0)								b6_create(%0)

// ---------------------------------------------------------------------- // players

#define ae_setVehicle(%0).%1(%2)				ae_%1(_:ae_setVehicle(%0), %2)
#define ae_getVehicle(%0).%1(%2)				b6_%1(_:ae_getVehicle(%0), %2)
#define ae_putInVehicle(%0).%1(%2)				ae_%1(_:ae_putInVehicle(%0), %2)
#define ae_leaveVehicle(%0).%1(%2)				ae_%1(_:ae_leaveVehicle(%0), %2)
#define ae_throwFromVehicle(%0).%1(%2)			ae_%1(_:ae_throwFromVehicle(%0), %2)
#define ae_stopEnterVehicle(%0).%1(%2)			ae_%1(_:ae_stopEnterVehicle(%0), %2)
#define ae_getStreamingVehicles(%0).%1(%2)		vectors.%1(_:ae_getStreamingVehicles(%0), %2)
#define ae_getVehicleStreamers(%0).%1(%2)		vectors.%1(_:ae_getVehicleStreamers(%0), %2)

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

#define b6_color								b6_colorid
#define b6_colorid.%0(%1)						b7_%0(_:b6_color,%1)
#define b6_color0.%0(%1)						b7_%0(_:b6_color0,%1)
#define b6_color1.%0(%1)						b7_%0(_:b6_color1,%1)
#define b6_color2.%0(%1)						b7_%0(_:b6_color2,%1)
#define b6_color3.%0(%1)						b7_%0(_:b6_color3,%1)
#define b6_color4.%0(%1)						b7_%0(_:b6_color4,%1)
#define b6_color5.%0(%1)						b7_%0(_:b6_color5,%1)

// ----------------------------------------------------------------------

#define b7_existent(%0).%1(%2)					vectors.%1(_:b7_existent(%0), %2)
#define b7_getColor(%0).%1(%2)					colors.%1(_:b7_getColor(%0), %2)
#define b7_findByColor(%0).%1(%2)				b7_%1(_:b7_findByColor(%0), %2)

// ----------------------------------------------------------------------

#define b6_Color(%0)							b7_create(%0)

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

#define b6_model								b6_modelid
#define b6_modelid.%0(%1)						b8_%0(_:b6_model,%1)
#define b6_model0.%0(%1)						b8_%0(_:b6_model0,%1)
#define b6_model1.%0(%1)						b8_%0(_:b6_model1,%1)
#define b6_model2.%0(%1)						b8_%0(_:b6_model2,%1)
#define b6_model3.%0(%1)						b8_%0(_:b6_model3,%1)
#define b6_model4.%0(%1)						b8_%0(_:b6_model4,%1)
#define b6_model5.%0(%1)						b8_%0(_:b6_model5,%1)

// ----------------------------------------------------------------------

#define b8_create(%0).%1(%2)					b8_%1(_:b8_create(%0), %2)
#define b8_existent(%0).%1(%2)					vectors.%1(_:b8_existent(%0), %2)
#define b8_getName(%0).%1(%2)					strings.%1(_:b8_getName(%0), %2)
#define b8_getComponents(%0).%1(%2)				vectors.%1(_:b8_getComponents(%0), %2)

// ----------------------------------------------------------------------

#define b6_Model(%0)							b8_create(%0)

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

#define b6_streamer								b6_streamerid
#define b6_streamerid.%0(%1)					b9_%0(_:b6_streamer,%1)
#define b6_streamer0.%0(%1)						b9_%0(_:b6_streamer0,%1)
#define b6_streamer1.%0(%1)						b9_%0(_:b6_streamer1,%1)
#define b6_streamer2.%0(%1)						b9_%0(_:b6_streamer2,%1)
#define b6_streamer3.%0(%1)						b9_%0(_:b6_streamer3,%1)
#define b6_streamer4.%0(%1)						b9_%0(_:b6_streamer4,%1)
#define b6_streamer5.%0(%1)						b9_%0(_:b6_streamer5,%1)

// ----------------------------------------------------------------------

#define b9_getPlayer(%0).%1(%2)					players.%1(_:b9_getPlayer(%0), %2)
#define b9_getPhysic(%0).%1(%2)					vehicles.physics.%1(_:b9_getPhysic(%0), %2)

// ----------------------------------------------------------------------

#define b6_Streamer(%0)							b9_create(%0)

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

#define b6_physic								b6_physicid
#define b6_physicid.%0(%1)						ba_%0(_:b6_physic,%1)
#define b6_physic0.%0(%1)						ba_%0(_:b6_physic0,%1)
#define b6_physic1.%0(%1)						ba_%0(_:b6_physic1,%1)
#define b6_physic2.%0(%1)						ba_%0(_:b6_physic2,%1)
#define b6_physic3.%0(%1)						ba_%0(_:b6_physic3,%1)
#define b6_physic4.%0(%1)						ba_%0(_:b6_physic4,%1)
#define b6_physic5.%0(%1)						ba_%0(_:b6_physic5,%1)

// ----------------------------------------------------------------------

#define ba_existent(%0).%1(%2)					vectors.%1(_:ba_existent(%0), %2)
#define ba_getVehicle(%0).%1(%2)				vehicles.%1(_:ba_getVehicle(%0), %2)
#define ba_getStreamers(%0).%1(%2)				vectors.%1(_:ba_getStreamers(%0), %2)
#define ba_findStreamerByPlayer(%0).%1(%2)		vehicles.streamers.%1(_:ba_findStreamerByPlayer(%0), %2)
#define ba_getPosition(%0).%1(%2)				positions.%1(_:ba_getPosition(%0), %2)
#define ba_setPosition(%0).%1(%2)				ba_%1(_:ba_setPosition(%0), %2)
#define ba_findBySampVehicle(%0).%1(%2)			ba_%1(_:ba_findBySampVehicle(%0), %2)
#define ba_setHealth(%0).%1(%2)					ba_%1(_:ba_setHealth(%0), %2)
#define ba_getHealth(%0).%1(%2)					ba_%1(_:ba_getHealth(%0), %2)
#define ba_setLastHealth(%0).%1(%2)				ba_%1(_:ba_setLastHealth(%0), %2)
#define ba_getLastHealth(%0).%1(%2)				ba_%1(_:ba_getLastHealth(%0), %2)
#define ba_getDamageStatus(%0).%1(%2)			maps.%1(_:ba_getDamageStatus(%0), %2)
#define ba_setDamageStatus(%0).%1(%2)			ba_%1(_:ba_setDamageStatus(%0), %2)
#define ba_findComponentBySlot(%0).%1(%2)		vehicles.components.%1(_:ba_findComponentBySlot(%0), %2)

// ----------------------------------------------------------------------

#define b6_Physic(%0)							ba_create(%0)

// ----------------------------------------------------------------------

#define ba_@@spawn 								OnVehicleSpawn
#define ba_@@death 								OnVehicleDeath
#define ae_@@enterVehicle						OnPlayerEnterVehicle
#define ba_@@damageStatusUpdate					OnVehicleDamageStatusUpdate

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

#define b6_passenger							b6_passengerid
#define b6_passengerid.%0(%1)					bc_%0(_:b6_passenger,%1)
#define b6_passenger0.%0(%1)					bc_%0(_:b6_passenger0,%1)
#define b6_passenger1.%0(%1)					bc_%0(_:b6_passenger1,%1)
#define b6_passenger2.%0(%1)					bc_%0(_:b6_passenger2,%1)
#define b6_passenger3.%0(%1)					bc_%0(_:b6_passenger3,%1)
#define b6_passenger4.%0(%1)					bc_%0(_:b6_passenger4,%1)
#define b6_passenger5.%0(%1)					bc_%0(_:b6_passenger5,%1)

// ----------------------------------------------------------------------

#define bc_create(%0).%1(%2)					bc_%1(_:bc_create(%0), %2)
#define bc_getPhysic(%0).%1(%2)					vehicles.physics.%1(_:bc_getPhysic(%0), %2)
#define bc_getPlayer(%0).%1(%2)					players.%1(_:bc_getPlayer(%0), %2)

// ----------------------------------------------------------------------

#define ae_setVehiclePassenger(%0).%1(%2)		ae_%1(_:ae_setVehiclePassenger(%0), %2)
#define ae_getVehiclePassenger(%0).%1(%2)		bc_%1(_:ae_getVehiclePassenger(%0), %2)

// ----------------------------------------------------------------------

#define ba_getPassengers(%0).%1(%2)				vectors.%1(_:ba_getPassengers(%0), %2)
#define ba_findPassengerBySeat(%0).%1(%2)		vehicles.passengers.%1(_:ba_findPassengerBySeat(%0), %2)
#define ba_findPassengerByPlayer(%0).%1(%2)		vehicles.passengers.%1(_:ba_findPassengerByPlayer(%0), %2)

// ----------------------------------------------------------------------

#define b6_Passenger(%0)						bc_create(%0)

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

#define b6_surfer								b6_surferid
#define b6_surferid.%0(%1)						c0_%0(_:b6_surfer,%1)
#define b6_surfer0.%0(%1)						c0_%0(_:b6_surfer0,%1)
#define b6_surfer1.%0(%1)						c0_%0(_:b6_surfer1,%1)
#define b6_surfer2.%0(%1)						c0_%0(_:b6_surfer2,%1)
#define b6_surfer3.%0(%1)						c0_%0(_:b6_surfer3,%1)
#define b6_surfer4.%0(%1)						c0_%0(_:b6_surfer4,%1)
#define b6_surfer5.%0(%1)						c0_%0(_:b6_surfer5,%1)

// ----------------------------------------------------------------------

#define c0_create(%0).%1(%2)					c0_%1(_:c0_create(%0), %2)
#define c0_getPhysic(%0).%1(%2)					vehicles.physics.%1(_:c0_getPhysic(%0), %2)
#define c0_getPlayer(%0).%1(%2)					players.%1(_:c0_getPlayer(%0), %2)

// ----------------------------------------------------------------------

#define ae_setVehicleSurfer(%0).%1(%2)			ae_%1(_:ae_setVehicleSurfer(%0), %2)
#define ae_getVehicleSurfer(%0).%1(%2)			c0_%1(_:ae_getVehicleSurfer(%0), %2)

#define ae_setSurfingVehicle(%0).%1(%2)			ae_%1(_:ae_setSurfingVehicle(%0), %2)
#define ae_getSurfingVehicle(%0).%1(%2)			vehicles.%1(_:ae_getSurfingVehicle(%0), %2)

// ----------------------------------------------------------------------

#define ba_getSurfers(%0).%1(%2)				vectors.%1(_:ba_getSurfers(%0), %2)
#define ba_findSurferByPlayer(%0).%1(%2)		vehicles.surfers.%1(_:ba_findSurferByPlayer(%0), %2)

// ----------------------------------------------------------------------

#define b6_Surfer(%0)							c0_create(%0)

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

#define b6_component							b6_componentid
#define b6_componentid.%0(%1)					c3_%0(_:b6_component,%1)
#define b6_component0.%0(%1)					c3_%0(_:b6_component0,%1)
#define b6_component1.%0(%1)					c3_%0(_:b6_component1,%1)
#define b6_component2.%0(%1)					c3_%0(_:b6_component2,%1)
#define b6_component3.%0(%1)					c3_%0(_:b6_component3,%1)
#define b6_component4.%0(%1)					c3_%0(_:b6_component4,%1)
#define b6_component5.%0(%1)					c3_%0(_:b6_component5,%1)

// ----------------------------------------------------------------------

#define c3_existent(%0).%1(%2)					vectors.%1(_:c3_existent(%0), %2)
#define c3_create(%0).%1(%2)					c3_%1(_:c3_create(%0), %2)
#define c3_getName(%0).%1(%2)					strings.%1(_:c3_getName(%0), %2)
#define c3_findByName(%0).%1(%2)				c3_%1(_:c3_findByName(%0), %2)

// ----------------------------------------------------------------------

#define b6_Component(%0)						c3_create(%0)

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This