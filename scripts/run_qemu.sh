#!/bin/bash

QEMU=qemu-system-aarch64

QEMU_OPTS=("-M" "virt"
    "-cpu" "cortex-a53"
    "-kernel" "$(find build -name Image)"
    "-drive" "file=rootfs.ext4,if=none,format=raw,id=hd0"
    "-device" "virtio-blk-device,drive=hd0"
    "-append" "root=/dev/vda init=/bin/init.sh"
    "-nographic")

main() {
    case $1 in
    r | run)
        "${QEMU}" "${QEMU_OPTS[@]}"
        ;;
    d | debug)
        "${QEMU}" "${QEMU_OPTS[@]}" -s -S
        ;;
    *)
        echo "run_qemu.sh <run|debug>"
        ;;
    esac
}

main $@