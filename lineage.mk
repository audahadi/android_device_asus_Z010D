# Inherit from device specific
$(call inherit-product, device/asus/Z010D/full_Z010D.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/msm8916-common/overlay/lineage

PRODUCT_NAME := lineage_Z010D
PRODUCT_DEVICE := Z010D
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone Max
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus
