include theos/makefiles/common.mk

BUNDLE_NAME = HelloWorld
HelloWorld_FILES = HelloWorldController.m
HelloWorld_INSTALL_PATH = /System/Library/WeeAppPlugins/
HelloWorld_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
