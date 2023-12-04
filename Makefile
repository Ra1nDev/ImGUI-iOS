export THEOS=/var/mobile/theos
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = github

$(TWEAK_NAME)_FRAMEWORKS =  UIKit Foundation Security QuartzCore CoreGraphics CoreText  AVFoundation Accelerate GLKit SystemConfiguration GameController

$(TWEAK_NAME)_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

$(TWEAK_NAME)_FILES = Draw.mm $(wildcard Utils/Esp/*.mm) $(wildcard Utils/Esp/*.m) $(wildcard Utils/IMGUI/*.cpp) $(wildcard Utils/IMGUI/*.mm) $(wildcard Utils/KittyMemory/*.cpp) $(wildcard Utils/KittyMemory/*.mm) $(wildcard Utils/Esp/JH/*.m)

include $(THEOS_MAKE_PATH)/tweak.mk


