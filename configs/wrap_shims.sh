#!/sbin/sh

#Hex edit Common libs
sed -i "s|libqsap_sdk.so|libqsapshim.so|g" /vendor/lib/libmdmcutback.so
restorecon /vendor/lib/libmdmcutback.so
sed -i "s|libcutils.so|libsensor.so|g" /vendor/lib/libmot_sensorlistener.so
restorecon /vendor/lib/libmot_sensorlistener.so

#Hex edit Merlin libs
sed -i "s|libcutils.so|libc_util.so|g" /vendor/lib/libmmcamera_wavelet_lib.so
restorecon /vendor/lib/libmmcamera_wavelet_lib.so
sed -i "s|libcutils.so|libboring.so|g" /vendor/lib/libqomx_jpegenc.so
restorecon /vendor/lib/libqomx_jpegenc.so
sed -i "s|libcutils.so|libboring.so|g" /vendor/lib/libmmqjpeg_codec.so
restorecon /vendor/lib/libmmqjpeg_codec.so
sed -i "s|libstagefright.so|libshim_camera.so|g" /vendor/lib/libjustshoot.so
restorecon /vendor/lib/libjustshoot.so

exit 0
