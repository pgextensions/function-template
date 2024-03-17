OBJS = src/soundex.o src/function.o
MODULE_big = soundex-function

EXTENSION = soundex-function
DATA = soundex-function--1.0.0.sql
PGFILEDESC = "soundex - function for comparing strings"

REGRESS = soundex_function
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
