#
# Copyright (C) 2016 The CyanogenMod Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),sumire)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

ADSP_IMAGES := \
    adsp.b00 adsp.b01 adsp.b02 adsp.b03 adsp.b04 adsp.b05 adsp.b06 adsp.b07 \
    adsp.b08 adsp.b09 adsp.b10 adsp.b11 adsp.b12 adsp.b13 adsp.b14 adsp.b15 adsp.mdt

ADSP_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(ADSP_IMAGES)))
$(ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "ADSP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(ADSP_SYMLINKS)

CPE_IMAGES := \
    cpe.b02 cpe.b04 cpe.b05 cpe.b06 cpe.b08 cpe.b10 cpe.b11 \
    cpe.b12 cpe.b14 cpe.b16 cpe.b18 cpe.b20 cpe.b21 cpe.mdt \

CPE_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(CPE_IMAGES)))
$(CPE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CPE firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CPE_SYMLINKS)

KM_IMAGES := \
    keymaste.b00 keymaste.b01 keymaste.b02 keymaste.b03 keymaste.mdt

KM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(KM_IMAGES)))
$(KM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Keymaster firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(KM_SYMLINKS)

KMOTA_IMAGES := \
    kmota.b00 kmota.b01 kmota.b02 kmota.b03 kmota.mdt

KMOTA_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(KMOTA_IMAGES)))
$(KMOTA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "KMOTA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(KMOTA_SYMLINKS)

MBA_IMAGES := \
    mba.b00 mba.mdt

MBA_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(MBA_IMAGES)))
$(MBA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MBA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MBA_SYMLINKS)

MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b03 modem.b04 modem.b05 \
    modem.b06 modem.b07 modem.b08 modem.b09 modem.b10 \
    modem.b11 modem.b12 modem.b13 modem.b14 modem.b18 \
    modem.b19 modem.b20 modem.b22 modem.mdt

MODEM_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(MODEM_IMAGES)))
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MODEM_SYMLINKS)

# Create links for audcal data files
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wcd9320; \
	ln -sf /data/misc/audio/mbhc.bin \
		$(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_mbhc.bin; \
	ln -sf /data/misc/audio/wcd9320_anc.bin \
		$(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_anc.bin;\
	ln -sf /data/misc/audio/wcd9320_mad_audio.bin \
		$(TARGET_OUT_ETC)/firmware/wcd9320/wcd9320_mad_audio.bin)

endif
