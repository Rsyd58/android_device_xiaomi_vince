#
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/vince

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_DUP_SYSPROP := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true
ALLOW_MISSING_DEPENDENCIES := true
RELAX_USES_LIBRARY_CHECK := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000 cgroup_disable=pressure
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE :=  2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/xiaomi/vince
TARGET_KERNEL_CONFIG := vince_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/azure-clang

# ANT
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
AUDIO_FEATURE_ENABLED_ALAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_CUSTOMSTEREO := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_SOURCE_TRACKING := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := false
AUDIO_FEATURE_ENABLED_VORBIS_OFFLOAD := false
AUDIO_USE_LL_AS_PRIMARY_OUTPUT := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_QTI_CAMERA_DEVICE := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_SUPPORT_HAL1 := false

# Display
TARGET_SCREEN_DENSITY := 440
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_ION := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 3.0

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55087422464
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix_legacy.xml \
    vendor/lineage/config/device_framework_matrix.xml \
    $(DEVICE_PATH)/vintf/dolby_compat_framework_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/vintf/framework_manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_vince
TARGET_RECOVERY_DEVICE_MODULES := libinit_vince

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/battery_charging_enabled

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/dsp:/dsp \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist

# Power
TARGET_USES_INTERACTION_BOOST := true
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/platform/soc/78b7000.i2c/i2c-3/3-0020/input/input2/wake_gesture"

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msm8953

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/properties/odm.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/properties/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop
TARGET_PRODUCT_PROP := $(DEVICE_PATH)/properties/product.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
include device/lineage/sepolicy/common/sepolicy.mk
include device/qcom/sepolicy-legacy-um/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
BOARD_SEPOLICY_M4DEFS += \
    sysfs_battery_supply=vendor_sysfs_battery_supply \
    sysfs_usb_supply=vendor_sysfs_usb_supply

# Security patch level
VENDOR_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# Wi-Fi
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
PRODUCT_VENDOR_MOVE_ENABLED := true

# Inherit from the proprietary version
include vendor/xiaomi/vince/BoardConfigVendor.mk
