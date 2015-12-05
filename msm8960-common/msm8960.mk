#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL Pantech msm8960 devices, and
# are also specific to msm8960 devices

$(call inherit-product, vendor/pantech/msm8960-common/msm8960-common-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifdef AICP_ROM
$(warning Found AICP build)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay_aicp
endif

#Preinstall
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/preinstall/RootEx/RootExplorer_3.3.5For3.0.apk:system/vendor/preinstall/RootExplorer_3.3.5For3.0.apk \
#	$(LOCAL_PATH)/preinstall/Titanium/Titanium_Backup_PRO_v7.2.1.2.apk:system/vendor/preinstall/Titanium_Backup_PRO_v7.2.1.2.apk

#Dolby
PRODUCT_PACKAGES += As AsUI
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/Dolby/addon.d/23-dap.sh:system/addon.d/23-dap.sh \
	$(LOCAL_PATH)/Dolby/etc/dolby/ds-default.xml:system/etc/dolby/ds-default.xml \
	$(LOCAL_PATH)/Dolby/lib/libdlbdapstorage.so:system/lib/libdlbdapstorage.so \
	$(LOCAL_PATH)/Dolby/lib/soundfx/libswdap-mod.so:system/lib/soundfx/libswdap-mod.so

#CAF packages
#PRODUCT_PACKAGES += \
#	SnapdragonCamera \
#	FastBoot

#Google Camera
PRODUCT_PACKAGES += GCamera2

# WiFi
PRODUCT_PACKAGES += \
	libwfcu \
	libwpa_client \
	hostapd \
        hostapd_default.conf \
        hostapd.accept \
        hostapd.deny \
	dhcpcd.conf \
	wpa_supplicant

PRODUCT_PACKAGES += \
    libwcnss_qmi \
    wcnss_service

	
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml \
	$(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
	$(LOCAL_PATH)/configs/apns-conf.xml:system/etc/old-apns-conf.xml \
	$(LOCAL_PATH)/etc/qosmgr_rules.xml:system/etc/qosmgr_rules.xml \
	#$(LOCAL_PATH)/etc/blkid.tab:system/etc/blkid.tab
	
# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Display
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    memtrack.msm8960
	
# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    #tinymix
	
	
# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw

# Doze
#PRODUCT_PACKAGES += \
    HLDoze \
    G2Doze
	
# Extended media support
PRODUCT_PACKAGES += \
    qcmediaplayer \
    libextmedia_jni

PRODUCT_BOOT_JARS += \
    qcmediaplayer

# Audio Policy Config
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
	#$(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml
	
# Wifi        
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	$(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
	$(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
	$(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \

# WiFi binary
PRODUCT_PACKAGES += \
    libwfcu \
    wcnss_service \
#    conn_init \
    
# libxml2 is needed for camera
PRODUCT_PACKAGES += \
	libc2dcolorconvert \
	libxml2

PRODUCT_PACKAGES += \
	libcnefeatureconfig \
	libboringssl-compat \
	#libstlport

#Add tcmiface support 6.0
PRODUCT_PACKAGES += tcmiface

PRODUCT_BOOT_JARS += tcmiface

# Sony timekeep
PRODUCT_PACKAGES += \
    timekeep \
    TimeKeep

# Power
PRODUCT_PACKAGES += \
	power.msm8960 \
	power.lehoang

#GPS
#PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_core \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8960

# Fix symbols (Dont need now, but maybe use on the future)
#PRODUCT_PACKAGES += \
    libhl

PRODUCT_PACKAGES += \
    com.qualcomm.location \
        flp.msm8960

# GPS configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/configs/sec_config:system/etc/sec_config \
	$(LOCAL_PATH)/configs/sap.conf:system/etc/sap.conf \
	$(LOCAL_PATH)/configs/flp.conf:system/etc/flp.conf \
	$(LOCAL_PATH)/configs/izat.conf:system/etc/izat.conf \
	$(LOCAL_PATH)/configs/cacert_location.pem:system/etc/cacert_location.pem \

	
# Media

ifneq($(BOARD_USES_QCOM_HARDWARE), true)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs_aosp.xml:system/etc/media_codecs.xml
else
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	$(LOCAL_PATH)/configs/interface_permissions.xml:system/etc/permissions/interface_permissions.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \

#PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml \

#Rootdir
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.target.rc \
	init.pantech.usb.rc \
	init.pantech.usb.sh \
	init.qcom.power.rc \
	init.qcom.rc \
	init.qcom.sh \
	init.recovery.qcom.rc \
	ueventd.qcom.rc \
	preinstall.sh \
	initlogo.rle \
	battery_fail.png \
	battery_scale.png

#Camera
PRODUCT_PACKAGES += \
	CE150F00.bin \
	CE150F01.bin \
	CE150F02_89.bin \
	CE150F03_89.bin


# Qcom scripts
PRODUCT_PACKAGES += \
	init.qcom.bt.sh \
	init.qcom.modem_links.sh
	
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml


# NFC Support
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras \

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
   

    
#PRODUCT_TAGS += dalvik.gc.type-precise

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck
	
# Qualcomm Random Numbers Generator
PRODUCT_PACKAGES += \
    qrngd \
    qrngp

PRODUCT_PACKAGES += \
	libemoji \

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196608

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
		  sys.io.scheduler=bfq

# Do not power down SIM card when modem is sent to Low Power Mode.
#PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
#PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

# Navigation Bar
PRODUCT_PROPERTY_OVERRIDES += \
	qemu.hw.mainkeys=0

# Perfd
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so
#	ro.vendor.extension_library=/system/lib/libqc-opt.so \
#	rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=180

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
	ro.qc.sensors.wl_dis=true \
	ro.qualcomm.sensors.smd=true \

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=1

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-pantech \
	ro.com.google.clientidbase.ms=android-pantech \
	ro.com.google.clientidbase.am=android-pantech \
	ro.com.google.clientidbase.gmm=android-pantech \
	ro.com.google.clientidbase.yt=android-pantech
	
# Configure libhwui
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.texture_cache_size=48 \
	ro.hwui.layer_cache_size=32 \
	ro.hwui.r_buffer_cache_size=4 \
	ro.hwui.path_cache_size=24 \
	ro.hwui.gradient_cache_size=1 \
	ro.hwui.drop_shadow_cache_size=5 \
	ro.hwui.texture_cache_flushrate=0.5 \
	ro.hwui.text_small_cache_width=1024 \
	ro.hwui.text_small_cache_height=1024 \
	ro.hwui.text_large_cache_width=2048 \
	ro.hwui.text_large_cache_height=1024

 PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0

#Sound config
PRODUCT_PROPERTY_OVERRIDES += \
		lpa.decode=false \
		lpa.use-stagefright=false \
		qcom.hw.aac.encoder=true \
		persist.audio.fluence.mode=endfire \
		persist.audio.dualmic.config=false \
		persist.audio.vr.enable=false \
		persist.audio.handset.mic=analog \
		persist.audio.handset.mic.type=analog \
		docking_speaker=on \
		docking_event=0 \
		dump.audio_hal=false \
		persist.audio.lowlatency.rec=false \
		af.resampler.quality=255 \
		mpq.audio.decode=true 

# media
#PRODUCT_PROPERTY_OVERRIDES += \
    qcom.hw.aac.encoder=true \
    mm.enable.smoothstreaming=true

# gps
#PRODUCT_PROPERTY_OVERRIDES += \
    ro.gps.agps_provider=1 \
    ro.qc.sdk.izat.premium_enabled=0 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=0

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false    

PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.ringtone=Orion.ogg

$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)
