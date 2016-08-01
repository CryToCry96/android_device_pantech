
# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common BlurOS stuff.
$(call inherit-product, vendor/bluros/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/bluros/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/pantech/ef50l/full_ef50l.mk)

BOARD_HARDWARE_CLASS := device/pantech/ef50l/cmhw/

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ef50l
PRODUCT_NAME := bluros_ef50l
PRODUCT_BRAND := Vega
PRODUCT_MODEL := IM-A850
PRODUCT_MANUFACTURER := Pantech

TARGET_DEVICE := ef50l


# Enable Torch
#PRODUCT_PACKAGES += Torch

