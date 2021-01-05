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

# Device path
DEVICE_PATH := device/sony/suzuran
SONY_ROOT   := device/sony/suzuran/recovery/root
TWRP_OUT    := recovery/root

# Ramdisk fstab file
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/twrp.fstab

# Prebuilt kernel
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilts/kernel:kernel

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Dalvik VM specific for devices with 2048 MB of RAM
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
