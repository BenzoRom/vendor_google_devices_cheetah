# Copyright (C) 2023 Benzo Rom
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
TARGET_BOARD_INFO_FILE := vendor/google_devices/cheetah/vendor-board-info.txt
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
ifneq ($(PRODUCT_USE_DYNAMIC_PARTITIONS), true)
  BOARD_VENDORIMAGE_PARTITION_SIZE := 667602944
endif
ifneq ($(PRODUCT_NO_PRODUCT_PARTITION), true)
  ifneq ($(PRODUCT_USE_DYNAMIC_PARTITIONS), true)
    BOARD_PRODUCTIMAGE_PARTITION_SIZE := 2913841152
  endif
  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
endif
ifneq ($(PRODUCT_USE_DYNAMIC_PARTITIONS), true)
  BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 373903360
endif
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
ARMNN_COMPUTE_CL_ENABLE := 1

# Enable vendor dlkm partition for modules
BOARD_USES_VENDOR_DLKMIMAGE := true
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Enable chain partition for vendor.
BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 3

# SEPolicy for vendor apps/libs
BOARD_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/connectivity_thermal_power_manager
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/googlebattery
BOARD_VENDOR_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/turbo_adapter
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += hardware/google/pixel-sepolicy/flipendo
