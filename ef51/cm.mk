
# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/pantech/ef51/full_ef51.mk)

BOARD_HARDWARE_CLASS := device/pantech/ef51/cmhw/

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ef51
PRODUCT_NAME := cm_ef51
PRODUCT_BRAND := Vega
PRODUCT_MODEL := IM-A860
PRODUCT_MANUFACTURER := Pantech

TARGET_DEVICE := ef51


# Enable Torch
#PRODUCT_PACKAGES += Torch

