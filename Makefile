#
# Makefile for the linux ext2-filesystem routines.
#

obj-$(CONFIG_EXT2_FS) += ext2.o

ext2-y := balloc.o dir.o file.o ialloc.o inode.o \
	  ioctl.o namei.o super.o symlink.o

ext2-$(CONFIG_EXT2_FS_XATTR)	 += xattr.o xattr_user.o xattr_trusted.o
ext2-$(CONFIG_EXT2_FS_POSIX_ACL) += acl.o
ext2-$(CONFIG_EXT2_FS_SECURITY)	 += xattr_security.o
ext2-$(CONFIG_EXT2_FS_XIP)	 += xip.o

PWD = $(shell pwd)
KERNEL_DIR = /lib/modules/$(shell uname -r)/build
default:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules
clean:
	rm -rf *.o *.ko .*.cmd *.mod.c .tmp_versions \
	Modules.markers modules.order Module.symvers
