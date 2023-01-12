INCLUDE_DIR := ./include
INCLUDES := $(INCLUDE_DIR)/$(wildcard *.h)
WINE_INCLUDES := $(INCLUDE_DIR)/wine/$(wildcard *.h)

all: bdf2fnt fnt2bdf fnt2fon

bdf2fnt: bdf2fnt.c $(INCLUDES)
	cc -I$(INCLUDE_DIR) -o bdf2fnt bdf2fnt.c

fnt2bdf: fnt2bdf.c $(INCLUDES) $(WINE_INCLUDES)
	cc -I$(INCLUDE_DIR) -o fnt2bdf fnt2bdf.c

fnt2fon: fnt2fon.c $(INCLUDES)
	cc -I$(INCLUDE_DIR) -o fnt2fon fnt2fon.c


clean:
	rm -f bdf2fnt
	rm -f fnt2bdf
	rm -f fnt2fon
