ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk

TWEAK_NAME = AlwaysHDREnabled
AlwaysHDREnabled_FILES = Tweak.xm
AlwaysHDREnabeld_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard; killall -9 Camera"
