# prop for msm8916-common

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.hw_camera_hdr=true

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.audio.offload.24bit.enable=false \
	vendor.audio.offload.buffer.size.kb=64 \
	vendor.audio.offload.gapless.enabled=true \
	av.offload.enable=true \
	vendor.audio.av.streaming.offload.enable=false \
	persist.audio.calfile0=/vendor/etc/acdbdata/Bluetooth_cal.acdb \
	persist.audio.calfile1=/vendor/etc/acdbdata/General_cal.acdb \
	persist.audio.calfile2=/vendor/etc/acdbdata/Global_cal.acdb \
	persist.audio.calfile3=/vendor/etc/acdbdata/Handset_cal.acdb \
	persist.audio.calfile4=/vendor/etc/acdbdata/Hdmi_cal.acdb \
	persist.audio.calfile5=/vendor/etc/acdbdata/Headset_cal.acdb \
	persist.audio.calfile6=/vendor/etc/acdbdata/Speaker_cal.acdb \
	ro.config.media_vol_steps=25 \
	ro.config.vc_call_vol_steps=7 \
	ro.vendor.audio.ssr=false \
	vendor.voice.path.for.pcm.voip=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	bluetooth.hfp.client=1 \
	vendor.qcom.bluetooth.soc=pronto \
	ro.bluetooth.hfp.ver=1.6 \
	ro.qualcomm.bt.hci_transport=smd \
	ro.bluetooth.dun=true \
	ro.bluetooth.sap=true \
	ro.boot.btmacaddr=00:00:00:00:00:00

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1 \
	media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true

# Display
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=196608 \
	persist.hwc.mdpcomp.enable=1 \
	debug.cpurend.vsync=false \
	debug.sf.disable_backpressure=1 \
	debug.sf.enable_gl_backpressure=1 \
	debug.sf.latch_unsignaled=1 \
	debug.sf.recomputecrop=0

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
	ro.gps.agps_provider=1 \
	ro.pip.gated=0

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.drop_shadow_cache_size=6 \
	ro.hwui.gradient_cache_size=1 \
	ro.hwui.layer_cache_size=48 \
	ro.hwui.path_cache_size=32 \
	ro.hwui.r_buffer_cache_size=8 \
	ro.hwui.shape_cache_size=2 \
	ro.hwui.text_large_cache_height=1024 \
	ro.hwui.text_large_cache_width=2048 \
	ro.hwui.text_small_cache_height=1024 \
	ro.hwui.text_small_cache_width=1024 \
	ro.hwui.texture_cache_flushrate=0.4 \
	ro.hwui.texture_cache_size=72

# Hotspot WiFi
PRODUCT_PROPERTY_OVERRIDES += \
	sys.usb.rps_mask=10

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
	persist.dbg.volte_avail_ovr=1 \
	persist.dbg.vt_avail_ovr=0  \
	persist.ims.volte=true \
	persist.ims.vt=false \
	persist.ims.vt.epdg=false \
	persist.ims.rcs=false \
	persist.radio.videopause.mode=0 \
	persist.radio.VT_ENABLE=1 \
	persist.radio.VT_HYBRID_ENABLE=1 \
	persist.radio.ROTATION_ENABLE=1 \
	persist.radio.REVERSE_QMI=0 \
	persist.radio.RATE_ADAPT_ENABLE=1 \
	persist.radio.VT_USE_MDM_TIME=0 \
	persist.rmnet.mux=enabled \
	persist.dbg.ims_volte_enable=1 \
	persist.radio.calls.on.ims=true \
	persist.vendor.radio.jbims=1 \
	persist.volte_enabled_by_hw=1 \
	service.qti.ims.enabled=1 \
	persist.data.iwlan.enable=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	vidc.enc.narrow.searchrange=1 \
	mm.enable.smoothstreaming=true \
	mmp.enable.3g2=true \
	media.aac_51_output_enabled=true \
	audio.offload.video=true \
	vendor.mediacodec.binder.size=6

# NITZ
PRODUCT_PROPERTY_OVERRIDES += \
	persist.rild.nitz_plmn="" \
	persist.rild.nitz_long_ons_0="" \
	persist.rild.nitz_long_ons_1="" \
	persist.rild.nitz_long_ons_2="" \
	persist.rild.nitz_long_ons_3="" \
	persist.rild.nitz_short_ons_0="" \
	persist.rild.nitz_short_ons_1="" \
	persist.rild.nitz_short_ons_2="" \
	persist.rild.nitz_short_ons_3=""

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=libqti-perfd-client.so

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	persist.data.mode=concurrent \
	persist.data.netmgrd.qos.enable=true \
	persist.data.qmi.adb_logmask=0 \
	persist.vendor.qcril_uim_vcc_feature=1 \
	persist.vendor.radio.0x9e_not_callname=1 \
	persist.vendor.radio.add_power_save=1 \
	persist.radio.aosp_usr_pref_sel=true \
	persist.radio.apn_delay=5000 \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.vendor.radio.apm_sim_not_pwdn=1 \
	persist.vendor.radio.custom_ecc=1 \
	persist.vendor.radio.data_con_rprt=1 \
	persist.vendor.radio.dfr_mode_set=1 \
	persist.vendor.radio.eri64_as_home=1 \
	persist.vendor.radio.force_get_pref=1 \
	persist.vendor.radio.is_wps_enabled=true \
	persist.radio.msgtunnel.start=true \
	persist.vendor.radio.mt_sms_ack=30 \
	persist.vendor.radio.no_wait_for_card=1 \
	persist.vendor.radio.oem_ind_to_both=false \
	persist.vendor.radio.qcril_uim_vcc_feature=1 \
	persist.vendor.radio.rat_on=combine \
	persist.vendor.radio.relay_oprt_change=1 \
	persist.vendor.radio.sib16_support=1 \
	persist.vendor.radio.snapshot_timer=22 \
	persist.vendor.radio.snapshot_enabled=1 \
	rild.libargs=-d/dev/smd0 \
	rild.libpath=/vendor/lib/libril-qc-qmi-1.so \
	ro.telephony.call_ring.multiple=false

# RmNet Data
PRODUCT_PROPERTY_OVERRIDES += \
	persist.rmnet.data.enable=true \
	persist.data.wda.enable=true \
	persist.data.df.dl_mode=5 \
	persist.data.df.ul_mode=5 \
	persist.data.df.agg.dl_pkt=10 \
	persist.data.df.agg.dl_size=4096 \
	persist.data.df.mux_count=8 \
	persist.data.df.iwlan_mux=9 \
	persist.data.df.dev_name=rmnet_usb0

# Play store
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase.am=android-motorola \
	ro.com.google.clientidbase.gmm=android-motorola \
	ro.com.google.clientidbase.ms=android-motorola \
	ro.com.google.clientidbase.yt=android-motorola

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0
