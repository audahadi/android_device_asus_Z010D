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
$(call inherit-product-if-exists, vendor/asus/Z010D/Z010DD-vendor.mk)

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

PRODUCT_COPY_FILES += \
    device/asus/Z010D/audio/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fusion.magfield.max=250

PRODUCT_PACKAGES += \
    WCNSS_qcom_wlan_nv.bin

# Z010DD
PRODUCT_COPY_FILES += \
    device/asus/Z010D/Z010DD/kernel/boot.img:install/bin/boot.img

PRODUCT_COPY_FILES += \
    device/asus/Z010D/Z010DD/etc/prima/WCNSS_cfg.dat:install/bin/prima/WCNSS_cfg.dat \
    device/asus/Z010D/Z010DD/etc/prima/WCNSS_qcom_wlan_nv.bin:install/bin/prima/WCNSS_qcom_wlan_nv.bin \
    device/asus/Z010D/Z010DD/etc/wifi/WCNSS_qcom_cfg.ini:install/bin/wifi/WCNSS_qcom_cfg.ini

