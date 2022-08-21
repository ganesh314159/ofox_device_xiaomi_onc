# Device tree of recovery for Redmi 7/Y3

## Building guide of [OrangeFox](https://wiki.orangefox.tech/en/home) recovery for Redmi 7/Y3
This guide is written according to [official building guide](https://wiki.orangefox.tech/en/dev/building)
If you get any error while building, you can pull an issue or just go to <a href="https://discord.gg/rc9FS7d9w5"><img src="https://img.shields.io/discord/581738731934056449.svg?label=discord&color=yellow&logo=discord" alt="Discord"></a>

### Requirements
1. 60GB free space on your PC/Laptop/Server.
2. At least 20GB Ram 
3. A proper ```Linux``` environment. (Not Windows, only Linux)
4. A Debian-based Linux distro (eg, Ubuntu 18.04, Linux Mint 18.3) is recommended. ArchLinux can work fine, but requires some workarounds.
5. Make sure your default python is Python2.7
You can check your python version using ```python --version```. If it shows Python 2.7.x then its fine.
If not then install python v2.7 using,
- For Debian/Ubuntu
```
sudo apt install python2 python-is-python2 -y
```
6. [Device Tree](https://gitlab.com/ganesh314159/ofox-device-xiaomi-onclite) (If you are reading this then you already got the tree)
7. NEVER BUILD AS ROOT USER OR YOUR PC/LAPTOP WILL BE DED.

### Setting up building environment
##### Installing required packages
- For Debian/Ubuntu
```
sudo apt install git aria2 -y
```
##### Installing some android buiding stuff
```
git clone https://gitlab.com/OrangeFox/misc/scripts
cd scripts
sudo bash setup/android_build_env.sh
sudo bash setup/install_android_sdk.sh
```
##### Sync OrangeFox manifest
```
cd ~/
git clone https://gitlab.com/OrangeFox/sync.git ~/sync
cd ~/sync
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
git clone https://gitlab.com/OrangeFox/misc/theme.git bootable/recovery/gui/theme # (This command will clone gui theme if its not cloned perfectly)
```
##### Place tree and kernel
Use following commands
```
cd ~/fox_12.1
git clone https://github.com/ganesh314159/ofox_device_xiaomi_onc -b 12.1 device/xiaomi/onc
git clone https://github.com/ganesh314159/ofox_kernel_xiaomi_onc -b 9.0 kernel/xiaomi/onc
```

Make any changes in tree,kernel and source if you want to or else you can go ahead.

##### Start building
Now let's start building our recovery
```
cd ~/fox_12.1
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"

lunch twrp_onc-eng && mka recoveryimage
```
This process can take upto 30 minutes to hours depending on your PC/Server specs.

Once process is done, you will see creepy OrangeFox logo and path to recovery.
Your recovery will be ```~/fox_12.1/out/target/product/onc/OrangeFox-unofficial-onc.zip```

Congratulations!! You have built recovery successfully!!!

## Contact me
You can contact me using following ways
- Email : ganesh314159@gmail.com
- Telegram : ganesh314159
- Instagram : ganesh314159
- Discord : Hououin-kyouma#1395
