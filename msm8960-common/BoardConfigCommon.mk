#
# Copyright (C) 2016 XDAVN
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
# inherit from the proprietary version
-include vendor/pantech/msm8960-common/BoardConfigVendor.mk
TARGET_SPECIFIC_HEADER_PATH 		:= device/pantech/msm8960-common/include
TARGET_RELEASETOOLS_EXTENSIONS 		:= device/pantech/msm8960-common

BOARD_VENDOR 					:= pantech

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

#TARGET_USES_LOGD := false

#USE_CLANG_PLATFORM_BUILD := true

TARGET_NO_BOOTLOADER 				:= true
TARGET_NO_RADIOIMAGE 				:= true
TARGET_BOARD_PLATFORM 				:= msm8960
TARGET_BOOTLOADER_BOARD_NAME			:= MSM8960
#TARGET_BOARD_PLATFORM_GPU 			:= qcom-adreno320

# Wifi
BOARD_HAS_QCOM_WLAN              		:= true
BOARD_WLAN_DEVICE                		:= qcwcn
WPA_SUPPLICANT_VERSION           		:= VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      		:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 		:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             		:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB        		:= lib_driver_cmd_$(BOARD_WLAN_DEVICE)
#WIFI_DRIVER_MODULE_PATH          		:= "/system/lib/modules/wlan.ko" #disable this because kernel have include driver
WIFI_DRIVER_MODULE_NAME          		:= "wlan"
WIFI_DRIVER_FW_PATH_STA          		:= "sta"
WIFI_DRIVER_FW_PATH_AP           		:= "ap"
#TARGET_USES_QCOM_WCNSS_QMI       := true
#TARGET_PROVIDES_WCNSS_QMI        := true
#TARGET_USES_WCNSS_MAC_ADDR_REV   := true


#Boot and recovery config
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FORCE_RAMDISK_ADDRESS := 0x82200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x2000000#0x82200000 change for new mkbootimg tool
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom androidboot.selinux=permissive lpj=67677 user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 zcache

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SUPPRESS_EMMC_WIPE := true

# QCOM
BOARD_USES_QCOM_HARDWARE 		:= true
TARGET_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
TARGET_GLOBAL_CPPFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
#Disable for fix camera record
#TARGET_GLOBAL_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
#BOARD_USES_LEGACY_MMAP := true

# Graphics
BOARD_USES_OVERLAY 				:= true
USE_OPENGL_RENDERER 				:= true
TARGET_USES_ION					:= true
TARGET_USES_C2D_COMPOSITION 			:= true
TARGET_DISPLAY_INSECURE_MM_HEAP 	:= true

# LightHAL
TARGET_PROVIDES_LIBLIGHT 			:= true

HAVE_ADRENO_SOURCE				:= false
OVERRIDE_RS_DRIVER 				:= libRSDriver_adreno.so
#TARGET_USE_COMPAT_GRALLOC_PERFORM 		:= true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
USE_CUSTOM_AUDIO_POLICY := 1


# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS 	:= true

BOARD_USES_SECURE_SERVICES 		:= true

BOARD_USES_EXTRA_THERMAL_SENSOR 	:= true

# Camera
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_GLOBAL_CFLAGS += -DPANTECH_CAMERA_HARDWARE
BOARD_USES_CAMERA_FAST_AUTOFOCUS 	:= true

#Ril class
BOARD_RIL_CLASS := ../../../device/pantech/msm8960-common/ril/

#Use cyanogenmod hardware
BOARD_USES_CYANOGEN_HARDWARE := true


#Preload Boot Animation
TARGET_BOOTANIMATION_PRELOAD 		:= true

# GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true
TARGET_PROVIDES_GPS_LOC_API := true

# PowerHAL
TARGET_POWERHAL_VARIANT			:= qcom
#CM_POWERHAL_EXTENSION			:= lehoang

# Enable WEBGL in WebKit
#ENABLE_WEBGL 					:= true

# Webkit
#TARGET_FORCE_CPU_UPLOAD 			:= true

# Init
TARGET_NO_INITLOGO := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND 		:= false

# Enable keymaster app checking
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_MAX_PARTITIONS := 28

TARGET_RECOVERY_QCOM_RTC_FIX 			:= true
BOARD_SUPPRESS_SECURE_ERASE 			:= true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=7

# Encryption
TARGET_HW_DISK_ENCRYPTION := false

TARGET_NO_SD_ADOPT_ENCRYPTION := true

#BOARD_USES_QC_TIME_SERVICES 		:= true

PRODUCT_GMS_CLIENTID_BASE 			:= android-pantech
# Enable Minikin text layout engine
USE_MINIKIN 						:= true

#Enable prebuild chromium for cut time build
PRODUCT_PREBUILT_WEBVIEWCHROMIUM 	:= yes

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT 			:= true


# qcom sepolicy
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
       device/pantech/msm8960-common/sepolicy

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true
TW_FLASH_FROM_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
