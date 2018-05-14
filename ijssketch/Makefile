
target_name ?= ijssketch

include ../Makefile.build

ijssketch_clone:
	if [ ! -f "ijssketch.zip" ]; then curl -OL https://www.cs.bu.edu/~reyzin/code/ijssketch.zip; fi;
	if [ ! -d "ijssketch" ]; then unzip -d ijssketch ijssketch.zip; fi

ijssketch_config:
	$(call patchme,ijssketch)

ijssketch_build:
	CFLAGS="" CXXFLAGS="" make -C ijssketch -j ${BSPJOB}

ijssketch_install:
	mkdir -p ${BSPINSTALL}
	if [ -f "ijssketch/ijs" ]; then cp ijssketch/ijs ${BSPINSTALL}/ijs; fi

ijssketch_uninstall:
	rm -rf ${BSPINSTALL}/ijs

ijssketch_clean:
	if [ -f "ijssketch/Makefile" ]; then make -C ijssketch clean; fi

ijssketch_distclean:
	rm -rf ijssketch
	rm -rf ijssketch.zip
