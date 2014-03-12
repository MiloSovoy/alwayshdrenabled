ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk

TWEAK_NAME = AlwaysHDREnabled
AlwaysHDREnabled_FILES = Tweak.xm
AlwaysHDREnabled_FRAMEWORKS = UIKit Preferences
AlwaysHDREnabled_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard; killall -9 Camera"
SUBPROJECTS += alwayshdrenabled
include $(THEOS_MAKE_PATH)/aggregate.mk
