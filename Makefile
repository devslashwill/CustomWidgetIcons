include theos/makefiles/common.mk

TWEAK_NAME = CustomWidgetIcons
CustomWidgetIcons_FILES = Tweak.xm
CustomWidgetIcons_FRAMEWORKS = UIKit
CustomWidgetIcons_PRIVATE_FRAMEWORKS = Preferences

after-install::
	install.exec "killall Preferences"

include $(THEOS_MAKE_PATH)/tweak.mk
