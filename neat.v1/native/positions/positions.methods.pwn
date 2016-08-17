#define these positions // b2
#define These Positions // B2
#define this position
#define This Position

// ----------------------------------------------------------------------

initialize()
{
	these.Suicide = Vector("Suicide Positions");
	setInterval(#these._destroySuicide, 1000, "");
	return true;
}

// ----------------------------------------------------------------------

@foundation;

is.create(Float:x = 0.0, Float:y = 0.0, Float:z = 0.0, Float:rx = 0.0, Float:ry = 0.0, Float:rz = 0.0, name[] = these.DefaultName)
{
	new this = create();
	sf(X, x);
	sf(Y, y);
	sf(Z, z);
	sf(RX, rx);
	sf(RY, ry);
	sf(RZ, rz);

	if (strings.(name).is(these.DefaultName))
	{
		these.Suicide.addInteger(this);
	}

	@emitCreate;
	return this;
}

is.destroy(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return;
	}

	if (these.Suicide.hasInteger(this))
	{
		these.Suicide.removeInteger(this);
	}

	destroy();
}

// ----------------------------------------------------------------------

fs.getX(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(X);
}

is.setX(this, Float:x)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(X, x);
	return this;
}

fs.getY(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(Y);
}

is.setY(this, Float:y)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(Y, y);
	return this;
}

fs.getZ(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(Z);
}

is.setZ(this, Float:z)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(Z, z);
	return this;
}

fs.getRX(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(RX);
}

is.setRX(this, Float:rx)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(RX, rx);
	return this;
}

fs.getRY(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(RY);
}

is.setRY(this, Float:ry)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(RY, ry);
	return this;
}

fs.getRZ(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(RZ);
}

is.setRZ(this, Float:rz)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(RZ, rz);
	return this;
}

fs.getR(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	return gf(RZ);
}

is.setR(this, Float:r)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(RZ, r);
	return this;
}

// ----------------------------------------------------------------------

is.getXY(this, &Float:x, &Float:y)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	x = gf(X);
	y = gf(Y);
	return this;
}

is.setXY(this, Float:x, Float:y)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(X, y);
	sf(Y, y);
	return this;
}

is.getXYZ(this, &Float:x, &Float:y, &Float:z)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	x = gf(X);
	y = gf(Y);
	z = gf(Z);
	return this;
}

is.setXYZ(this, Float:x, Float:y, Float:z)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(X, x);
	sf(Y, y);
	sf(Z, z);
	return this;
}

is.getXYZR(this, &Float:x, &Float:y, &Float:z, &Float:r)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	x = gf(X);
	y = gf(Y);
	z = gf(Z);
	r = gf(RZ);
	return this;
}

is.setXYZR(this, Float:x, Float:y, Float:z, Float:r)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(X, x);
	sf(Y, y);
	sf(Z, z);
	sf(RZ, r);
	return this;
}

is.get(this, &Float:x, &Float:y, &Float:z, &Float:rx, &Float:ry, &Float:rz)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	x = gf(X);
	y = gf(Y);
	z = gf(Z);
	rx = gf(RX);
	ry = gf(RY);
	rz = gf(RZ);
	return this;
}

is.set(this, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	sf(X, x);
	sf(Y, y);
	sf(Z, z);
	sf(RX, rx);
	sf(RY, ry);
	sf(RZ, rz);
	return this;
}


// ----------------------------------------------------------------------

is.copyFrom(this, position0)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	if (!position0.exists())
	{
		err("Копируемой позиции не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz;
	position0.get(x, y, z, rx, ry, rz);
	this.set(x, y, z, rx, ry, rz);
	return this;
}

is.clone(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return Position().copyFrom(this);
}

// ----------------------------------------------------------------------

fs.getDistanceToPosition(this, position0)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return 0.0;
	}

	if (!position0.exists())
	{
		err("Копируемой позиции не существует");
		return 0.0;
	}

	new Float:x, Float:y, Float:z;
	new Float:x0, Float:y0, Float:z0;
	this.getXYZ(x, y, z);
	return MPDistance(x, y, z, x0, y0, z0);
}

is.move(this, Float:directionZ, Float:radius, Float:offsetZ = 0.0)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:rz;
	this.getXYZR(x, y, z, rz);
	x += radius * floatcos(rz + directionZ, degrees);
	y += radius * floatsin(rz + directionZ, degrees);
	z += offsetZ;
	return this.clone().setXYZ(x, y, z);
}

is.offset(this, Float:offsetX = 0.0, Float:offsetY = 0.0, Float:offsetZ = 0.0)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z;
	this.getXYZR(x, y, z);
	x += offsetX;
	y += offsetY;
	z += offsetZ;
	return this.clone().setXYZ(x, y, z);
}

is.offsetX(this, Float:offsetX)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return this.clone().setX(this.getX() + offsetX);
}

is.offsetY(this, Float:offsetY)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return this.clone().setY(this.getY() + offsetY);
}

is.offsetZ(this, Float:offsetZ)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return this.clone().setZ(this.getZ() + offsetZ);
}

is.rotate(this, Float:rotateX = 0.0, Float:rotateY = 0.0, Float:rotateZ = 0.0)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	new Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz;
	this.get(x, y, z, rx, ry, rz);
	return this.clone().set(x, y, z, rx + rotateX, ry + rotateY, rz + rotateZ);
}

is.rotateX(this, Float:rotateX)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return this.clone().setRX(this.getRX() + rotateX);
}

is.rotateY(this, Float:rotateY)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return this.clone().setRY(this.getRY() + rotateY);
}

is.rotateZ(this, Float:rotateZ)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	return this.clone().setRZ(this.getRZ() + rotateZ);
}

// ----------------------------------------------------------------------

is.print(this)
{
	if (!this.exists())
	{
		err("Позиции не существует");
		return -1;
	}

	printf("[pos]\tx = %01.4f, y = %01.4f, z = %01.4f, rx = %01.4f, ry = %01.4f, rz = %01.4f", gf(X), gf(Y), gf(Z), gf(RX), gf(RY), gf(RZ));
	return this;
}

// ----------------------------------------------------------------------

ip._destroySuicide()
{
	these.Suicide.each(this, index)
	{
		this.destroy();
	}
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This