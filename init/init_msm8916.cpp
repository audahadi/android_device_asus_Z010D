/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/sysinfo.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <android-base/properties.h>
#include "vendor_init.h"
#include "property_service.h"

using android::base::GetProperty;
using android::init::property_set;

#define RAW_ID_PATH     "/sys/devices/soc0/raw_id"
#define BUF_SIZE         64

static char tmp[BUF_SIZE];
static char buff_tmp[BUF_SIZE];

char const *device;
char const *family;
char const *product;
char const *heapstartsize;
char const *heapgrowthlimit;
char const *heapsize;
char const *heapminfree;

static int read_file2(const char *fname, char *data, int max_size)
{
    int fd, rc;

    if (max_size < 1)
        return 0;

    fd = open(fname, O_RDONLY);
    if (fd < 0) {
        ("failed to open '%s'\n", fname);
        return 0;
    }

    rc = read(fd, data, max_size - 1);
    if ((rc > 0) && (rc < max_size))
        data[rc] = '\0';
    else
        data[0] = '\0';
    close(fd);

    return 1;
}

static void init_alarm_boot_properties()
{
    int boot_reason;
    FILE *fp;

    fp = fopen("/proc/sys/kernel/boot_reason", "r");
    fscanf(fp, "%d", &boot_reason);
    fclose(fp);

    /*
     * Setup ro.alarm_boot value to true when it is RTC triggered boot up
     * For existing PMIC chips, the following mapping applies
     * for the value of boot_reason:
     *
     * 0 -> unknown
     * 1 -> hard reset
     * 2 -> sudden momentary power loss (SMPL)
     * 3 -> real time clock (RTC)
     * 4 -> DC charger inserted
     * 5 -> USB charger inserted
     * 6 -> PON1 pin toggled (for secondary PMICs)
     * 7 -> CBLPWR_N pin toggled (for external power supply)
     * 8 -> KPDPWR_N pin toggled (power key pressed)
     */
    property_set("ro.alarm_boot", boot_reason == 3 ? "true" : "false");
}

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void vendor_load_properties()
{

    char p_device[PROP_VALUE_MAX];
    unsigned long raw_id = -1;
    int rc;

    /* get raw ID */
    rc = read_file2(RAW_ID_PATH, tmp, sizeof(tmp));
    if (rc) {
        raw_id = strtoul(tmp, NULL, 0);
    }

    /* Z010D  */
    if (raw_id==1797) {

    /* Device Setting */
    family = "WW_Phone";
    device = "Z010D";

    sprintf(p_device, "ASUS_%s", device);

    property_override_dual("ro.product.device", "ro.vendor.product.device", p_device);
    property_override_dual("ro.product.model", "ro.vendor.product.model", "ASUS_Z010D");
    property_override_dual("ro.build.product", "ro.vendor.build.product", "ZC550KL");

    /* Heap Set */
    property_set("dalvik.vm.heapstartsize", "8m");
    property_set("dalvik.vm.heapgrowthlimit", "192m");
    property_set("dalvik.vm.heapsize", "512m");
    property_set("dalvik.vm.heaptargetutilization", "0.75");
    property_set("dalvik.vm.heapminfree", "2m");
    property_set("dalvik.vm.heapmaxfree", "8m");

    /* Display Flicker Fix */
    property_set("debug.hwui.use_buffer_age", "false");
    property_set("ro.opengles.version", "196608");

    } else

    /* Z010DD  */
    if (raw_id==2315) {

    /* Device Setting */
    family = "WW_Phone";
    device = "Z010_2";

    sprintf(p_device, "ASUS_%s", device);

    property_override_dual("ro.product.device", "ro.vendor.product.device", p_device);
    property_override_dual("ro.product.model", "ro.vendor.product.model", "ASUS_Z010DD");
    property_override_dual("ro.build.product", "ro.vendor.build.product", "ZC550KL");
    property_set("ro.build.project.name", "ZC550KL");

    /* Heap Set */
    property_set("dalvik.vm.heapstartsize", "5m");
    property_set("dalvik.vm.heapgrowthlimit", "128m");
    property_set("dalvik.vm.heapsize", "256m");
    property_set("dalvik.vm.heaptargetutilization", "0.75");
    property_set("dalvik.vm.heapminfree", "512k");
    property_set("dalvik.vm.heapmaxfree", "2m");

    /* Display Flicker Fix */
    property_set("ro.opengles.version", "196610");

    }

    else {
        property_set("ro.product.model", "Zenfone"); // this should never happen.
    }
}
