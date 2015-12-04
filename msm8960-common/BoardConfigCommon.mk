#
# Copyright (C) 2013 The CyanogenMod Project
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

BOARD_VENDOR 					:= pantech

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

TARGET_USES_LOGD := false

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
BOARD_KERNEL_CMDLINE := console=NULL,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 loglevel=0 vmalloc=0x16000000 maxcpus=2 androidboot.selinux=permissive
# QCOM
#BOARD_USES_QCOM_HARDWARE 		:= true
TARGET_USES_QCOM_BSP 			:= true
TARGET_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
TARGET_GLOBAL_CPPFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
USE_TUNNEL_MODE := true
#USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY 	:= true
#USE_SENSOR_MULTI_HAL			:= true
#Disable for fix camera record
#TARGET_GLOBAL_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_USES_LEGACY_MMAP := true

# Graphics
#BOARD_EGL_CFG := device/pantech/msm8960-common/configs/egl.cfg
BOARD_USES_OVERLAY 				:= true
USE_OPENGL_RENDERER 				:= true
TARGET_USES_ION					:= true
TARGET_USES_C2D_COMPOSITION 			:= true
#TARGET_USES_OVERLAY 				:= true
#TARGET_USES_SF_BYPASS 				:= true
#Display
#TARGET_QCOM_DISPLAY_VARIANT 		:= caf
#TARGET_DISPLAY_USE_RETIRE_FENCE 	:= true
#TARGET_DISPLAY_INSECURE_MM_HEAP 	:= true

HAVE_ADRENO_SOURCE				:= false
OVERRIDE_RS_DRIVER 				:= libRSDriver_adreno.so
#TARGET_USE_COMPAT_GRALLOC_PERFORM 		:= true

# Audio
#TARGET_QCOM_AUDIO_VARIANT 		:= caf
BOARD_USES_ALSA_AUDIO			:= true
BOARD_HAVE_LOW_LATENCY_AUDIO 		:= true
#Audio UCM
#BOARD_USES_LEGACY_ALSA_AUDIO		:= true
#USE_LEGACY_AUDIO_POLICY := 1
#QCOM_ADSP_SSR_ENABLED := true

# Media
#TARGET_QCOM_MEDIA_VARIANT 		:= caf

#Fix youtube playback
TARGET_NO_ADAPTIVE_PLAYBACK := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS 	:= true

BOARD_USES_SECURE_SERVICES 		:= true

#BOARD_USES_EXTRA_THERMAL_SENSOR 	:= true

BOARD_USES_CAMERA_FAST_AUTOFOCUS 	:= true
# Camera
USE_DEVICE_SPECIFIC_CAMERA 			:= true

#Use cyanogenmod hardware
BOARD_USES_CYANOGEN_HARDWARE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH 			:= true
BOARD_HAVE_BLUETOOTH_QCOM 		:= true
BLUETOOTH_HCI_USE_MCT 			:= true

#Preload Boot Animation
TARGET_BOOTANIMATION_PRELOAD 		:= true

# GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
TARGET_NO_RPC := true
TARGET_PROVIDES_GPS_LOC_API := true

# PowerHAL
TARGET_POWERHAL_VARIANT			:= qcom
CM_POWERHAL_EXTENSION			:= lehoang

# LightHAL
TARGET_PROVIDES_LIBLIGHT 			:= true

WITH_EXFAT := true

# Enable WEBGL in WebKit
ENABLE_WEBGL 					:= true

# Webkit
TARGET_FORCE_CPU_UPLOAD 			:= true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND 		:= true
BOARD_CHARGER_SHOW_PERCENTAGE	:= true

# Enable keymaster app checking
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

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

TARGET_GCC_VERSION_EXP := 4.8
KERNEL_TOOLCHAIN_PREFIX := arm-cortex_a15-linux-gnueabihf-
KERNEL_TOOLCHAIN := "$(ANDROID_BUILD_TOP)/../arm-cortex_a15-linux-gnueabihf-linaro_4.9/bin"
#-include device/pantech/msm8960-common/sm.mk
#include device/pantech/msm8960-common/gcc_config.mk
