$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

$(call inherit-product, device/motorola/vienna/device.mk)

PRODUCT_DEVICE := vienna
PRODUCT_NAME := twrp_vienna
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Motorola Edge 50 Neo
PRODUCT_MANUFACTURER := motorola

