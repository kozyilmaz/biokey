
target_name ?= pinsketch

include ../Makefile.build

pinsketch_clone:
	if [ ! -f "pinsketch.zip" ]; then curl -OL https://www.cs.bu.edu/~reyzin/code/pinsketch.zip; fi;
	if [ ! -d "pinsketch" ]; then unzip -d pinsketch pinsketch.zip; fi

pinsketch_config:
	$(call patchme,pinsketch)

pinsketch_build:
	CFLAGS="" CXXFLAGS="" make -C pinsketch -j ${BSPJOB}

pinsketch_install:
	@true

pinsketch_uninstall:
	@true

pinsketch_clean:
	if [ -f "pinsketch/Makefile" ]; then make -C pinsketch clean; fi

pinsketch_distclean:
	rm -rf pinsketch
	rm -rf pinsketch.zip
