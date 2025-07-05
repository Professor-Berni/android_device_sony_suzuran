#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/sony/kitakami-common',
    'hardware/qcom-caf/msm8994',
    'hardware/qcom-caf/wlan',
    'vendor/sony/kitakami-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib/libcammw.so': blob_fixup()
        .add_needed('libsensor_vendor.so')
        .add_needed('libshim_sensors.so'),
    (
        'vendor/lib/libmmcamera_hdr_gb_lib.so',
        'vendor/lib/libseemore.so',
        'vendor/lib/libsomc_alfortrsc.so',
        'vendor/lib/libsomc_alfort.so',
        'vendor/lib/libsomc_bordeauxrsc.so',
        'vendor/lib/libsomc_bordeaux.so',
        'vendor/lib/libsomc_canelersc.so',
        'vendor/lib/libsomc_canele.so',
        'vendor/lib/libsomc_chokoballcmn.so',
        'vendor/lib/libsomc_marblersc.so',
        'vendor/lib/libsomc_marble.so',
        'vendor/lib/libsomc_melonpanrsc.so',
        'vendor/lib/libsomc_melonpan.so',
        'vendor/lib/libsomc_mugichocorsc.so',
        'vendor/lib/libsomc_mugichoco.so',
        'vendor/lib/libsomc_raisinrsc.so',
        'vendor/lib/libsomc_raisin.so',
        'vendor/lib/libsomc_spicarsc.so',
        'vendor/lib/libsomc_spica.so',
        'vendor/lib/libsomc_topporsc.so',
        'vendor/lib/libsomc_toppo.so',
        'vendor/lib/libsomc_yummyrsc.so',
        'vendor/lib/libsomc_yummy.so',
        'vendor/lib/libsony_fooddetect.so',
        'vendor/lib/libsony_naruto.so',
    ): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    (
        'vendor/lib/libmmcamera2_stats_modules.so',
    ): blob_fixup()
        .remove_needed('libandroid.so'),
    (
        'vendor/lib/hw/camera.vendor.msm8994.so',
    ): blob_fixup()
        .remove_needed('libcamera_client.so')
        .remove_needed('libcamera_clientsemc.so')
        .remove_needed('libcamera_metadata.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'suzuran',
    'sony',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'kitakami-common', module.vendor)
    utils.run()
