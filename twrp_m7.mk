#
# Copyright (C) 2021 TeamWin Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

$(call inherit-product, device/lenovo/m7/device.mk)

# Inherit from TWRP common configurations
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

# Extra required packages


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m7
PRODUCT_NAME := twrp_m7
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := TB-7306F
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_RELEASE_NAME := Lenovo Tab M7 (3rd Gen)

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=lenovo_m7 \
    PRODUCT_NAME=lenovo_m7 \
    PRIVATE_BUILD_DESC="full_m7-user 11 RP1A.200720.011 78 release-keys"

BUILD_FINGERPRINT := Lenovo/LenovoTB-7306F_GO/7306F:11/RP1A.200720.011/S000054_230713_ROW:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31