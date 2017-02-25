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

# inherit from common msm8660
-include device/samsung/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/quincydcm/BoardConfigVendor.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := SC-05D,quincydcm

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/quincydcm/bluetooth

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF

# Kernel
BOARD_KERNEL_BASE := 0x48000000
TWRP_RECOVERY:= false
ifeq ($(TWRP_RECOVERY),true)
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom usb_id_pin_rework=true no_console_suspend=true androidboot.selinux=permissive
else
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom usb_id_pin_rework=true no_console_suspend=true
endif
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000
TARGET_KERNEL_CONFIG := quincydcm_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/msm8660-common
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 627048448
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2149580800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 20044316672

# Recovery
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
TARGET_USERIMAGES_USE_EXT4 := true
ifeq ($(TWRP_RECOVERY),true)
TARGET_RECOVERY_FSTAB := device/samsung/quincydcm/recovery/twrp.fstab
else
TARGET_RECOVERY_FSTAB := device/samsung/quincydcm/rootdir/etc/fstab.qcom
endif

# Graphics
USE_OPENGL_RENDERER := true

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/quincydcm/sepolicy

# TWRP
DEVICE_RESOLUTION := 800x1280
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/devices/platform/msm_fb.524801/leds/lcd-backlight/brightness
