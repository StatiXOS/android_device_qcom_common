#
# Copyright 2021 Paranoid Android
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

DEVICE_PATH := device/qcom/common

ifeq ($(TARGET_COMMON_QTI_COMPONENTS), all)
TARGET_COMMON_QTI_COMPONENTS := \
    av \
    bt \
    gps \
    init \
    overlay \
    telephony \
    usb \
    vibrator \
    wfd \
    wlan

ifneq (,$(filter true, $(call is-board-platform-in-list,$(3_18_FAMILY) $(4_4_FAMILY))))
TARGET_COMMON_QTI_COMPONENTS += adreno-legacy
else
TARGET_COMMON_QTI_COMPONENTS += adreno
endif
endif

# QTI common components
ifneq (,$(filter av, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/av/qti-av.mk
endif

ifneq (,$(filter bt, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/bt/qti-bt.mk
endif

ifneq (,$(filter gps, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/gps/qti-gps.mk
endif

ifneq (,$(filter init, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/init/qti-init.mk
endif

ifneq (,$(filter overlay, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/overlay/qti-overlay.mk
endif

ifneq (,$(filter perf, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/perf/qti-perf.mk
endif

ifneq (,$(filter telephony, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/telephony/qti-telephony.mk
endif

ifneq (,$(filter usb, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/usb/qti-usb.mk
endif

ifneq (,$(filter vibrator, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/vibrator/qti-vibrator.mk
endif

ifneq (,$(filter wlan, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/wlan/qti-wlan.mk
endif

# 845 series and up
ifneq (,$(filter adreno, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/adreno/qti-adreno.mk
endif

ifneq (,$(filter wfd, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/wfd/qti-wfd.mk
endif

# 8998 series and older
ifneq (,$(filter wfd-legacy, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/wfd-legacy/qti-wfd-legacy.mk
endif

ifneq (,$(filter adreno-legacy, $(TARGET_COMMON_QTI_COMPONENTS)))
include $(DEVICE_PATH)/adreno-legacy/qti-adreno-legacy.mk
endif

# Public Libraries
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/public.libraries.system_ext-qti.txt:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/public.libraries-qti.txt
