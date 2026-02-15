DEVICE_PATH := device/motorola/vienna

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
TARGET_2ND_CPU_VARIANT := generic

# Kernel / Header Information (Verified from Stock)
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)

# Prebuilt Kernel / DTB / DTBO
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Flash / Partition Layout
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_HAS_RECOVERY_AS_BOOT := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TARGET_NO_RECOVERY := true

# Platform
TARGET_BOARD_PLATFORM := mt6789
BOARD_USES_MTK_HARDWARE := true

# Build Hacks (Pulled from Xiaomi Rothko)
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PLUGIN_VALIDATION := soong-libaosprecovery_defaults soong-libguitwrp_defaults soong-libminuitwrp_defaults soong-vold_defaults

# Recovery Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2
BOARD_USES_METADATA_PARTITION := true
PLATFORM_VERSION := 15
PLATFORM_SECURITY_PATCH := 2026-02-01

# TWRP Specific Flags
BUILD_STATIC_LIBTAR := true
TW_INCLUDE_LIBTAR := true
TW_EXCLUDE_APCP := true
TW_EXCLUDE_FDE := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_PREPARE_DATA_MEDIA_EARLY := true

# File System and Device Modules
TARGET_RECOVERY_DEVICE_MODULES += \
    libtar \
    libf2fs_sparseblock \
    libf2fs_fmt_static \
    libf2fs_utils_static \
    libscrypt_static \
    libcap

# Fix for Linker Errors at 99% (Consolidated Security List)
TW_RECOVERY_ADDITIONAL_RELINK_LIBS += \
    libcap \
    libscrypt_static \
    android.hardware.weaver@1.0 \
    android.hardware.authsecret@1.0 \
    android.hardware.gatekeeper@1.0 \
    android.system.keystore2-V1-ndk \
    android.hardware.security.keymint-V1-ndk \
    android.hardware.security.sharedsecret-V1-ndk \
    android.hardware.security.authorization-V1-ndk \
    android.security.maintenance-V1-ndk \
    android.security.authorization-V1-ndk \
    libgatekeeper \
    libkeymaster_messages
