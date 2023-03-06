#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:66ab98ab8589de8464dafaa7669a516716a46fcb; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:167772160:b8b9412ca1472978cc5ebf5070b80866a1388e11 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:66ab98ab8589de8464dafaa7669a516716a46fcb && \
      log -t recovery "Installing new oplus recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oplus recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
