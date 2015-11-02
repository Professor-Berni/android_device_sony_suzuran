#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product, device/sony/sumire/full_sumire.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

PRODUCT_NAME := cm_sumire
BOARD_VENDOR := sony
TARGET_VENDOR := sony
PRODUCT_DEVICE := sumire

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sumire \
    BUILD_FINGERPRINT=Sony/sumire/sumire:6.0/KITAKAMI-2.1.1-160226-0810/1:user/dev-keys \
    PRIVATE_BUILD_DESC="sumire-user 6.0 KITAKAMI-2.1.1-160226-0810 1 dev-keys"
