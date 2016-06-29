#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, vendor/pantech/ef50l/ef50l-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/pantech/ef50l/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Camera
#PRODUCT_PACKAGES += \
#    camera.msm8960

# Lights
PRODUCT_PACKAGES += \
	lights.msm8960


# MSM8960/MPQ8064 firmware
PRODUCT_COPY_FILES += \
    device/pantech/ef50l/firmware/cyttsp_8064_mtp.hex:/system/etc/firmware/cyttsp_8064_mtp.hex \
    device/pantech/ef50l/firmware/cyttsp_8960_cdp.hex:/system/etc/firmware/cyttsp_8960_cdp.hex \
    device/pantech/ef50l/firmware/leia_pfp_470.fw:/system/etc/firmware/leia_pfp_470.fw \
    device/pantech/ef50l/firmware/leia_pm4_470.fw:/system/etc/firmware/leia_pm4_470.fw \
    device/pantech/ef50l/firmware/vidc_1080p.fw:/system/etc/firmware/vidc_1080p.fw \
    device/pantech/ef50l/firmware/vidc.b00:/system/etc/firmware/vidc.b00 \
    device/pantech/ef50l/firmware/vidc.b01:/system/etc/firmware/vidc.b01 \
    device/pantech/ef50l/firmware/vidc.b02:/system/etc/firmware/vidc.b02 \
    device/pantech/ef50l/firmware/vidc.b03:/system/etc/firmware/vidc.b03 \
    device/pantech/ef50l/firmware/vidcfw.elf:/system/etc/firmware/vidcfw.elf \
    device/pantech/ef50l/firmware/vidc.mdt:/system/etc/firmware/vidc.mdt \
    device/pantech/ef50l/firmware/libpn544_fw.so:/system/vendor/firmware/libpn544_fw.so \
# keylayout
PRODUCT_COPY_FILES += \
	device/pantech/ef50l/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/pantech/ef50l/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	device/pantech/ef50l/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/pantech/ef50l/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/pantech/ef50l/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	#device/pantech/ef50l/keylayout/stmicro_fts_ts.kl:system/usr/keylayout/stmicro_fts_ts.kl \
	#device/pantech/ef50l/keylayout/atmel_mxt_540s.kl:system/usr/keylayout/atmel_mxt_540s.kl \


# keychars
PRODUCT_COPY_FILES += \
	device/pantech/ef50l/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
	device/pantech/ef50l/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
	device/pantech/ef50l/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
	device/pantech/ef50l/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# idc
PRODUCT_COPY_FILES += \
	device/pantech/ef50l/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
	device/pantech/ef50l/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    
PRODUCT_PACKAGES += \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_COPY_FILES += \
	device/pantech/ef50l/thermald/thermald.conf:system/etc/thermald.conf \
	device/pantech/ef50l/thermald/thermal-engine-8064.conf:system/etc/thermal-engine-8064.conf


#Product info
ifdef AICP_ROM
PRODUCT_PROPERTY_OVERRIDES += \
	ro.device.chipset=APQ8064T \
	ro.device.gpu=Adreno-320 \
	ro.device.front_cam=2Mpx \
	ro.device.rear_cam=13Mpx \
	ro.device.screen_res=1080x1920 \
	ro.aicp.maintainer=Lê_Hoàng<l.hoang87@live.com>
endif

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Inherit from msm8974-common
$(call inherit-product, device/pantech/msm8960-common/msm8960.mk)
