#define these players // ae
#define These Players // AE
#define this player
#define This Player

// ----------------------------------------------------------------------

on.connect(this)
{
	new name[MAX_PLAYER_NAME + 1];
	GetPlayerName(this, name, sizeof name);
	this = this.create(name);
	si(ConnectedAt, Timestamp());
	emit(these, #connect, M:i(this));
}

on.disconnect(this)
{
	emit(these, #disconnect, M:i(this), .inverse = true);
	this.destroy();
}

// ----------------------------------------------------------------------

on.spawn(this)
{
	this.sendServerMessage(colors.Info, "spawn");
	this.setSpawned(true);
	emit(these, #spawn, M:i(this));
}

on.requestSpawn(this)
{
	this.sendServerMessage(colors.Info, "requestSpawn");
	emit(these, #requestSpawn, M:i(this));
	return 1;
}

on.requestClass(this, classid)
{
	this.sendServerMessage(colors.Info, "requestClass");
	this.setSpawned(false);
	emit(these, #requestClass, M:i(this).i(classid));
	return 1;
}

on.death(this, killerid, reason)
{
	this.setSpawned(false);
	emit(these, #death, M:i(this));
	this.sendServerMessage(colors.Info, "death");
	this.setSpawnInfo();
}

// ----------------------------------------------------------------------

on.clickPlayer(this, clickedplayerid, source)
{
	return emit(these, #clickPlayer, M:i(this).si(#player0, clickedplayerid).i(source));
}

on.update(this)
{
	return emit(these, #update, M:i(this));
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This