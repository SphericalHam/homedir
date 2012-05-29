.PHONY: all default
.PHONY: binfiles
.PHONY: testme

FAKEHOME := "virtual_homedir"
HOME     := $(HOME)/$(FAKEHOME)

default: all
testme:
	echo $(HOME)
	ls $(HOME)

all: binfiles

binfiles: bin/*
	mkdir -p ~/bin
	cp $^ ~/bin
