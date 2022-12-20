#
# Copyright (C) 2016 The CyanogenMod Project
#               2017-2018 The LineageOS Project
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

# Get common aspects
$(call inherit-product, device/sony/kitakami-common/device-common.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/sony/suzuran/suzuran-vendor.mk)

# AuroraServices
$(call inherit-product-if-exists, vendor/AuroraServices/AuroraServices-vendor.mk)

# AuroraServices permissions
PRODUCT_PACKAGES += \
		permissions_com.aurora.services.xml
		
# FDroid
$(call inherit-product-if-exists, vendor/fdroid/fdroid-vendor.mk)

# FDroid permissions
PRODUCT_PACKAGES += \
    privapp_whitelist_org.fdroid.fdroid.privileged.xml

# Since microG and GApps can't coexist, you NEED to choose whether you build for microG OR GApps.
# Set "export WITH_MICROG="true"" to build for microG OR "export WITH_MICROG="false"" to build for GApps.
# This can be done i.e. in your build script.

ifeq ($(WITH_MICROG),true)

# microG
$(call inherit-product-if-exists, vendor/microG/microG-vendor.mk)

# microG permissions
PRODUCT_PACKAGES += \
		privapp-permissions-com.android.vending.xml \
		privapp-permissions-com.google.android.gms.xml

endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
# Tweak density, if not set yet:
TARGET_SCREEN_DENSITY ?= 280

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/bin/init.qcom.power.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/init.qcom.power.sh

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/clearpad.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/clearpad.idc

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_SYSTEM)/etc/sec_config

# NFC configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/dsi_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/netmgr_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/qmi_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/data/qmi_config.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/thermal-engine.conf

# WLAN
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wlan/bcmdhd.cal:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/bcmdhd/bcmdhd.cal
