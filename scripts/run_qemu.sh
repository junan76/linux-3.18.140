#!/bin/sh

qemu-system-aarch64 -M virt \
                    -cpu cortex-a53 \
                    -kernel $(find build -name Image) \
                    -drive file=rootfs.ext4,if=none,format=raw,id=hd0 \
                    -device virtio-blk-device,drive=hd0 \
                    -append "root=/dev/vda init=/bin/init.sh" \
                    -nographic