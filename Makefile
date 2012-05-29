.PHONY: all default
.PHONY: binfiles

default: all

all: binfiles

binfiles: bin/*
	mkdir -p ~/bin
	cp $^ ~/bin
