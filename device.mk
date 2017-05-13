TARGET_USES_QCOM_BSP := true

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

TARGET_USES_AOSP := true

DEVICE_PACKAGE_OVERLAYS := device/asus/Z010D/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc \
    ueventd.device.rc

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

#for android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# Enable features in video HAL that can compile only on this platform
TARGET_USES_MEDIA_EXTENSIONS := true

TARGET_USES_NQ_NFC := false

PRODUCT_PROPERTY_OVERRIDES += \
           dalvik.vm.heapgrowthlimit=128m

$(call inherit-product, device/qcom/msm8916-common/msm8916.mk)

PRODUCT_PACKAGES += telephony-ext
PRODUCT_PACKAGES += libGLES_android

PRODUCT_BOOT_JARS += qcom.fmradio
PRODUCT_BOOT_JARS += tcmiface
PRODUCT_BOOT_JARS += telephony-ext

# Audio configuration
PRODUCT_COPY_FILES += \
    device/asus/Z010D/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    device/asus/Z010D/audio/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    device/asus/Z010D/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/asus/Z010D/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/asus/Z010D/audio/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml

# Voice recognition
PRODUCT_COPY_FILES += \
    device/asus/Z010D/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    device/asus/Z010D/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

# acdbdata
PRODUCT_COPY_FILES += \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_Bluetooth_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_General_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_General_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_Global_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_Global_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_Handset_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_Handset_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_Hdmi_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_Headset_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_Headset_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MP/MTP_MP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MP/MTP_MP_Speaker_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Bluetooth_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_General_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_General_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Global_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Global_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Handset_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Handset_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Hdmi_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Hdmi_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Headset_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Headset_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Speaker_cal.acdb:system/etc/acdbdata/MTP/msm8939-tapan-snd-card/MTP_WCD9306_Speaker_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
    device/asus/Z010D/audio/acdbdata/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Keylayout
PRODUCT_COPY_FILES += \
    device/asus/Z010D/keylayout/focal-touchscreen.kl:system/usr/keylayout/focal-touchscreen.kl \
    device/asus/Z010D/keylayout/focal-touchscreen.idc:system/usr/idc/focal-touchscreen.idc

# Camera
PRODUCT_PACKAGES += \
    camera.msm8916 \
    libshims_camera

# DRM
PRODUCT_PACKAGES += \
     libshims_wvm

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=0

PRODUCT_PACKAGES += wcnss_service

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
		p2p_supplicant_overlay.conf

# Wifi
PRODUCT_COPY_FILES += \
    kernel/asus/msm8916/drivers/staging/prima/firmware_bin/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    kernel/asus/msm8916/drivers/staging/prima/firmware_bin/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/asus/Z010D/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/persistent

GMS_ENABLE_OPTIONAL_MODULES := false

# call the proprietary setup
$(call inherit-product-if-exists, vendor/asus/Z010D/Z010D-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
