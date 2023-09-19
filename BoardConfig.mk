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
# Allow building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

DEVICE_PATH := device/lenovo/m7

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    lk \
    preloader \
    product \
    system \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53
TARGET_USES_64_BIT_BINDER := true
ALLOW_MISSING_DEPENDENCIES := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Platform
TARGET_BOARD_PLATFORM := mt6761
BOARD_USES_MTK_HARDWARE := true

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 buildvariant=user
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11b00000
BOARD_DTB_OFFSET := 0x07880000
BOARD_KERNEL_TAGS_OFFSET := 0x07880000

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb


# Assert
TARGET_OTA_ASSERT_DEVICE := m7

# Partitions configs
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_MAIN_PARTITION_LIST := system vendor product
BOARD_SUPER_PARTITION_SIZE := 4563402752
BOARD_SUPER_PARTITION_GROUPS := mtk_dynamic_partitions
BOARD_MTK_DYNAMIC_PARTITIONS_PARTITION_LIST := \
	system \
	vendor \
	product
BOARD_MTK_DYNAMIC_PARTITIONS_SIZE := 4563402752

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Treble
TARGET_COPY_OUT_VENDOR := vendor


# Metadata
BOARD_USES_METADATA_PARTITION := true

# Encryption
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# TWRP specific build flags
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_SCREEN_BLANK := true
TARGET_USES_MKE2FS := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_DEVICE_VERSION := smiley_9000
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_THEME := portrait_hdpi
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_DEFAULT_DEVICE_NAME := m7
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_TWRPAPP := true
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
RECOVERY_SDCARD_ON_DATA := true
TW_USE_NEW_MINADBD := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true

BOARD_RAMDISK_USE_LZMA := true
LZMA_RAMDISK_TARGETS := recovery
TW_SKIP_COMPATIBILITY_CHECK := true

PLATFORM_SECURITY_PATCH := 2023-06-05
VENDOR_SECURITY_PATCH := 2023-06-05
