#define these colors // b4
#define These Colors // B4
#define this color
#define This Color

// ----------------------------------------------------------------------

is.isValid(this[])
{
	if (this[0] == EOS)
	{
		return false;
	}

	new length = strlen(this);

	if (length != these.MaxColorLength)
	{
		return false;
	}

	for (new i = 0; i < length; ++i)
	{
		if (this[i] >= '0' && this[i] <= '9' || this[i] >= 'a' && this[i] <= 'f')
		{
			continue;
		}

		return false;
	}

	return true;
}

is.is(this[], color0[])
{
	if (!this.isValid())
	{
		err("Неправильный цвет");
		return false;
	}

	if (!color0.isValid())
	{
		err("Неправильный цвет");
		return false;
	}

	return strcmp(this, color0, false) == 0;
}

is.toRGBA(this[], alpha = 0xFF)
{
	if (!this.isValid())
	{
		err("Неправильный цвет");
		return 0;
	}

	alpha = (alpha < 0x00 || alpha > 0xFF) ? 0xFF : alpha;
	new integer;
	sscanf(this, "h", integer);
	return (integer << 8) + alpha;
}

is.fromRGB(r, g, b)
{
	new this[these.MaxColorLength + 1];
	format(this, sizeof this, "%02h%02h%02h", r, g, b);

	for (new i = 0; i < these.MaxColorLength; ++i)
	{
		this[i] = tolower(this[i]);
	}

	return this;
}

is.random(colored = false)
{
	new this[these.MaxColorLength + 1];

	if (!colored)
	{
		this = these.fromRGB(integers.random(0xFF), integers.random(0xFF), integers.random(0xFF));
		return this;
	}

	switch (integers.random(3))
	{
		case 0: // rg
		{
			this = these.fromRGB(integers.random(0xFF), integers.random(0xFF), 0xFF);
		}
		case 1: // gb
		{
			this = these.fromRGB(0xFF, integers.random(0xFF), integers.random(0xFF));
		}
		case 2: // br
		{
			this = these.fromRGB(integers.random(0xFF), 0xFF, integers.random(0xFF));
		}
	}

	return this;
}

is.copyFrom(this[], color1[], this_size = sizeof this)
{
	this[0] = EOS;
	strcat(this, color1, this_size);
}

// ----------------------------------------------------------------------

@is.(strings).colorize(string[], color[] = #ffffff)
{
	if (!color.isValid())
	{
		err("Неправильный цвет");
		return 0;
	}

	new cl = 0, wl = 0, p = -1, l = strlen(string), cm = 0, colorInteger;
	++l;
	strins(string, " ", 0, l);
	string[0] = (color[0] == EOS) ? 0xFFFFFFFF : color.toRGBA(0xFF);
	
	for(new i = 1; i < l; ++i)
	{
		switch(string[i])
		{
			case '{':
			{
				new a = 1; // Предположение, что впереди цвет
				
				for (new b = i + 1, c = 0; c < 6; ++c, ++b)
				{
					if (string[b] >= '0' && string[b] <= '9' || string[b] >= 'a' && string[b] <= 'f')
					{
						continue;
					}
					
					a = 0;
					// printf("Это не цвет");
					break;
				}
				
				if (a && string[i + 7] != '}') // Если проход по символам, следующем после символа { завершился успешно и если предполагаемый символ конца цвета не равен }, то опровергаем предположение
				{
					a = 0;
					// printf("Это не цвет");
				}
				
				if (a) // Если это всё-таки цвет, то...
				{
					string[i + 7] = EOS;
					colorInteger = colors.toRGBA(string[i + 1], 0xFF);
					cl += 8;
					// printf("Это цвет... [cl = %d] color = %s", cl, this[i + 1]);
					
					if (cl > 144)
					{
						// printf("Мы попали на цвет... color = %s", this[i + 1]);
						string[i] = EOS;
						string[i + 1] = colorInteger;
						
						for (new n = i + 2, z = 2; z < 8; ++z, ++n)
						{
							string[n] = ' ';
						}
						
						cl = 0;
						wl = 0;
						i += 7;
						p = -1;
						++cm;
						continue;
					}
					
					string[i + 7] = '}';
					i += 7;
					continue;
				}
			}
			case ' ':
			{
				p = i;
			}
			case '\n':
			{
				p = i;
				wl = 128;
			}
		}
		
		++cl;
		++wl;
		
		if (wl > 128)
		{
			// printf("Мы попали на символ [128] = %s", this[i]);
			
			if (i - p <= 32)
			{
				string[p] = EOS;
				
				for (new b = l - 1; b > p; --b)
				{
					string[b + 1] = string[b];
				}
				
				string[p + 1] = colorInteger;
				cl = 0;
				wl = 0;
				i = p + 1;
				p = -1;
				++l;
				string[l] = EOS;
				++cm;
				continue;
			}
			
			for (new b = l - 1; b >= i; --b)
			{
				string[b + 2] = string[b];
			}
			
			string[i] = EOS;
			string[i + 1] = colorInteger;
			cl = 0;
			wl = 0;
			++i;
			p = -1;
			l += 2;
			string[l] = EOS;
			++cm;
			continue;
		}
		
		if (cl > 144)
		{
			// printf("Мы попали на символ [144] = %s", this[i]);
			
			if (i - p <= 36)
			{
				string[p] = EOS;
				
				for (new b = l - 1; b > p; --b)
				{
					string[b + 1] = string[b];
				}
				
				string[p + 1] = colorInteger;
				cl = 0;
				wl = 0;
				i = p + 1;
				p = -1;
				++l;
				string[l] = EOS;
				++cm;
				continue;
			}
			
			for (new b = l - 1; b >= i; --b)
			{
				string[b + 2] = string[b];
			}
			
			string[i] = EOS;
			string[i + 1] = colorInteger;
			cl = 0;
			wl = 0;
			++i;
			p = -1;
			l += 2;
			string[l] = EOS;
			++cm;
			continue;
		}
	}
	
	return cm;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This