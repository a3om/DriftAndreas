// #define ENABLE_LOG_TRACE

#if defined CRASHDETECT_INC
	
	new tempLogString[1024 + 1];
	new foundLogTraceSubstring = -1;

	#if defined ENABLE_LOG_TRACE
		#define log(%0) GetAmxBacktrace(tempLogString); \
					foundLogTraceSubstring = strfind(tempLogString, "in", true); \
					printf("[log]\t[" these.@ "] " %0); \
					if (foundLogTraceSubstring > -1) printf("#1 %s", tempLogString[foundLogTraceSubstring + 3])
	#else
		#define log(%0) printf("[log]\t[" these.@ "] " %0)
	#endif

	#define err(%0) GetAmxBacktrace(tempLogString); \
					foundLogTraceSubstring = strfind(tempLogString, "in", true); \
				printf("[err]\t[" these.@ "] " %0); \
				if (foundLogTraceSubstring > -1) printf("#1 %s", tempLogString[foundLogTraceSubstring + 3])
#else
	#define log(%0) printf("[log]\t[" these.@ "] " %0)
	#define err(%0) printf("[err]\t[" these.@ "] " %0)
#endif