#define these players // ae
#define These Players // AE
#define this player
#define This Player

// ----------------------------------------------------------------------

#define player										playerid
#define playerid.%0(%1)								ae_%0(_:player,%1)
#define player0.%0(%1)								ae_%0(_:player0,%1)
#define player1.%0(%1)								ae_%0(_:player1,%1)
#define player2.%0(%1)								ae_%0(_:player2,%1)
#define player3.%0(%1)								ae_%0(_:player3,%1)
#define player4.%0(%1)								ae_%0(_:player4,%1)
#define player5.%0(%1)								ae_%0(_:player5,%1)

// ----------------------------------------------------------------------

#define ae_create(%0).%1(%2)						ae_%1(_:ae_create(%0), %2)
#define ae_existent(%0).%1(%2)						players.collections.%1(_:ae_existent(), %2)
#define ae_setSpawnInfo(%0).%1(%2)					ae_%1(_:ae_setSpawnInfo(%0), %2)
#define ae_getName(%0).%1(%2)						strings.%1(_:ae_getName(%0), %2)
#define ae_setName(%0).%1(%2)						ae_%1(_:ae_setName(%0), %2)
#define ae_getPosition(%0).%1(%2)					positions.%1(_:ae_getPosition(%0), %2)
#define ae_setPosition(%0).%1(%2)					ae_%1(_:ae_setPosition(%0), %2)
#define ae_toggleSpectating(%0).%1(%2)				ae_%1(_:ae_toggleSpectating(%0), %2)
#define ae_enableSpectating(%0).%1(%2)				ae_%1(_:ae_enableSpectating(%0), %2)
#define ae_disableSpectating(%0).%1(%2)				ae_%1(_:ae_disableSpectating(%0), %2)
#define ae_getColor(%0).%1(%2)						colors.%1(_:ae_getColor(%0), %2)
#define ae_setColor(%0).%1(%2)						ae_%1(_:ae_setColor(%0), %2)
#define ae_setSpawned(%0).%1(%2)					ae_%1(_:ae_setSpawned(%0), %2)
#define ae_setSkin(%0).%1(%2)						ae_%1(_:ae_setSkin(%0), %2)
#define ae_setHealth(%0).%1(%2)						ae_%1(_:ae_setHealth(%0), %2)
#define ae_kill(%0).%1(%2)							ae_%1(_:ae_kill(%0), %2)
#define ae_spawn(%0).%1(%2)							ae_%1(_:ae_spawn(%0), %2)
#define ae_setSpecialAction(%0).%1(%2)				ae_%1(_:ae_setSpecialAction(%0), %2)
#define ae_setMoney(%0).%1(%2)						ae_%1(_:ae_setMoney(%0), %2)
#define ae_giveMoney(%0).%1(%2)						ae_%1(_:ae_giveMoney(%0), %2)
#define ae_takeMoneyAway(%0).%1(%2)					ae_%1(_:ae_takeMoneyAway(%0), %2)

// ----------------------------------------------------------------------

#define ae_@@connect								OnPlayerConnect
#define ae_@@disconnect								OnPlayerDisconnect
#define ae_@@update									OnPlayerUpdate
#define ae_@@text									OnPlayerText
#define ae_@@spawn									OnPlayerSpawn
#define ae_@@requestSpawn							OnPlayerRequestSpawn
#define ae_@@requestClass							OnPlayerRequestClass
#define ae_@@death									OnPlayerDeath
#define ae_@@clickPlayer							OnPlayerClickPlayer

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these players.collections // c1
#define These players.Collections // C1
#define this players.collection
#define This players.Collection

// ----------------------------------------------------------------------

#define ae_collection								ae_collectionid
#define ae_collectionid.%0(%1)						c1_%0(_:ae_collection,%1)
#define ae_collection0.%0(%1)						c1_%0(_:ae_collection0,%1)
#define ae_collection1.%0(%1)						c1_%0(_:ae_collection1,%1)
#define ae_collection2.%0(%1)						c1_%0(_:ae_collection2,%1)
#define ae_collection3.%0(%1)						c1_%0(_:ae_collection3,%1)
#define ae_collection4.%0(%1)						c1_%0(_:ae_collection4,%1)
#define ae_collection5.%0(%1)						c1_%0(_:ae_collection5,%1)

// ----------------------------------------------------------------------

#define c1_each(%0)									vectors.each(%0)

// ----------------------------------------------------------------------

#define c1_(%0).%1(%2)								c1_%1(_:c1_(%0), %2)
#define c1_create(%0).%1(%2)						c1_%1(_:c1_create(%0), %2)
#define c1_slice(%0).%1(%2)							c1_%1(_:c1_slice(%0), %2)

#define c1_add(%0).%1(%2)							c1_%1(_:c1_add(%0), %2)
#define c1_remove(%0).%1(%2)						c1_%1(_:c1_remove(%0), %2)
#define c1_find(%0).%1(%2)							c1_%1(_:c1_find(%0), %2)
#define c1_save(%0).%1(%2)							c1_%1(_:c1_save(%0), %2)

// ----------------------------------------------------------------------

#define ae_Collection(%0)							c1_create(%0)

// ----------------------------------------------------------------------

#define c1_length									c1_getLength

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This