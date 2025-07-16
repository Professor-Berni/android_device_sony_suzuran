#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
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
    (
        'vendor/lib/libcammw.so',
    ): blob_fixup()
        .add_needed('libsensor_vendor.so')
        .add_needed('libshim_sensors.so')
        .replace_needed('libmemalloc.so', 'libmemalloc_vendor.so'),
    (
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
        .add_needed('liblog.so')
        .replace_needed('libandroid.so', 'libandroid_vendor.so'),
    (
        'vendor/lib/hw/camera.vendor.msm8994.so',
    ): blob_fixup()
        .remove_needed('libcamera_client.so')
        .remove_needed('libcamera_clientsemc.so')
        .remove_needed('libcamera_metadata.so'),
    (
        'vendor/bin/mm-qcamera-daemon',
        'vendor/lib64/libidd.so',
        'vendor/lib64/libmmcamera2_q3a_core.so',
        'vendor/lib64/libmmcamera2_stats_algorithm.so',
        'vendor/lib64/libQSEEComAPI.so',
        'vendor/lib/libidd.so',
        'vendor/lib/libjpegdhw.so',
        'vendor/lib/libjpegdmahw.so',
        'vendor/lib/libjpegehw.so',
        'vendor/lib/libmmcamera2_c2d_module.so',
        'vendor/lib/libmmcamera2_cpp_module.so',
        'vendor/lib/libmmcamera2_frame_algorithm.so',
        'vendor/lib/libmmcamera2_isp_modules.so',
        'vendor/lib/libmmcamera2_is.so',
        'vendor/lib/libmmcamera2_pp_buf_mgr.so',
        'vendor/lib/libmmcamera2_q3a_core.so',
        'vendor/lib/libmmcamera2_stats_algorithm.so',
        'vendor/lib/libmmcamera2_vpe_module.so',
        'vendor/lib/libmmcamera_cac2_lib.so',
        'vendor/lib/libmmcamera_eztune_module.so',
        'vendor/lib/libmmcamera_isp_abf44.so',
        'vendor/lib/libmmcamera_isp_bcc44.so',
        'vendor/lib/libmmcamera_isp_be_stats44.so',
        'vendor/lib/libmmcamera_isp_bf_scale_stats46.so',
        'vendor/lib/libmmcamera_isp_bf_stats44.so',
        'vendor/lib/libmmcamera_isp_bg_stats46.so',
        'vendor/lib/libmmcamera_isp_bhist_stats44.so',
        'vendor/lib/libmmcamera_isp_bpc44.so',
        'vendor/lib/libmmcamera_isp_chroma_enhan40.so',
        'vendor/lib/libmmcamera_isp_chroma_suppress40.so',
        'vendor/lib/libmmcamera_isp_clamp_encoder40.so',
        'vendor/lib/libmmcamera_isp_clamp_video40.so',
        'vendor/lib/libmmcamera_isp_clamp_viewfinder40.so',
        'vendor/lib/libmmcamera_isp_clf46.so',
        'vendor/lib/libmmcamera_isp_color_correct46.so',
        'vendor/lib/libmmcamera_isp_color_xform_encoder46.so',
        'vendor/lib/libmmcamera_isp_color_xform_video46.so',
        'vendor/lib/libmmcamera_isp_color_xform_viewfinder46.so',
        'vendor/lib/libmmcamera_isp_cs_stats46.so',
        'vendor/lib/libmmcamera_isp_demosaic44.so',
        'vendor/lib/libmmcamera_isp_demux40.so',
        'vendor/lib/libmmcamera_isp_fovcrop_encoder46.so',
        'vendor/lib/libmmcamera_isp_fovcrop_video46.so',
        'vendor/lib/libmmcamera_isp_fovcrop_viewfinder46.so',
        'vendor/lib/libmmcamera_isp_gamma44.so',
        'vendor/lib/libmmcamera_isp_gic46.so',
        'vendor/lib/libmmcamera_isp_gtm46.so',
        'vendor/lib/libmmcamera_isp_hdr46.so',
        'vendor/lib/libmmcamera_isp_hdr_be_stats46.so',
        'vendor/lib/libmmcamera_isp_ihist_stats46.so',
        'vendor/lib/libmmcamera_isp_linearization40.so',
        'vendor/lib/libmmcamera_isp_ltm44.so',
        'vendor/lib/libmmcamera_isp_mce40.so',
        'vendor/lib/libmmcamera_isp_mesh_rolloff44.so',
        'vendor/lib/libmmcamera_isp_pedestal_correct46.so',
        'vendor/lib/libmmcamera_isp_rs_stats46.so',
        'vendor/lib/libmmcamera_isp_scaler_encoder46.so',
        'vendor/lib/libmmcamera_isp_scaler_video46.so',
        'vendor/lib/libmmcamera_isp_scaler_viewfinder46.so',
        'vendor/lib/libmmcamera_isp_sce40.so',
        'vendor/lib/libmmcamera_isp_sub_module.so',
        'vendor/lib/libmmcamera_isp_wb46.so',
        'vendor/lib/libmmcamera_pdafcamif.so',
        'vendor/lib/libmmcamera_pdaf.so',
        'vendor/lib/libmmcamera_pdaf_v3.so',
        'vendor/lib/libmmcamera_ppbase_module.so',
        'vendor/lib/libmmcamera_tintless_bg_pca_algo.so',
        'vendor/lib/libmmcamera_vpu_module.so',
        'vendor/lib/libmm-qcamera.so',
        'vendor/lib/libois_lc898122.so',
        'vendor/lib/libqomx_core.so',
        'vendor/lib/libqomx_jpegdec.so',
        'vendor/lib/libqomx_jpegenc_pipe.so',
        'vendor/lib/libqomx_jpegenc.so',
        'vendor/lib/libQSEEComAPI.so',
    ): blob_fixup()
        .add_needed('liblog.so'),
    (
        'vendor/lib/libsomc_chokoballpal.so',
    ): blob_fixup()
        .add_needed('libshims_GraphicBuffer.so'),
    (
        'vendor/lib64/lib-sec-disp.so',
        'vendor/lib/lib-sec-disp.so',
    ): blob_fixup()
        .add_needed('libgui_vendor.so'),
    (
        'vendor/lib/libcacao_client.so',
    ): blob_fixup()
        .add_needed('liblog.so')
        .add_needed('libbinder_vendor.so'),
    (
        'vendor/lib64/libandroid_vendor.so',
        'vendor/lib/libandroid_vendor.so',
    ): blob_fixup()
        .remove_needed('libandroidfw.so')
        .remove_needed('libandroid_runtime.so')
        .remove_needed('libinput.so')
        .remove_needed('libnetd_client.so'),
    (
        'vendor/lib/libcacao_service.so',
    ): blob_fixup()
        .add_needed('liblog.so')
        .add_needed('libbinder_shim.so'),
    (
        'vendor/lib/libmmcamera_faceproc.so',
    ): blob_fixup()
        .replace_needed('libc.so', 'libc_vendor.so'),
    (
        'vendor/lib/libmmcamera_hdr_gb_lib.so',
    ): blob_fixup()
        .add_needed('liblog.so')
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
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
