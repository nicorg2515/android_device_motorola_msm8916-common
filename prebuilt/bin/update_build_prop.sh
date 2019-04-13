#!/sbin/sh

#append_prop $target $append
append_prop() {
    target=$1
    append=$2

    #comment pre-existing properties
    pattern=$(grep "^[^#]*=" $append | sed "s/=.*/=\/s\/\^\/#\//" |  sed "s/^/\/\^/" | paste -sd ";" -)
    sed -i $pattern $target

    #append header
    printf "\n# %s\n" "$append" >> $target

    #append prop
    cat $append >> $target

    unset target append
}

#update build props for merlin variants
sku=$(getprop ro.boot.hardware.sku)

if [ "$sku" = "XT1556" ]; then
    append_prop "/system/build.prop" "/tmp/install/bin/system_XT1556.prop"
    append_prop "/vendor/build.prop" "/tmp/install/bin/vendor_XT1556.prop"
elif [ "$sku" = "XT1557" ]; then
    append_prop "/system/build.prop" "/tmp/install/bin/system_XT1557.prop"
    append_prop "/vendor/build.prop" "/tmp/install/bin/vendor_XT1557.prop"
fi

unset sku

#fix permission and context
chmod 644 "/system/build.prop"
chmod 644 "/vendor/build.prop"
restorecon "/system/build.prop"
restorecon "/vendor/build.prop"

exit 0
