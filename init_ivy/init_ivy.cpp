/*
 * Copyright (C) 2008 The Android Open Source Project
 * Copyright (C) 2014 The CyanogenMod Project
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

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"


static void import_kernel_nv(const std::string& key,
        const std::string& value, bool for_emulator __attribute__((unused))) 
{
    if (key.empty()) return;

    if (key == "oemandroidboot.phoneid") {
	//Dual Sim variant contains two IMEIs separated by comma.
        if ((count(value.begin(), value.end(),',')) > 0) { 
                property_set("persist.multisim.config", "dsds");
                property_set("persist.radio.multisim.config", "dsds");
                property_set("ro.telephony.default_network", "9,1");
                property_set("ro.semc.product.model", "E6533");
                property_set("ro.semc.product.name", "Xperia Z3+ Dual");
                property_set("ro.product.model", "E6533");
                property_set("ro.product.name", "ivy_dsds");
                property_set("ro.product.device", "ivy_dsds");
                property_set("ro.build.description", "ivy_dsds-user 7.0 KITAKAMI-2.2.0-170105-0147 1 dev-keys");
                property_set("ro.build.fingerprint", "Sony/ivy_dsds/ivy_dsds:7.0/KITAKAMI-2.2.0-170105-0147/1:user/dev-keys");
        } else {
                property_set("ro.telephony.default_network", "9");
                property_set("ro.semc.product.model", "E6553");
                property_set("ro.semc.product.name", "Xperia Z3+");
                property_set("ro.product.model", "E6553");
                property_set("ro.product.name", "ivy");
                property_set("ro.product.device", "ivy");
                property_set("ro.build.description", "ivy-user 7.0 KITAKAMI-2.2.0-170105-0147 1 dev-keys");
                property_set("ro.build.fingerprint", "Sony/ivy/ivy:7.0/KITAKAMI-2.2.0-170105-0147/1:user/dev-keys");
        }
    }
}

void vendor_load_properties()
{
    import_kernel_cmdline(0, import_kernel_nv);
}
