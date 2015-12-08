#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9209856 9ed22341d19703d6b2b415285e2e22e38f309c8e 6621184 362f48c0352c0603074a7cf3dfe729da99895ea2
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9209856:9ed22341d19703d6b2b415285e2e22e38f309c8e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6621184:362f48c0352c0603074a7cf3dfe729da99895ea2 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 9ed22341d19703d6b2b415285e2e22e38f309c8e 9209856 362f48c0352c0603074a7cf3dfe729da99895ea2:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
