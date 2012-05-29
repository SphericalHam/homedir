.PHONY: all default
.PHONY: binfiles
.PHONY: vimfiles .vimrc .vim
.PHONY: testme

FAKEHOME := "virtual_homedir"
HOME     := $(HOME)/$(FAKEHOME)

default: all
testme:
	echo $(HOME)
	ls $(HOME)

all: binfiles vimfiles

binfiles: bin/*
	mkdir -p $(HOME)/bin
	cp $^ $(HOME)/bin

vimfiles: .vimrc .vim

.vimrc:
	cp $@ $(HOME)

.vim:
	cp --dereference --recursive $@ $(HOME)
