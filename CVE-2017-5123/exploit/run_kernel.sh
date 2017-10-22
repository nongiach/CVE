qemu-system-x86_64 -kernel bzImage -initrd rootfs.img -append "root=/dev/ram rdinit=/sbin/init console=ttyS0 nokaslr" -nographic -serial stdio -monitor /dev/null

# qemu-system-x86_64 -kernel bzImage -initrd busybox-1.27.2/rootfs.img -append "root=/dev/ram rdinit=/sbin/init console=ttyS0 nokaslr" -nographic -serial stdio -monitor /dev/null
# qemu-system-x86_64 -kernel bzImage -initrd busybox-1.27.2/rootfs.img -append "root=/dev/ram rdinit=/sbin/init console=ttyS0" -nographic -serial stdio -monitor /dev/null
