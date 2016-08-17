#define these accounts // a00
#define These Accounts // A00
#define this account
#define This Account

// ----------------------------------------------------------------------

#define account								accountid
#define accountid.%0(%1)					a00_%0(_:account,%1)
#define account0.%0(%1)						a00_%0(_:account0,%1)
#define account1.%0(%1)						a00_%0(_:account1,%1)
#define account2.%0(%1)						a00_%0(_:account2,%1)
#define account3.%0(%1)						a00_%0(_:account3,%1)
#define account4.%0(%1)						a00_%0(_:account4,%1)
#define account5.%0(%1)						a00_%0(_:account5,%1)

// ----------------------------------------------------------------------

#define a00_(%0).%1(%2)						a00_%1(_:a00_(%0), %2)
#define a00_existent(%0).%1(%2)				accounts.collections.%1(_:a00_existent(%0), %2)
#define a00_create(%0).%1(%2)				a00_%1(_:a00_create(%0), %2)
#define a00_save(%0).%1(%2)					a00_%1(_:a00_save(%0), %2)
#define a00_getName(%0).%1(%2)				strings.%1(_:a00_getName(%0), %2)
#define a00_setName(%0).%1(%2)				a00_%1(_:a00_setName(%0), %2)
#define a00_getPasswordHash(%0).%1(%2)		strings.%1(_:a00_getPasswordHash(%0), %2)
#define a00_getPlayer(%0).%1(%2)			players.%1(_:a00_getPlayer(%0), %2)
#define a00_setPlayer(%0).%1(%2)			a00_%1(_:a00_setPlayer(%0), %2)
#define a00_getPosition(%0).%1(%2)			positions.%1(_:a00_getPosition(%0), %2)
#define a00_setPosition(%0).%1(%2)			a00_%1(_:a00_setPosition(%0), %2)
#define a00_setSkin(%0).%1(%2)				a00_%1(_:a00_setSkin(%0), %2)
#define a00_getColor(%0).%1(%2)				colors.%1(_:a00_getColor(%0), %2)
#define a00_setColor(%0).%1(%2)				a00_%1(_:a00_setColor(%0), %2)
#define a00_setMoney(%0).%1(%2)				a00_%1(_:a00_setMoney(%0), %2)
#define a00_giveMoney(%0).%1(%2)			a00_%1(_:a00_giveMoney(%0), %2)
#define a00_takeMoneyAway(%0).%1(%2)		a00_%1(_:a00_takeMoneyAway(%0), %2)
#define a00_find(%0).%1(%2)					accounts.collections.%1(_:a00_find(%0), %2)

// ----------------------------------------------------------------------

#define Account(%0)							a00_create(%0)

// ----------------------------------------------------------------------

#define ae_getAccount(%0).%1(%2)			accounts.%1(_:ae_getAccount(%0), %2)
#define ae_setAccount(%0).%1(%2)			ae_%1(_:ae_setAccount(%0), %2)
#define ae_logout(%0).%1(%2)				ae_%1(_:ae_logout(%0), %2)
#define ae_LoggedIn.						players.collections.(ae_LoggedIn).

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This

#define these accounts.collections // a05
#define These accounts.Collections // A05
#define this accounts.collection
#define This accoutns.Collection

// ----------------------------------------------------------------------

#define a00_collection								a00_collectionid
#define a00_collectionid.%0(%1)						a05_%0(_:a00_collection,%1)
#define a00_collection0.%0(%1)						a05_%0(_:a00_collection0,%1)
#define a00_collection1.%0(%1)						a05_%0(_:a00_collection1,%1)
#define a00_collection2.%0(%1)						a05_%0(_:a00_collection2,%1)
#define a00_collection3.%0(%1)						a05_%0(_:a00_collection3,%1)
#define a00_collection4.%0(%1)						a05_%0(_:a00_collection4,%1)
#define a00_collection5.%0(%1)						a05_%0(_:a00_collection5,%1)

// ----------------------------------------------------------------------

#define a05_each(%0)								vectors.each(%0)

// ----------------------------------------------------------------------

#define a05_(%0).%1(%2)								a05_%1(_:a05_(%0), %2)
#define a05_toVector(%0).%1(%2)						vectors.%1(_:a05_(%0), %2)
#define a05_create(%0).%1(%2)						a05_%1(_:a05_create(%0), %2)
#define a05_slice(%0).%1(%2)						a05_%1(_:a05_slice(%0), %2)

#define a05_add(%0).%1(%2)							a05_%1(_:a05_add(%0), %2)
#define a05_remove(%0).%1(%2)						a05_%1(_:a05_remove(%0), %2)
#define a05_find(%0).%1(%2)							a05_%1(_:a05_find(%0), %2)
#define a05_save(%0).%1(%2)							a05_%1(_:a05_save(%0), %2)

// ----------------------------------------------------------------------

#define a00_Collection(%0)							a05_create(%0)

// ----------------------------------------------------------------------

#define a05_length									a05_getLength

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This