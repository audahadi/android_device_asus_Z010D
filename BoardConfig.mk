# config.mk
#
# Product-specific compile-time definitions.
#

-include $(QCPATH)/common/msm8916/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := Z010D,Z010,ASUS_Z010

TARGET_BOARD_PLATFORM := msm8916
TARGET_BOOTLOADER_BOARD_NAME := msm8916
TARGET_NO_BOOTLOADER := true
BOARD_USES_QCOM_HARDWARE := true

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

BOOTLOADER_GCC_VERSION := arm-eabi-4.8
BOOTLOADER_PLATFORM := msm8916 # use msm8952 LK configuration

USE_CLANG_PLATFORM_BUILD := true
TARGET_DISABLE_DASH := true

TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_NO_KERNEL := false
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive
TARGET_KERNEL_APPEND_DTB := true
BOARD_SECCOMP_POLICY := device/qcom/$(TARGET_BOARD_PLATFORM)$(TARGET_BOARD_SUFFIX)/seccomp

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
#MALLOC_IMPL := dlmalloc
MALLOC_SVELTE := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12530449408 # 12530465792 - 16384

BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Camera
USE_CAMERA_STUB := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL := true
#TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Workaround framework bluetooth dependency
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/qcom/common

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := false

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := true
TARGET_NO_RPC := true

# Enable CSVT
TARGET_USES_CSVT := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

BOARD_EGL_CFG := device/asus/Z010D/egl.cfg
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
# Add NON-HLOS files for ota upgrade
#ADD_RADIO_FILES := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/asus/Z010D/init/libinit_z010d.cpp

#add suffix variable to uniquely identify the board
TARGET_BOARD_SUFFIX := _64

#Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := device/qcom/common/cryptfs_hw

#Enable SW based full disk encryption
#TARGET_SWV8_DISK_ENCRYPTION := true

TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

# Enable sensor multi HAL
#USE_SENSOR_MULTI_HAL := true

FEATURE_QCRIL_UIM_SAP_SERVER_MODE := true

# Control flag between KM versions
TARGET_HW_KEYMASTER_V03 := true

#Enable peripheral manager
TARGET_PER_MGR_ENABLED := true

# Tap-to-Wake
TARGET_TAP_TO_WAKE_NODE := "/sys/bus/i2c/devices/i2c-5/5-0038/dclick_mode"

WITH_DEXPREOPT := false
ifneq ($(TARGET_BUILD_VARIANT),user)
  # Retain classes.dex in APK's for non-user builds
  DEX_PREOPT_DEFAULT := nostripping
endif

#enabling IMS for this target
TARGET_USES_IMS := true

SIM_COUNT := 2
