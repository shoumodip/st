# Simple terminal
# See LICENSE file for copyright and license details.

# Version
VERSION = 0.8.4

# X
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

# Libraries
INCS = -I$(X11INC) `$(PKG_CONFIG) --cflags fontconfig` `$(PKG_CONFIG) --cflags freetype2`
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft `$(PKG_CONFIG) --libs fontconfig` `$(PKG_CONFIG) --libs freetype2`

# Flags
CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
CFLAGS = $(INCS) $(CPPFLAGS)
LDFLAGS = $(LIBS)

# Compiler and linker
CC = cc

%.o: src/%.c
	@$(CC) -c $(CFLAGS) $< -o $@

st: st.o x.o
	@$(CC) -o $@ *.o $(LDFLAGS)
	@rm *.o
