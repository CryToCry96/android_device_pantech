#!/sbin/sh

CHECKSUM=`grep -c $'\x57' /dev/block/mmcblk0p5`
CHECK_SS_SUM=275

if grep -q "IM-A910S" /dev/block/mmcblk0p10 ; then

	if [ "$CHECKSUM" = "$CHECK_SS_SUM" ] ; then 
	mv /system/etc/firmware-ef63S/* /system/etc/firmware/
	fi

elif grep -q "IM-A910K" /dev/block/mmcblk0p10 ; then
	mv /system/etc/firmware-ef63k/* /system/etc/firmware/

fi

rm -rf /system/etc/firmware-ef63S
rm -rf /system/etc/firmware-ef63k
rm -rf /system/bin/check.sh
