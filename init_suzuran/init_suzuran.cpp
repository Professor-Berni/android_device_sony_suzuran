/*
 * Copyright (C) 2008 The Android Open Source Project
 * Copyright (C) 2014 The CyanogenMod Project
 * Copyright (C) 2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdlib.h>

#include <android-base/logging.h>

#include <fcntl.h>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <unistd.h>
#include <sys/stat.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/types.h>

#include "vendor_init.h"
#include "property_service.h"
#include "util.h"

using android::init::ImportKernelCmdline;

constexpr auto LTALABEL_PATH = "/lta-label/pages/menu.htm";

void property_override(char const prop[], char const value[], bool add = true)
{
    auto pi = (prop_info *) __system_property_find(prop);

    if (pi != nullptr) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void property_override_triple(char const product_prop[], char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(product_prop, value);
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

static void import_kernel_nv(const std::string& key,
        const std::string& value, bool for_emulator __attribute__((unused)))
{
    if (key.empty()) return;

    if (std::ifstream file = std::ifstream(LTALABEL_PATH, std::ios::binary)) {
        std::string str((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
        size_t offset = str.find("Model: ");

        if (offset != std::string::npos) {
            std::string model = str.substr(offset + strlen("Model: "), 5);
            property_override("ro.semc.product.model", model.c_str());
            property_override_triple("ro.product.model", "ro.product.system.model", "ro.product.vendor.model", model.c_str());
            property_override_triple("ro.product.name", "ro.product.system.name", "ro.product.vendor.name", model.c_str());
        }
    }

    if (key == "oemandroidboot.phoneid") {
        // Dual Sim variant contains two IMEIs separated by comma.
        if ((count(value.begin(), value.end(),',')) > 0) {
            property_override("persist.multisim.config", "dsds");
            property_override("persist.radio.multisim.config", "dsds");
            property_override("ro.telephony.default_network", "9,1");
        } else {
            property_override("ro.telephony.default_network", "9");
        }
    }
}

void vendor_load_properties()
{
    ImportKernelCmdline([&](const std::string& key, const std::string& value) {
        import_kernel_nv(key, value, false);
    });
}
