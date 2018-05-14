
target_name ?= pinsketch

include ../Makefile.build

pinsketch_clone:
#	code is the last version from the url below
#	https://www.cs.bu.edu/~reyzin/code/fuzzy.html
	@true

pinsketch_config:
	$(call patchme,pinsketch)

pinsketch_build:
	CFLAGS="" CXXFLAGS="" make -C pinsketch -j ${BSPJOB}

pinsketch_install:
	make -C ntl-$(NTL_VERSION)/src install

pinsketch_uninstall:
	make -C ntl-$(NTL_VERSION)/src uninstall

pinsketch_clean:
	make -C pinsketch clean

pinsketch_distclean:
	@true
