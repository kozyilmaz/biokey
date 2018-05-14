
target_name ?= ntl

include ../Makefile.build

NTL_VERSION="11.0.0"

ntl_clone:
	if [ ! -f "ntl-$(NTL_VERSION).tar.gz" ]; then curl -OL http://www.shoup.net/ntl/ntl-$(NTL_VERSION).tar.gz; fi;
	if [ ! -d "ntl-$(NTL_VERSION)" ]; then tar xvf ntl-$(NTL_VERSION).tar.gz; fi

ntl_config:
	( cd ntl-$(NTL_VERSION)/src; \
		CFLAGS="" CXXFLAGS="" ./configure DEF_PREFIX=${BSPTOOLS}; \
	)

ntl_build:
	make -C ntl-$(NTL_VERSION)/src -j ${BSPJOB}

ntl_install:
	make -C ntl-$(NTL_VERSION)/src install

ntl_uninstall:
	make -C ntl-$(NTL_VERSION)/src uninstall

ntl_clean:
	if [ -f "ntl-$(NTL_VERSION)/src/makefile" ]; then make -C ntl-$(NTL_VERSION)/src clean; fi

ntl_distclean:
	rm -rf ntl-$(NTL_VERSION)
	rm -rf ntl-$(NTL_VERSION).tar.gz
