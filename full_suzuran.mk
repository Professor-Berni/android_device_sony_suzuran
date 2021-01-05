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

# Inherit device configurations
$(call inherit-product, device/sony/suzuran/device.mk)

# Device identification
PRODUCT_NAME   := lineage_suzuran
PRODUCT_MODEL  := Xperia Z5 Compact
PRODUCT_DEVICE := suzuran
PRODUCT_BRAND  := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_RELEASE_NAME := suzuran
SOMC_PLATFORM  := kitakami

# TWRP Сonfigurations
TW_THEME := portrait_hdpi
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_IGNORE_ABS_MT_TRACKING_ID := true
TWHAVE_SELINUX := true
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_NEW_ION_HEAP := true
TW_EXCLUDE_SUPERSU := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true

# The sysfs entry which controls the brightness
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
# Battery sensor
TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/battery"
# Temperature sensor (xo_therm)
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone25/temp"

# TWRP Storage
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_FUSE_EXFAT := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_NO_SEPARATE_RECOVERY := true

# TWRP Crypto
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/bootdevice/by-name/userdata"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
