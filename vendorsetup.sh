#
# Copyright (C) 2022-2023 OrangeFox Recovery Project
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# See <http://www.gnu.org/licenses/>.
#
# Please maintain this if you use this script or any part of it
#

FDEVICE="onc"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export TARGET_DEVICE_ALT="onclite"
	export OF_SCREEN_H=2280
	export OF_STATUS_H=80
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export OF_CLOCK_POS=1
	export OF_FLASHLIGHT_ENABLE=1
	export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
	export OF_NO_MIUI_PATCH_WARNING=1
	export OF_NO_RELOAD_AFTER_DECRYPTION=1
	export FOX_USE_LZMA_COMPRESSION=1
	export OF_USE_TWRP_SAR_DETECT=1
	export OF_USE_LOCKSCREEN_BUTTON=1
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
	export FOX_RESET_SETTINGS=1
	export OF_QUICK_BACKUP_LIST="/boot;/dtbo;/data;/cache;/system_root;/vendor;"
	export FOX_DELETE_AROMAFM=1
	export OF_USE_GREEN_LED=0
	export OF_DONT_KEEP_LOG_HISTORY=0
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_FORCE_MAGISKBOOT_BOOT_PATCH_MIUI=1
	export OF_NO_SPLASH_CHANGE=1
	export FOX_DELETE_INITD_ADDON=1
	export OF_SKIP_MULTIUSER_FOLDERS_BACKUP=1
	export FOX_INSTALLER_DEBUG_MODE=0
	export OF_USE_SYSTEM_FINGERPRINT=0
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk-v24.3.zip
	export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
	export OF_CHECK_OVERWRITE_ATTEMPTS=1
	export FOX_BUILD_FULL_KERNEL_SOURCES=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
 	fi
fi

