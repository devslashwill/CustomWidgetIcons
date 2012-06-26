include theos/makefiles/common.mk

LIBRARY_NAME = CustomWidgetIcons
CustomWidgetIcons_FILES = Tweak.xm
CustomWidgetIcons_FRAMEWORKS = UIKit
CustomWidgetIcons_PRIVATE_FRAMEWORKS = Preferences
CustomWidgetIcons_LDFLAGS = -lsubstrate
CustomWidgetIcons_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS_MAKE_PATH)/library.mk

after-install::
	-install.exec "killall Preferences"

