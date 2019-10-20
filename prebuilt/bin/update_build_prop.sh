#!/sbin/sh

#update_prop $target $update
update_prop() {
    target=$1
    update=$2
    backup="$target.backup"

    #backup orginial prop file
    mv $target $backup

    #write original prop, header and then update prop
    printf "# %s\n" "$update" | cat $backup - $update > $target

    unset target update backup
}

#update build props for merlin variants
sku=$(getprop ro.boot.hardware.sku)

if [ "$sku" = "XT1556" ]; then
    update_prop "/system/system/build.prop" "/tmp/install/bin/system_XT1556.prop"
    update_prop "/vendor/build.prop" "/tmp/install/bin/vendor_XT1556.prop"
elif [ "$sku" = "XT1557" ]; then
    update_prop "/system/system/build.prop" "/tmp/install/bin/system_XT1557.prop"
    update_prop "/vendor/build.prop" "/tmp/install/bin/vendor_XT1557.prop"
fi

unset sku

#fix permission and context
chmod 644 "/system/system/build.prop"
chmod 644 "/vendor/build.prop"
chcon u:object_r:system_file:s0 "/system/system/build.prop"
chcon u:object_r:vendor_file:s0  "/vendor/build.prop"

exit 0
