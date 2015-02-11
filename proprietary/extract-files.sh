#!/bin/bash
echo "Please wait..."
wget -nc -q https://dl.google.com/dl/android/aosp/shamu-lrx22c-factory-ff173fc6.tgz
tar zxf shamu-lrx22c-factory-ff173fc6.tgz
rm shamu-lrx22c-factory-ff173fc6.tgz
cd shamu-lrx22c
unzip image-shamu-lrx22c.zip
cd ../
./simg2img shamu-lrx22c/system.img system.ext4.img
mkdir tmp
sudo mount -o loop -t ext4 system.ext4.img tmp
sync

mkdir -p system/bin
mkdir -p system/etc/diag
mkdir -p system/etc/preferred-apps
mkdir -p system/etc/sysconfig
mkdir -p system/etc/updatecmds
mkdir -p system/lib/hw
mkdir -p system/lib/soundfx
mkdir -p system/etc/permissions
mkdir -p system/media
mkdir -p system/media/audio/ui
mkdir -p system/vendor/etc
mkdir -p system/vendor/firmware
mkdir -p system/vendor/lib/drm
mkdir -p system/vendor/lib/mediadrm
mkdir -p system/vendor/media

cp -a tmp/bin/mdm_helper_proxy system/bin/mdm_helper_proxy
cp -a tmp/etc/diag/audio_voice_apr.cfg system/etc/diag/audio_voice_apr.cfg
cp -a tmp/etc/preferred-apps/google.xml system/etc/preferred-apps/google.xml
cp -a tmp/etc/sysconfig/google.xml system/etc/sysconfig/google.xml
cp -a tmp/etc/sysconfig/google_build.xml system/etc/sysconfig/google_build.xml
cp -a tmp/etc/updatecmds/google_generic_update.txt system/etc/updatecmds/google_generic_update.txt
cp -a tmp/etc/fmas_eq.dat system/etc/fmas_eq.dat
cp -a tmp/etc/nfcee_access.xml system/etc/nfcee_access.xml
cp -a tmp/lib/hw/audio.motvr.default.so system/lib/hw/audio.motvr.default.so
cp -a tmp/lib/soundfx/libfmas.so system/lib/soundfx/libfmas.so
cp -a tmp/lib/libdmengine.so system/lib/libdmengine.so
cp -a tmp/lib/libdmjavaplugin.so system/lib/libdmjavaplugin.so
cp -a tmp/lib/libmotaudioutils.so system/lib/libmotaudioutils.so
cp -a tmp/lib/librefocus.so system/lib/librefocus.so
cp -a tmp/lib/libtrainingcheck.so system/lib/libtrainingcheck.so
cp -a tmp/lib/libvcdecoder_jni.so system/lib/libvcdecoder_jni.so
cp -a tmp/lib/libvorbisencoder.so system/lib/libvorbisencoder.so
cp -a tmp/etc/permissions/com.motorola.triggerenroll.xml system/etc/permissions/com.motorola.triggerenroll.xml
cp -a tmp/etc/permissions/com.android.omadm.service.xml system/etc/permissions/com.android.omadm.service.xml
cp -a tmp/media/bootanimation.zip system/media/bootanimation.zip
cp -a tmp/vendor/etc/audio_effects.conf system/vendor/etc/audio_effects.conf
cp -a tmp/vendor/firmware/cy8c20247_24lkxi.hex system/vendor/firmware/cy8c20247_24lkxi.hex
cp -a tmp/vendor/firmware/left.boost.music.config system/vendor/firmware/left.boost.music.config
cp -a tmp/vendor/firmware/left.boost.ringtone.config system/vendor/firmware/left.boost.ringtone.config
cp -a tmp/vendor/firmware/left.boost.voice.config system/vendor/firmware/left.boost.voice.config
cp -a tmp/vendor/firmware/right.boost.music.config system/vendor/firmware/right.boost.music.config
cp -a tmp/vendor/firmware/right.boost.ringtone.config system/vendor/firmware/right.boost.ringtone.config
cp -a tmp/vendor/firmware/right.boost.voice.config system/vendor/firmware/right.boost.voice.config
cp -a tmp/vendor/lib/drm/libdrmwvmplugin.so system/vendor/lib/drm/libdrmwvmplugin.so
cp -a tmp/vendor/lib/mediadrm/libwvdrmengine.so system/vendor/lib/mediadrm/libwvdrmengine.so
cp -a tmp/vendor/lib/libWVStreamControlAPI_L1.so system/vendor/lib/libWVStreamControlAPI_L1.so
cp -a tmp/vendor/lib/libWVphoneAPI.so system/vendor/lib/libWVphoneAPI.so
cp -a tmp/vendor/lib/libchromatix_imx214_cpp_snap.so system/vendor/lib/libchromatix_imx214_cpp_snap.so
cp -a tmp/vendor/lib/libfrsdk.so system/vendor/lib/libfrsdk.so
cp -a tmp/vendor/lib/libwvdrm_L1.so system/vendor/lib/libwvdrm_L1.so
cp -a tmp/vendor/lib/libwvm.so system/vendor/lib/libwvm.so
cp -a tmp/vendor/media/LMspeed_508.emd system/vendor/media/LMspeed_508.emd
cp -a tmp/vendor/media/PFFprec_600.emd system/vendor/media/PFFprec_600.emd
cp -a tmp/media/audio/ui/NFCFailure.ogg system/media/audio/ui/NFCFailure.ogg
cp -a tmp/media/audio/ui/NFCInitiated.ogg system/media/audio/ui/NFCInitiated.ogg
cp -a tmp/media/audio/ui/NFCSuccess.ogg system/media/audio/ui/NFCSuccess.ogg
cp -a tmp/media/audio/ui/NFCTransferComplete.ogg system/media/audio/ui/NFCTransferComplete.ogg
cp -a tmp/media/audio/ui/NFCTransferInitiated.ogg system/media/audio/ui/NFCTransferInitiated.ogg
cp -a tmp/media/audio/ui/VideoStop.ogg system/media/audio/ui/VideoStop.ogg
cp -a tmp/media/audio/ui/audio_end.ogg system/media/audio/ui/audio_end.ogg
cp -a tmp/media/audio/ui/audio_initiate.ogg system/media/audio/ui/audio_initiate.ogg

sudo umount tmp
rm -rf tmp
rm -rf shamu-lrx22c
rm system.ext4.img
