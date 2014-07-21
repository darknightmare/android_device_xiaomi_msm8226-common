#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

BOARD_VENDOR := xiaomi-qcom

LOCAL_PATH := device/xiaomi/msm8226-common

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Global flags
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Wifi related defines
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
BOARD_WLAN_DEVICE := qcwcn

# Enable WEBGL in WebKit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Audio
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_SEPERATED_AUDIO_INPUT := true
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/config/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true

# Use retire fence from MDP driver
TARGET_DISPLAY_USE_RETIRE_FENCE := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# GPS
TARGET_NO_RPC := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# Display
TARGET_QCOM_DISPLAY_VARIANT := caf-new

# Media
TARGET_QCOM_MEDIA_VARIANT := caf-new

# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

# HW Specific
TARGET_HW_DISK_ENCRYPTION := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/xiaomi/msm8226-common/cmhw/

# Assert
TARGET_OTA_ASSERT_DEVICE := armani, h1sw

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true

# Number of supplementary service groups allowed by init
TARGET_NR_SVC_SUPP_GIDS := 28
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# SELinux
BOARD_SEPOLICY_DIRS += \
	device/xiaomi/msm8226-common/sepolicy

BOARD_SEPOLICY_UNION += \
	adbd.te \
	app.te \
	bluetooth_loader.te \
	bridge.te \
	camera.te \
	device.te \
	dhcp.te \
	dnsmasq.te \
	domain.te \
	drmserver.te \
	file_contexts \
	file.te \
	hostapd.te \
	init_shell.te \
	init.te \
	libqc-opt.te \
	mediaserver.te \
	mpdecision.te \
	netd.te \
	netmgrd.te \
	property_contexts \
	property.te \
	qcom.te \
	qmux.te \
	radio.te \
	rild.te \
	rmt.te \
	sdcard_internal.te \
	sdcardd.te \
	sensors.te \
	shell.te \
	surfaceflinger.te \
	system.te \
	tee.te \
	te_macros \
	thermald.te \
	ueventd.te \
	vold.te \
	wpa_supplicant.te \
	zygote.te

ifneq ($(TARGET_BUILD_VARIANT),user)
	BOARD_SEPOLICY_UNION += su.te
endif

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))
