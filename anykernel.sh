# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=GoreKernel-ksu-next
kernel.compiler=Crdroid Clang
kernel.made=adams4d13
kernel.version=4.14.3XX
message.word=Flashing Done, You can now reboot.
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=vayu
device.name2=bhima
device.name3=
device.name4=
device.name5=
supported.versions=11.0-15.0
supported.patchlevels=
'; } # end properties

ui_print " "
ui_print "- Kernel Name : GoreKernel-ksu-next"
ui_print "- Kernel Version : 4.14.3XX"
ui_print "- Compiler : Crdroid Clang"
ui_print "- Device : vayu/bhima"
ui_print "- Build Date : 2025-04-19"
ui_print "- Maintainer : adams4d13"
ui_print " "
ui_print "- Preparing Environment Setup ..."
ui_print " "

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## AnyKernel boot install
dump_boot;
write_boot;
## end boot install

# shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;

# reset for vendor_boot patching
#reset_ak;

## AnyKernel vendor_boot install
#split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

#flash_boot;
## end vendor_boot install
