LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := system/core/init
LOCAL_CFLAGS := -Wall -O3
LOCAL_SRC_FILES := init_device.cpp
LOCAL_MODULE := libinit_device
include $(BUILD_STATIC_LIBRARY)