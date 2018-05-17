
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

subdir-y := tools
subdir-y += gmp
subdir-y += ntl
subdir-y += pinsketch
subdir-y += ijssketch

ntl_depends-y = gmp
pinsketch_depends-y = ntl
ijssketch_depends-y = ntl

include Makefile.lib

clone:
	@true

config:
	@true

build:
	@true

install:
	@true

uninstall:
	@true

clean:
	@true

distclean: clean
	@true
