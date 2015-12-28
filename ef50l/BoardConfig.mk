# Copyright (C) 2014 The Android Open Source Project
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

-include device/pantech/msm8960-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/pantech/ef50l/BoardConfigVendor.mk


TARGET_KERNEL_SOURCE := ../Pantech/kernel_ef50
TARGET_KERNEL_CONFIG := cm_ef50l_defconfig
#TARGET_PREBUILT_KERNEL :=

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/pantech/ef50l/init/init_ef50l.cpp

BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760 #10MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760 #10MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1468006400 #1.36GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12413025280 #11.6GB
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := ef50l,ef49k,ef48s

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/pantech/ef50l/bluetooth


#TARGET_ENABLE_NON_PIE_SUPPORT := true

#TWRP screen config
DEVICE_RESOLUTION := 720x1280
