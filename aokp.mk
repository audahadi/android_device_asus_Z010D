# Inherit from device specific
$(call inherit-product, device/asus/Z010D/full_Z010D.mk)

# Inherit some common AOKP stuff.
$(call inherit-product, vendor/aokp/configs/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/msm8916-common/overlay/aokp

PRODUCT_NAME := aokp_Z010D
PRODUCT_DEVICE := Z010D
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone Max
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus
