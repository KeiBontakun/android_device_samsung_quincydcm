#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/quincydcm/quincydcm-vendor.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Graphics
PRODUCT_PACKAGES += \
    liboverlay \
    libqdutils \
    libtilerenderer

# QRNGD
PRODUCT_PACKAGES += qrngd

# S-Pen IDC
PRODUCT_COPY_FILES += \
    device/samsung/quincydcm/idc/sec_e-pen.idc:system/usr/idc/sec_e-pen.idc \
    device/samsung/quincydcm/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd

# Bootanimation
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.usb.rc

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false

# TWRP Recovery
PRODUCT_PACKAGES += \
    postrecoveryboot.sh \
    twrp.fstab

# common msm8660
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)

# dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
