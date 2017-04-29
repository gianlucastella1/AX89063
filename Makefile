LCDPROC_VER=0.5.7
LCDPROC_DIR=lcdproc-$(LCDPROC_VER)-pre1
LCDPROC_DST=$(PWD)/lcdproc-target
LCDPROC_TGZ=$(LCDPROC_DIR).tar.gz
LCDPROC_URL=https://sourceforge.net/projects/lcdproc/files/lcdproc/$(LCDPROC_VER)/$(LCDPROC_TGZ)/download

SF_MIRROR=switch

AUTOCONF=autoconf
AUTOMAKE=automake


all install: $(LCDPROC_DIR)/Makefile
	$(MAKE) -C $(LCDPROC_DIR) $@

clean:
	make -C $(LCDPROC_DIR) $@ || true
	rm -r $(LCDPROC_DST)

veryclean:
	rm -rf $(LCDPROC_DIR)
	rm -rf $(LCDPROC_DST)

getdir:
	@echo $(LCDPROC_DIR)
	

$(LCDPROC_DIR)/Makefile: $(LCDPROC_DIR)/configure
	cd $(LCDPROC_DIR) && ./configure --enable-debug \
		--prefix=$(LCDPROC_DST) \
		--enable-drivers=ax89063

$(LCDPROC_DIR)/configure: $(LCDPROC_TGZ)
	tar xfz $(LCDPROC_TGZ)
	cd $(LCDPROC_DIR) && patch -p1 < ../lcdproc.patch
	cd $(LCDPROC_DIR) && $(AUTOMAKE)
	cd $(LCDPROC_DIR) && $(AUTOCONF)
	ln -s ../../../ax89063.c $(LCDPROC_DIR)/server/drivers/
	ln -s ../../../ax89063.h $(LCDPROC_DIR)/server/drivers/

$(LCDPROC_TGZ):
	wget -O $(LCDPROC_TGZ) "$(LCDPROC_URL)"
