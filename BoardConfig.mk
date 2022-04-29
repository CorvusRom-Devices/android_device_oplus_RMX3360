#
# Copyright (C) 2021 The LineageOS Project
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

DEVICE_PATH := device/oplus/RMX3360

# kernel/DTB
DEVICE_USES_PREBUILT_DTB := true
PREBUILT_PATH := $(DEVICE_PATH)/prebuilt

ifeq ($(DEVICE_USES_PREBUILT_DTB),true)
TARGET_FORCE_PREBUILT_KERNEL :=
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_PATH)/dtbo.img
TARGET_PREBUILT_DTB := $(PREBUILT_PATH)/dtb.img
endif

ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/Image.gz
BOARD_PREBUILT_DTBOIMAGE := $(PREBUILT_PATH)/dtbo.img
TARGET_PREBUILT_DTB := $(PREBUILT_PATH)/dtb.img
endif

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include

# Display
TARGET_SCREEN_DENSITY := 450

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100

# Inherit from oplus sm8350-common
-include device/oplus/sm8350-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/oplus/RMX3360/BoardConfigVendor.mk
