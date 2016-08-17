/*
	- Kernel
*/

main() return;

// ----------------------------------------------------------------------

#if defined sscanf
	#error You must delete sscanf2 include
#else
	native sscanf(const data[], const format[], {Float,_}:...);
	native SSCANF_Init(players, invalid, len);
#endif

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.classes.pwn"
#include "driftandreas\classes.pwn"

// ----------------------------------------------------------------------

#include "driftandreas\config.pwn"

// ----------------------------------------------------------------------

#define global.

// ----------------------------------------------------------------------

#define in.%0(%1)		%0(%1)
#define bn.%0(%1)		bool:%0(%1)
#define fn.%0(%1)		Float:%0(%1)
#define tn.%0:%1(%2)	%0:%1(%2)

#define is.%0(%1)		stock %0(%1)
#define bs.%0(%1)		stock bool:%0(%1)
#define fs.%0(%1)		stock Float:%0(%1)
#define ts.%0:%1(%2)	stock %0:%1(%2)

#define ip.%0(%1)		forward %0(%1); public %0(%1)
#define bp.%0(%1)		forward bool:%0(%1); public bool:%0(%1)
#define fp.%0(%1)		forward Float:%0(%1); public Float:%0(%1)
#define tp.%0:%1(%2)	forward %0:%1(%2); public %0:%1(%2)

#include "neat.v1\neat.v1.log.pwn"

#define these.@	"global"
#include "neat.v1\neat.v1.global.pwn"
#undef these

// ----------------------------------------------------------------------

#undef in
#undef bn
#undef fn
#undef tn

#undef is
#undef bs
#undef fs
#undef ts

#undef ip
#undef bp
#undef fp
#undef tp

// ----------------------------------------------------------------------

stock bool:TRUE = bool:1, bool:FALSE = bool:0;

// ----------------------------------------------------------------------

#include "neat.v1\foundation\gamemode\gamemode.macro.pwn"
#include "neat.v1\foundation\vectors\vectors.macro.pwn"
#include "neat.v1\foundation\emitter\emitter.macro.pwn"
#include "neat.v1\foundation\structures\structures.macro.pwn"
#include "neat.v1\foundation\mysql\mysql.macro.pwn"
#include "neat.v1\foundation\timers\timers.macro.pwn"
#include "neat.v1\foundation\integers\integers.macro.pwn"
#include "neat.v1\foundation\floats\floats.macro.pwn"
#include "neat.v1\foundation\strings\strings.macro.pwn"
#include "neat.v1\foundation\maps\maps.macro.pwn"
#include "neat.v1\foundation\colors\colors.macro.pwn"
#include "neat.v1\foundation\timestamps\timestamps.macro.pwn"
#include "neat.v1\foundation\files\files.macro.pwn"

// ----------------------------------------------------------------------

#include "neat.v1\foundation\gamemode\gamemode.properties.pwn"
#include "neat.v1\foundation\vectors\vectors.properties.pwn"
#include "neat.v1\foundation\emitter\emitter.properties.pwn"
#include "neat.v1\foundation\structures\structures.properties.pwn"
#include "neat.v1\foundation\mysql\mysql.properties.pwn"
#include "neat.v1\foundation\timers\timers.properties.pwn"
#include "neat.v1\foundation\integers\integers.properties.pwn"
#include "neat.v1\foundation\floats\floats.properties.pwn"
#include "neat.v1\foundation\strings\strings.properties.pwn"
#include "neat.v1\foundation\maps\maps.properties.pwn"
#include "neat.v1\foundation\colors\colors.properties.pwn"
#include "neat.v1\foundation\timestamps\timestamps.properties.pwn"
#include "neat.v1\foundation\files\files.properties.pwn"

// ----------------------------------------------------------------------

#define call					CallRemoteFunction
#define setTimeout(%0,%1,%2)	SetTimerEx(%0,%1,false,%2)
#define setInterval(%0,%1,%2)	SetTimerEx(%0,%1,true,%2)
#define clearTimerout			KillTimer
#define clearInterval			KillTimer
#define _:%0,)					%0)

// ----------------------------------------------------------------------

#define in.%0(%1)			these.%0(%1)
#define bn.%0(%1)			bool:these.%0(%1)
#define fn.%0(%1)			Float:these.%0(%1)
#define tn.%0:%1(%2)		%0:these.%1(%2)

#define is.%0(%1)			stock these.%0(%1)
#define bs.%0(%1)			stock bool:these.%0(%1)
#define fs.%0(%1)			stock Float:these.%0(%1)
#define ts.%0:%1(%2)		stock %0:these.%1(%2)

#define ip.%0(%1)			forward these.%0(%1); public these.%0(%1)
#define bp.%0(%1)			forward bool:these.%0(%1); public bool:these.%0(%1)
#define fp.%0(%1)			forward Float:these.%0(%1); public Float:these.%0(%1)
#define tp.%0:%1(%2)		forward %0:these.%1(%2); public %0:these.%1(%2)

#define @is.(%0).%1(%2)		stock %0.%1(%2)
#define @bs.(%0).%1(%2)		stock bool:%0.%1(%2)
#define @fs.(%0).%1(%2)		stock Float:%0.%1(%2)
#define @ts.%0:(%1).%2(%3)	stock %0:%1.%2(%3)

// ----------------------------------------------------------------------

#include "neat.v1\foundation\gamemode\gamemode.methods.pwn"
#include "neat.v1\foundation\vectors\vectors.methods.pwn"
#include "neat.v1\foundation\emitter\emitter.methods.pwn"
#include "neat.v1\foundation\structures\structures.methods.pwn"
#include "neat.v1\foundation\mysql\mysql.methods.pwn"
#include "neat.v1\foundation\timers\timers.methods.pwn"
#include "neat.v1\foundation\integers\integers.methods.pwn"
#include "neat.v1\foundation\floats\floats.methods.pwn"
#include "neat.v1\foundation\strings\strings.methods.pwn"
#include "neat.v1\foundation\maps\maps.methods.pwn"
#include "neat.v1\foundation\colors\colors.methods.pwn"
#include "neat.v1\foundation\timestamps\timestamps.methods.pwn"
#include "neat.v1\foundation\files\files.methods.pwn"

// ----------------------------------------------------------------------

#undef in
#undef bn
#undef fn
#undef tn

#undef is
#undef bs
#undef fs
#undef ts

#undef ip
#undef bp
#undef fp
#undef tp

#undef @is
#undef @bs
#undef @fs
#undef @ts

#define on.%0(%1)		public these.@@%0(%1)

// ----------------------------------------------------------------------

#include "neat.v1\foundation\gamemode\gamemode.events.pwn"
#include "neat.v1\foundation\vectors\vectors.events.pwn"
#include "neat.v1\foundation\emitter\emitter.events.pwn"
#include "neat.v1\foundation\structures\structures.events.pwn"
#include "neat.v1\foundation\mysql\mysql.events.pwn"
#include "neat.v1\foundation\timers\timers.events.pwn"
#include "neat.v1\foundation\maps\maps.events.pwn"
#include "neat.v1\foundation\colors\colors.events.pwn"
#include "neat.v1\foundation\files\files.events.pwn"

// ----------------------------------------------------------------------

#undef on

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.macro.pwn"
#include "driftandreas\macro.pwn"

// ----------------------------------------------------------------------

#define define():			new These.@ = -1, These.@Existent = -1;
#define p.%0;				new These.%0 = -1;
#define ni.%0(%1);			structures.addProperty(These.@, #%0, 'i', These.%0, .defaultInteger = %1);
#define nf.%0(%1);			structures.addProperty(These.@, #%0, 'f', These.%0, .defaultFloat = %1);
#define ns.%0(%1);			structures.addProperty(These.@, #%0, 's', These.%0, .defaultString = %1);
#define nv.%0();			structures.addProperty(These.@, #%0, 'v', These.%0);
#define nm.%0();			structures.addProperty(These.@, #%0, 'm', These.%0);
#define i.					ni.
#define f.					nf.
#define s.					ns.
#define v.					nv.
#define m.					nm.
#define si.%0(%1);			structures.addProperty(These.@, #%0, 'i', These.%0, true, .defaultInteger = %1);
#define sf.%0(%1);			structures.addProperty(These.@, #%0, 'f', These.%0, true, .defaultFloat = %1);
#define ss.%0(%1);			structures.addProperty(These.@, #%0, 's', These.%0, true, .defaultString = %1);
#define @p.(%0).%1;			new %0.%1 = -1;
#define @ni.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 'i', %0.%1, .defaultInteger = %2);
#define @nf.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 'f', %0.%1, .defaultFloat = %2);
#define @ns.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 's', %0.%1, .defaultString = %2);
#define @nv.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 'v', %0.%1);
#define @nm.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 'm', %0.%1);
#define @i.					@ni.
#define @f.					@nf.
#define @s.					@ns.
#define @v.					@nv.
#define @m.					@nm.
#define @si.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 'i', %0.%1, true, .defaultInteger = %2);
#define @sf.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 'f', %0.%1, true, .defaultFloat = %2);
#define @ss.(%0).%1(%2);	if (%0.@ == structure) structure.addProperty(#%1, 's', %0.%1, true, .defaultString = %2);
#define initialize()		forward these.structure(); public these.structure()
#define create(%0):			These.@ = structures.create(these.@, #this, these, _:These.@Existent, %0);
#define sync(%0)			structures.synchronize(_:These.@, %0)
#define exports()			forward these.@exports(structure); public these.@exports(structure)
#define export();			structures.exportProperties(These.@);

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.properties.pwn"
#include "driftandreas\properties.pwn"

// ----------------------------------------------------------------------

#undef define
#undef p
#undef ni
#undef nf
#undef ns
#undef nv
#undef nm
#undef i
#undef f
#undef s
#undef v
#undef m
#undef si
#undef sf
#undef ss
#undef @p
#undef @ni
#undef @nf
#undef @ns
#undef @nv
#undef @nm
#undef @i
#undef @f
#undef @s
#undef @v
#undef @m
#undef @si
#undef @sf
#undef @ss
#undef initialize
#undef create
#undef sync
#undef export
#undef exports

// ----------------------------------------------------------------------

#define si(%0,%1)			structures.setObjectIntegerProperty(These.@, this, These.%0, %1)
#define sf(%0,%1)			structures.setObjectFloatProperty(These.@, this, These.%0, %1)
#define ss(%0,%1)			structures.setObjectStringProperty(These.@, this, These.%0, %1)
#define sd(%0)				structures.setDefaultObjectProperty(These.@, this, These.%0)

#define gi(%0)				structures.getObjectIntegerProperty(These.@, this, These.%0)
#define gf(%0)				structures.getObjectFloatProperty(These.@, this, These.%0)
#define gs(%0,%1)			structures.getObjectStringProperty(These.@, this, These.%0, %1)
#define gv(%0)				vectors.(vectors.gi(These.%0, this))
#define gm(%0)				maps.(vectors.gi(These.%0, this))

#define fi(%0,%1)			vectors.fi(These.%0, %1)

#define @si.(%0).(%1,%2,%3)	structures.setObjectIntegerProperty(%0.@, %2, %0.%1, %3)
#define @sf.(%0).(%1,%2,%3)	structures.setObjectFloatProperty(%0.@, %2, %0.%1, %3)
#define @ss.(%0).(%1,%2,%3)	structures.setObjectStringProperty(%0.@, %2, %0.%1, %3)
#define @sd.(%0).(%1,%2)	structures.setDefaultObjectProperty(%0.@, %2, %0.%1)

#define @gi.(%0).(%1,%2)	structures.getObjectIntegerProperty(%0.@, %2, %0.%1)
#define @gf.(%0).(%1,%2)	structures.getObjectFloatProperty(%0.@, %2, %0.%1)
#define @gs.(%0).(%1,%2,%3)	structures.getObjectIntegerProperty(%0.@, %2, %0.%1, %3)
#define @gv.(%0).(%1,%2)	vectors.(vectors.gi(%0.%1, %2))
#define @gm.(%0).(%1,%2)	maps.(vectors.gi(%0.%1, %2))

#define @fi.%0(%1,%2)		vectors.fi(%0.%1, %2)

#define existent()			vectors.(These.@Existent)
#define create(%0)			structures.createObject(_:These.@, %0)
#define clone()				structures.cloneObject(These.@, this)
#define destroy()			structures.destroyObject(These.@, this)
#define save()				structures.saveObject(These.@, this)
#define exists()			structures.objectExists(These.@, this)
#define getId()				structures.getObjectId(These.@, this)
#define findId(%0)			structures.findObjectId(_:These.@, %0)
#define id()				getId()

// ----------------------------------------------------------------------

#define in.%0(%1)			these.%0(%1)
#define bn.%0(%1)			bool:these.%0(%1)
#define fn.%0(%1)			Float:these.%0(%1)
#define tn.%0:%1(%2)		%0:these.%1(%2)

#define is.%0(%1)			stock these.%0(%1)
#define bs.%0(%1)			stock bool:these.%0(%1)
#define fs.%0(%1)			stock Float:these.%0(%1)
#define ts.%0:%1(%2)		stock %0:these.%1(%2)

#define ip.%0(%1)			forward these.%0(%1); public these.%0(%1)
#define bp.%0(%1)			forward bool:these.%0(%1); public bool:these.%0(%1)
#define fp.%0(%1)			forward Float:these.%0(%1); public Float:these.%0(%1)
#define tp.%0:%1(%2)		forward %0:these.%1(%2); public %0:these.%1(%2)

#define @is.(%0).%1(%2)		stock %0.%1(%2)
#define @bs.(%0).%1(%2)		stock bool:%0.%1(%2)
#define @fs.(%0).%1(%2)		stock Float:%0.%1(%2)
#define @ts.%0:(%1).%2(%3)	stock %0:%1.%2(%3)

#define d(%0);				gamemode.classes.create(%0);
#define dependencies()		forward these.dependencies(); public these.dependencies()
#define beforeInitialize()	forward these.beforeInitialize(); public these.beforeInitialize()
#define initialize()		forward these.initialize(); public these.initialize()

#define @foundation			is.(this) return this; \
							is.existent() return existent(); \
							is.exists(this) return exists()

#define @collection			is.(this) return this; \
							is.exists(this) return vectors.(this).exists(); \
							is.create(this = -1) if (this.exists()) return this; else return Vector()

#define @emitCreate			emit(these, #create, M:i(this).si(#fromDatabase, false))

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.methods.pwn"
#include "driftandreas\methods.pwn"

// ----------------------------------------------------------------------

#undef in
#undef bn
#undef fn
#undef tn

#undef is
#undef bs
#undef fs
#undef ts

#undef ip
#undef bp
#undef fp
#undef tp

#undef @is
#undef @bs
#undef @fs
#undef @ts

#undef d
#undef dependencies
#undef beforeInitialize
#undef initialize

#undef @foundation
#undef @collection
#undef @emitCreate

// #define h.%0(%1)			forward these.@%0(%1); public these.@%0(%1)
// #define @h.(%0).%1(%2)		forward %0.@%1(%2); public %0.@%1(%2)

#define handlers			forward these.handlers(_class, _name[], _map); public these.handlers(_class, _name[], _map)
#define h.(%0).%1:			if (_class == %0 && strcmp(_name, #%1) == 0)
#define i.%0;				new %0 = _map.gi(#%0);
#define f.%0;				new Float:%0 = _map.gf(#%0);
#define s.%0[%1];			new %0[%1]; _map.gso(#%0, %0);
#define _map.%0(%1)			maps.%0(_:_map,%1)

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.handlers.pwn"
#include "driftandreas\handlers.pwn"

// ----------------------------------------------------------------------

// #undef	h
// #undef	@h

#undef	handlers
#undef	h
#undef	i
#undef	f
#undef	s
#undef	_map

#define on.%0(%1)			public these.@@%0(%1)
#define @on.(%0).%1(%2)		public %0.@@%1(%2)

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.events.pwn"
#include "driftandreas\events.pwn"

// ----------------------------------------------------------------------

#undef on
#undef @on

// ----------------------------------------------------------------------

#undef si
#undef sf
#undef ss

#undef gi
#undef gf
#undef gs
#undef gv
#undef gm

#undef fi

#undef @si
#undef @sf
#undef @ss
#undef @sd

#undef @gi
#undef @gf
#undef @gs
#undef @gv
#undef @gm

#undef @fi

// ----------------------------------------------------------------------

#define w.%0(%1)			forward windows.@%0(%1, _map); public windows.@%0(%1, _map)
#define i.%0;				new %0 = _map.gi(#%0);
#define f.%0;				new Float:%0 = _map.gf(#%0);
#define s.%0[%1];			new %0[%1]; _map.gso(#%0, %0);
#define _map.%0(%1)			maps.%0(_:_map,%1)

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.windows.pwn"
#include "driftandreas\windows.pwn"

// ----------------------------------------------------------------------

#undef	w
#undef	i
#undef	f
#undef	s
#undef	_map

#define c(%0)		forward these._@commands(%0); public these._@commands(%0) if (commands.empty(command, params)) return 0; else

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.commands.pwn"
#include "driftandreas\commands.pwn"

// ----------------------------------------------------------------------

#undef	c

#define k(%0)		forward these._@keys(%0, _keys); public these._@keys(%0, _keys)
#define down(%0)	vectors.(_keys).hasInteger(keys.%0)
#define up(%0)		!vectors.(_keys).hasInteger(keys.%0)

// ----------------------------------------------------------------------

#include "neat.v1\neat.v1.keys.pwn"
#include "driftandreas\keys.pwn"

// ----------------------------------------------------------------------

#undef	k
#undef	down
#undef	up

// ----------------------------------------------------------------------

#undef existent
#undef create
#undef clone
#undef destroy
#undef save
#undef exists
#undef getId
#undef findId
#undef id

// ----------------------------------------------------------------------

#define in.%0(%1)		%0(%1)
#define bn.%0(%1)		bool:%0(%1)
#define fn.%0(%1)		Float:%0(%1)
#define tn.%0:%1(%2)	%0:%1(%2)

#define is.%0(%1)		stock %0(%1)
#define bs.%0(%1)		stock bool:%0(%1)
#define fs.%0(%1)		stock Float:%0(%1)
#define ts.%0:%1(%2)	stock %0:%1(%2)

#define ip.%0(%1)		forward %0(%1); public %0(%1)
#define bp.%0(%1)		forward bool:%0(%1); public bool:%0(%1)
#define fp.%0(%1)		forward Float:%0(%1); public Float:%0(%1)
#define tp.%0:%1(%2)	forward %0:%1(%2); public %0:%1(%2)

#define these.@	"global"