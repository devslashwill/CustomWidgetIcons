ARCHS = armv7 arm64
THEOS_DEVICE_IP = 192.168.1.7
include theos/makefiles/common.mk

LIBRARY_NAME = CustomWidgetIcons
CustomWidgetIcons_FILES = Tweak.xm
CustomWidgetIcons_FRAMEWORKS = UIKit
CustomWidgetIcons_PRIVATE_FRAMEWORKS = Preferences
CustomWidgetIcons_LDFLAGS = -lsubstrate
CustomWidgetIcons_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS_MAKE_PATH)/library.mk

after-install::
	-install.exec "killall backboardd"

