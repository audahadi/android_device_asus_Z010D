#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# call the proprietary setup
$(call inherit-product-if-exists, vendor/asus/Z010D/Z010D-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/asus/Z010D/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit from msm8916-common
$(call inherit-product, device/asus/msm8916-common/msm8916.mk)

PRODUCT_PACKAGES += \
    init.target.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    device/asus/Z010D/audio/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml
		
# Keylayout
PRODUCT_COPY_FILES += \
    device/asus/Z010D/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/Z010D/keylayout/focal-touchscreen.kl:system/usr/keylayout/focal-touchscreen.kl \
    device/asus/Z010D/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    device/asus/Z010D/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/Z010D/keylayout/i-rocks_Bluetooth_Keyboard.kl:system/usr/keylayout/i-rocks_Bluetooth_Keyboard.kl \
    device/asus/Z010D/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    device/asus/Z010D/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl
