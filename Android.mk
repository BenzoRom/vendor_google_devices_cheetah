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
LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE), cheetah)

#
# Generate Symlinks
#
DMSERVICE_LIBS := libdmengine.so libdmjavaplugin.so
DMSERVICE_ARM_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm/,$(notdir $(DMSERVICE_LIBS)))
$(DMSERVICE_ARM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib/$(notdir $@) $@
DMSERVICE_ARM64_SYMLINKS := $(addprefix $(TARGET_OUT_PRODUCT)/priv-app/DMService/lib/arm64/,$(notdir $(DMSERVICE_LIBS)))
$(DMSERVICE_ARM64_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /product/lib64/$(notdir $@) $@

HBMSVMANAGER_LIBS := libhbmsvmanager_jni.so
HBMSVMANAGER_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT)/priv-app/HbmSVManager/lib/arm64/,$(notdir $(HBMSVMANAGER_LIBS)))
$(HBMSVMANAGER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

TURBO_ADAPTER_LIBS := libpowerstatshaldataprovider.so
TURBO_ADAPTER_SYMLINKS := $(addprefix $(TARGET_OUT_SYSTEM_EXT)/priv-app/TurboAdapter/lib/arm64/,$(notdir $(TURBO_ADAPTER_LIBS)))
$(TURBO_ADAPTER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(DMSERVICE_ARM_SYMLINKS) $(DMSERVICE_ARM64_SYMLINKS) $(HBMSVMANAGER_SYMLINKS) $(TURBO_ADAPTER_SYMLINKS)

endif
