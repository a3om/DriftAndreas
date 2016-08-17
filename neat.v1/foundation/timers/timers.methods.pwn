#define these timers // a9
#define These Timers // A9
#define this timer
#define This Timer

// ----------------------------------------------------------------------

ip.initialize()
{
	setInterval(#these.200ms, 100, "");
	setInterval(#these.200ms, 200, "");
	setInterval(#these.500ms, 500, "");
	setInterval(#these.1s, 1000, "");
	setInterval(#these.5s, 5000, "");
	setInterval(#these.10s, 10000, "");
	setInterval(#these.15s, 15000, "");
	setInterval(#these.30s, 30000, "");
	setInterval(#these.1min, 60000, "");

	return true;
}

ip.100ms()
{
	emit(timers, "100ms");
}

ip.200ms()
{
	emit(timers, "200ms");
}

ip.500ms()
{
	emit(timers, "500ms");
}

ip.1s()
{
	emit(timers, "1s");
}

ip.5s()
{
	emit(timers, "5s");
}

ip.10s()
{
	emit(timers, "10s");
}

ip.15s()
{
	emit(timers, "15s");
}

ip.30s()
{
	emit(timers, "30s");
}

ip.1min()
{
	emit(timers, "1min");
}

// is.create(callback[], delay, repeat, a = -1, b = -1, c = -1, d = -1, e = -1, f = -1, g = -1)
// {
// 	new this = vector_find(these.VectorOfExistent, -1);

// 	if (this < 0)
// 	{
// 		this = vector_size(these.VectorOfExistent);
// 		vector_push_back(these.VectorOfId, 0);
// 		vector_push_back_arr(these.VectorOfCallback, callback);
// 		vector_push_back(these.VectorOfRepeat, repeat);
// 		vector_push_back(these.VectorOfExistent, 1);
// 	}
// 	else
// 	{
// 		vector_set(these.VectorOfId, this, 0);
// 		vector_set_arr(these.VectorOfCallback, this, callback);
// 		vector_set(these.VectorOfRepeat, this, repeat);
// 		vector_set(these.VectorOfExistent, this, 1);
// 	}

// 	new timerId = SetTimerEx(#these.tick, delay, repeat, "iiiiiiii", this, a, b, c, d, e, f, g);
// 	log("timerId = %d", timerId);
// 	vector_set(these.VectorOfId, this, timerId);
// 	return this;
// }

// is.destroy(this)
// {
// 	if (!this.exists())
// 	{
// 		err("Таймера не существует");
// 		return;
// 	}

// 	new timerId = vector_get(these.VectorOfId, this);
// 	log("убиваем таймер timerId = %d", timerId);
// 	KillTimer(timerId);
// 	vector_set(these.VectorOfId, this, 0);
// 	vector_set(these.VectorOfExistent, this, -1);
// }

// is.exists(this)
// {
// 	if (this < 0 || this >= vector_size(these.VectorOfExistent))
// 	{
// 		return false;
// 	}

// 	return vector_get(these.VectorOfExistent, this) > 0;
// }

// ip.tick(this, a, b, c, d, e, f, g)
// {
// 	if (!this.exists())
// 	{
// 		err("Таймера не существует");
// 		return;
// 	}

// 	new callback[these.MaxCallbackLength + 1];
// 	vector_get_arr(these.VectorOfCallback, this, callback, sizeof callback);
// 	call(callback, "iiiiiii", a, b, c, d, e, f, g);

// 	if (vector_get(these.VectorOfRepeat, this))
// 	{
// 		return;
// 	}

// 	this.destroy();
// }

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This