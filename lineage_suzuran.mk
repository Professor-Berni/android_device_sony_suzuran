#
# Copyright (C) 2020 The LineageOS Project
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

$(call inherit-product, device/sony/suzuran/full_suzuran.mk)

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# This indicates the first api level, device has been commercially launched on.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_l_mr1.mk)

PRODUCT_NAME := lineage_suzuran

# Use the latest approved GMS identifiers

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=suzuran \
    BUILD_FINGERPRINT=Sony/E5823/E5823:7.1.1/32.4.A.1.54/3761073091:user/release-keys \
    PRIVATE_BUILD_DESC="E5823-user 7.1.1 32.4.A.1.54-3761073091 release-keys"
