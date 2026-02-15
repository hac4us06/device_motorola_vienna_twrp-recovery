LOCAL_PATH := device/motorola/vienna

# A/B support
AB_OTA_UPDATER := true

# List of A/B partitions for Edge 50 Neo
AB_OTA_PARTITIONS := \
    boot \
    init_boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    system \
    system_ext \
    vendor \
    product \
    vendor_dlkm \
    system_dlkm

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Copy the fstab to the recovery ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab

