# to force renew:  make -B img

.DELETE_ON_ERROR:
SHELL = /bin/bash

ROOT_FILE=00_tcltk.fr.texinfo
MASTER=tcltk.fr
SOURCE=*.texinfo
IMG=./images/*
COL=37   # column to start description

INFO_PATH=/usr/local/share/info/
INFO_PATH_IMAGES=/usr/local/share/info/images

info : $(SOURCE)
	texi2any --info --output=$(MASTER).info --document-language=fr_FR $(ROOT_FILE)

install : info
	gzip -f *.info*
	cp *.info*.gz -t $(INFO_PATH)
	rm -f *.info*.gz
	cp $(IMG) $(INFO_PATH_IMAGES)
	cp ./images/* $(INFO_PATH_IMAGES)
	install-info --keep-old --align=$(COL) --calign=$(COL) $(INFO_PATH)/$(MASTER).info.gz $(INFO_PATH)/dir

all: install

# clean directories
.PHONY : all clean info install
clean:
	rm -f *.info*
	rm -f *~
	rm -f *.gz
