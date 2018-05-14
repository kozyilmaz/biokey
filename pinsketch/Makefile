
target_name ?= pinsketch

include ../Makefile.build

pinsketch_clone:
	if [ ! -f "pinsketch.zip" ]; then curl -OL https://www.cs.bu.edu/~reyzin/code/pinsketch.zip; fi;
#	if [ ! -d "ntl-$(NTL_VERSION)" ]; then tar xvf ntl-$(NTL_VERSION).tar.gz; fi

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
