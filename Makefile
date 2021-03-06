export ARCHS := armv7 arm64
export TARGET =  iphone:10.2:8.0
export THEOS_DEVICE_IP = 192.168.0.135
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = sslkillswitch
sslkillswitch_FILES = SSLKillSwitch/SSLKillSwitch.m 

sslkillswitch_FRAMEWORKS = Security

# Build as a Substrate Tweak
sslkillswitch_CFLAGS=-DSUBSTRATE_BUILD

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk


after-install::
	# Respring the device
	install.exec "killall -9 SpringBoard"