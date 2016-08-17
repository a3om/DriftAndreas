#define these emitter // a6
#define These Emitter // A6

// ----------------------------------------------------------------------

is.emit(class, name[], map = -1, inverse = false, breakable = false)
{
	new callback[these.MaxCallbackLength + 1];
	new bool:result = false;

	if (inverse)
	{
		vectors.(gamemode.Classes.Address).eachReverse(address, index)
		{
			format(callback, sizeof callback, "%s_handlers", integers.(address).toHexString());

			if (funcidx(callback) < 0)
			{
				continue;
			}

			result = call(callback, "dsd", class, name, map) || result;

			if (breakable && result)
			{
				break;
			}
		}
	}
	else
	{
		vectors.(gamemode.Classes.Address).each(address, index)
		{
			format(callback, sizeof callback, "%s_handlers", integers.(address).toHexString());

			if (funcidx(callback) < 0)
			{
				continue;
			}

			result = call(callback, "dsd", class, name, map) || result;

			if (breakable && result)
			{
				break;
			}
		}
	}

	return result;
}

// ----------------------------------------------------------------------

#undef these
#undef These