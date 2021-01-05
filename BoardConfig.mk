#
# Copyright 2015 The Android Open Source Project
# Copyright (C) 2017-2021 The LineageOS Project
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

# Board device path
DEVICE_PATH := device/sony/suzuran

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := E5823

# Platform
TARGET_BOARD_PLATFORM := msm8994
TARGET_BOARD_PLATFORM_GPU := qcom-adreno430

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53.a57

TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_NO_RECOVERY := false
TARGET_NO_KERNEL := false

# Kernel properties
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_VERSION := 3.10
BOARD_KERNEL_IMAGE_NAME := kernel
# Kernel file
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel

# Kernel configurations
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Kernel cmdline
BOARD_KERNEL_CMDLINE += console=ttyHSL0,115200,n8
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom user_debug=31
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 boot_cpus=0-5
BOARD_KERNEL_CMDLINE += zram.backend=z3fold coherent_pool=2M
BOARD_KERNEL_CMDLINE += dwc3_msm.prop_chg_detect=Y dwc3_msm.hvdcp_max_current=1500
BOARD_KERNEL_CMDLINE += buildvariant=userdebug enforcing=0 androidboot.selinux=permissive

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 202211328
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5257383936
# Reserve space for data encryption (24239296512-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 24239280128

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Fixup SELinux file labels
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Recovery
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true

# Recovery blobs
TARGET_RECOVERY_DEVICE_MODULES := libbinder libgui libui libEGL libGLESv2 libprotobuf-cpp-lite libsync
TW_RECOVERY_ADDITIONAL_RELINK_FILES := \
    $(OUT)/system/lib64/libbinder.so \
    $(OUT)/system/lib64/libgui.so \
    $(OUT)/system/lib64/libui.so \
    $(OUT)/system/lib64/libEGL.so \
    $(OUT)/system/lib64/libGLESv2.so \
    $(OUT)/system/lib64/libprotobuf-cpp-lite.so \
    $(OUT)/system/lib64/libsync.so
