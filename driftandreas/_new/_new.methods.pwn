#define these _news
#define These _News
#define this _new
#define This _New

// ----------------------------------------------------------------------

dependencies()
{
	// d(someClass);
}

initialize()
{
	log("Инициализируем класс _new");
	return true;
}

// ----------------------------------------------------------------------

#undef these
#undef These
#undef this
#undef This