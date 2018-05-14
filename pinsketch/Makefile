
target_name ?= pinsketch

include ../Makefile.build

pinsketch_clone:
#	code is the last version from the url below
#	https://www.cs.bu.edu/~reyzin/code/fuzzy.html
	@true

pinsketch_config:
	( cd pinsketch-$(NTL_VERSION)/src; \
		CFLAGS="" CXXFLAGS="" ./configure DEF_PREFIX=${BSPTOOLS}; \
	)

pinsketch_build:
	make -C ntl-$(NTL_VERSION)/src -j ${BSPJOB}

pinsketch_install:
	make -C ntl-$(NTL_VERSION)/src install

pinsketch_uninstall:
	make -C ntl-$(NTL_VERSION)/src uninstall

pinsketch_clean:
	if [ -f "ntl-$(NTL_VERSION)/src/makefile" ]; then make -C ntl-$(NTL_VERSION)/src clean; fi

pinsketch_distclean:
	rm -rf ntl-$(NTL_VERSION)
	rm -rf ntl-$(NTL_VERSION).tar.gz
