
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
	mkdir -p ${BSPINSTALL}
	if [ -f "pinsketch/sketch" ]; then cp pinsketch/sketch ${BSPINSTALL}/sketch; fi
	if [ -f "pinsketch/differ" ]; then cp pinsketch/differ ${BSPINSTALL}/differ; fi

pinsketch_uninstall:
	rm -rf ${BSPINSTALL}/sketch
	rm -rf ${BSPINSTALL}/differ

pinsketch_clean:
	if [ -f "pinsketch/Makefile" ]; then make -C pinsketch clean; fi

pinsketch_distclean:
	rm -rf pinsketch
	rm -rf pinsketch.zip
