#
# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from pantech common
#-include device/pantech/common/BoardConfigCommon.mk

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/pantech/ef63s/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Build with Clang by default
USE_CLANG_PLATFORM_BUILD := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Assert
TARGET_OTA_ASSERT_DEVICE := ef63s,ef63k,ef63l,IM-A910S,IM-A910K,IM-A910L

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/pantech/ef63s/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=NULL,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=260M loglevel=0 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x1000000 --tags_offset 0x00000100
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := ef63s_defconfig
TARGET_KERNEL_SOURCE := kernel/pantech/ef63-common
CM_DTS_TARGET := 910

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/ef63s/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true

# Board
BOARD_VENDOR := pantech

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DPANTECH_CAMERA_HARDWARE -DCAMERA_VENDOR_L_COMPAT

# Charger
BOARD_CHARGER_RES := device/pantech/ef63s/charger/images

# CM Hardware
BOARD_HARDWARE_CLASS := device/pantech/ef63s/cmhw

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1073741824
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13747929088 # 13747945472 - 16384 for crypto footer
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Graphics
HAVE_ADRENO_SOURCE := false
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 2500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 0000000

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Protobuf: Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON       := true
BOARD_HAS_LARGE_FILESYSTEM       := true
BOARD_RECOVERY_ALWAYS_WIPES      := true
BOARD_RECOVERY_HANDLES_MOUNT     := true
BOARD_RECOVERY_SWIPE             := true
BOARD_SUPPRESS_EMMC_WIPE         := true
BOARD_SUPPRESS_SECURE_ERASE      := true
BOARD_USE_CUSTOM_RECOVERY_FONT   := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS              := true
RECOVERY_FSTAB_VERSION           := 2
TARGET_RECOVERY_FSTAB            := device/pantech/ef63s/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT     := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4       := true

# Recovery TW
-include device/pantech/ef63s/twr.mk

PRODUCT_BUILD_PROP_OVERRIDES     += BUILD_UTC_DATE=0

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/pantech/ef63s/releasetools

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# QCOM Power
TARGET_POWERHAL_VARIANT := qcom

# QCRIL
TARGET_RIL_VARIANT := caf

# Time
BOARD_USES_QC_TIME_SERVICES := true

#GPS
TARGET_GPS_HAL_PATH := device/pantech/ef63s/gps
TARGET_NO_RPC := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

#WITH_DEXPREOPT := true

# SELinux policies
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
        device/pantech/ef63s/sepolicy

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/pantech/ef63s/init/init_ef63s.cpp

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# inherit from the proprietary version
-include vendor/pantech/ef63s/BoardConfigVendor.mk
