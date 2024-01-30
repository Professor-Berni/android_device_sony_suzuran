#
# Copyright (C) 2020-2024 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from suzuran device
$(call inherit-product, device/sony/suzuran/device.mk)

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_BRAND        := Sony
PRODUCT_DEVICE       := suzuran
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL        := Xperia Z5 compact
PRODUCT_NAME         := lineage_suzuran
# Config: Allow opting out of EPPE
TARGET_DISABLE_EPPE  := true

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="E5823-user 7.1.1 32.4.A.1.54 3761073091 release-keys"

BUILD_FINGERPRINT := "Sony/E5823/E5823:7.1.1/32.4.A.1.54/3761073091:user/release-keys"

