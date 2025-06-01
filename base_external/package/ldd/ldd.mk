
##############################################################
#
# LDD
#
##############################################################
# manual link: https://buildroot.org/downloads/manual/manual.html
# follow 18.20 of the documentation for making a `kernel-module` mk file

# similar to assignment-5 with writer/finder buildroot
# hash of the commit to grab assignment-7 content
LDD_VERSION = 'a835c01de9538523fc36739b8fafe5385ee9799e'

LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-TheDavo.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules scull

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/

endef
$(eval $(kernel-module))
$(eval $(generic-package))
