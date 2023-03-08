#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0.vendor \
    android.hardware.sensors@2.1.vendor \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.0-service-multihal.golf \
    libsensorndkbridge

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.1-service-oplus

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.oplus

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage
    
# Doze
PRODUCT_PACKAGES += \
    OplusDoze

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    init.class_main.sh \
    qca6234-service.sh \
    init.qcom.coex.sh \
    init.qcom.sh \
    init.qcom.early_boot.sh \
    init.qcom.sensors.sh \
    init.qti.display_boot.sh \
    init.qti.chg_policy.sh \
    init.qcom.usb.sh \
    init.mdm.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qti.early_init.sh \
    init.qcom.class_core.sh \
    init.qcom.sdio.sh \
    init.qti.qcv.sh \
    init.qti.dcvs.sh \
    init.crda.sh \
    init.qti.media.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    vendor.oem_ftm.rc \
    init.qcom.usb.rc \
    init.qcom.rc \
    init.oem_ftm.rc \
    init.target.rc \
    init.qcom.factory.rc \
    init.qti.ufs.rc \
    vendor.oem_ftm_svc_disable.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Asserts
TARGET_OTA_ASSERT_DEVICE := RMX3491,RMX3493,RED8C1,RED8C1L1

# Inherit the proprietary files
$(call inherit-product, vendor/realme/golf/golf-vendor.mk)
