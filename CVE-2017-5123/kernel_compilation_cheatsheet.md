# How to compile and run the kernel

1. download kernel and build
```sh
git clone https://github.com/torvalds/linux
git checkout 96ca579a1ecc943b75beba58bebb0356f6cc4b51^
make defconfig
make -j 4
```

2. download busybox and build in static
```sh
make defconfig -j LDFLAGS=-static
make LDFLAGS=-static -j 4 install
```

3. prepare the filesystem
```sh
cd _install

mkdir -p etc/init.d
echo 'for i in $(seq 1 9); do mknod /dev/tty$i c 4 1; done' > etc/init.d/rcS
chmod +x etc/init.d/rcS

cd _install && find . | cpio -o --format=newc --owner=root:root > ../rootfs.img
```

4. run the system
```sh
qemu-system-x86_64 \
	-kernel bzImage \
	-initrd rootfs.img \
	-append "root=/dev/ram rdinit=/sbin/init console=ttyS0 nokaslr" \
	-nographic \
	-serial stdio \
	-monitor /dev/null
```
