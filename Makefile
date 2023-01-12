INCLUDE_DIR := ./include
INCLUDES := $(INCLUDE_DIR)/$(wildcard *.h)
WINE_INCLUDES := $(INCLUDE_DIR)/wine/$(wildcard *.h)

INSTALL_PATH := /usr/bin

all: bdf2fnt fnt2bdf fnt2fon

bdf2fnt: bdf2fnt.c $(INCLUDES)
	cc -I$(INCLUDE_DIR) -o bdf2fnt bdf2fnt.c

fnt2bdf: fnt2bdf.c $(INCLUDES) $(WINE_INCLUDES)
	cc -I$(INCLUDE_DIR) -o fnt2bdf fnt2bdf.c

fnt2fon: fnt2fon.c $(INCLUDES)
	cc -I$(INCLUDE_DIR) -o fnt2fon fnt2fon.c

install: all
	cp bdf2fnt $(INSTALL_PATH)
	cp fnt2bdf $(INSTALL_PATH) 
	cp fnt2fon $(INSTALL_PATH) 

uninstall:
	rm -f $(INSTALL_PATH)/bdf2fnt
	rm -f $(INSTALL_PATH)/fnt2bdf
	rm -f $(INSTALL_PATH)/fnt2fon

clean:
	rm -f bdf2fnt
	rm -f fnt2bdf
	rm -f fnt2fon
