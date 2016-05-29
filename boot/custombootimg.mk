LOCAL_PATH := $(call my-dir)

uncompressed_ramdisk := $(PRODUCT_OUT)/ramdisk.cpio
$(uncompressed_ramdisk): $(INSTALLED_RAMDISK_TARGET)
	zcat $< > $@

INIT_SONY := $(PRODUCT_OUT)/utilities/init_sony

$(INSTALLED_BOOTIMAGE_TARGET): \
    $(PRODUCT_OUT)/kernel \
    $(uncompressed_ramdisk) \
    $(recovery_uncompressed_ramdisk) \
    $(INSTALLED_RAMDISK_TARGET) \
    $(INIT_SONY) \
    $(PRODUCT_OUT)/utilities/toybox \
    $(PRODUCT_OUT)/utilities/keycheck \
    $(MKBOOTIMG) $(MINIGZIP) \
    $(INTERNAL_BOOTIMAGE_FILES)

	@echo -e ${CL_CYN}"----- Making boot image ------"${CL_RST}
	$(hide) rm -fr $(PRODUCT_OUT)/combinedroot
	$(hide) mkdir -p $(PRODUCT_OUT)/combinedroot/sbin

	$(hide) cp $(uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp -n $(uncompressed_ramdisk) $(recovery_uncompressed_ramdisk)
	$(hide) cp $(recovery_uncompressed_ramdisk) $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/toybox $(PRODUCT_OUT)/combinedroot/sbin/
	$(hide) cp $(PRODUCT_OUT)/utilities/keycheck $(PRODUCT_OUT)/combinedroot/sbin/

	$(hide) cp $(INIT_SONY) $(PRODUCT_OUT)/combinedroot/sbin/init_sony
	$(hide) chmod 755 $(PRODUCT_OUT)/combinedroot/sbin/init_sony
	$(hide) ln -s sbin/init_sony $(PRODUCT_OUT)/combinedroot/init

	$(hide) $(MKBOOTFS) $(PRODUCT_OUT)/combinedroot/ > $(PRODUCT_OUT)/combinedroot.cpio
	$(hide) cat $(PRODUCT_OUT)/combinedroot.cpio | gzip > $(PRODUCT_OUT)/combinedroot.fs

	$(hide) $(MKBOOTIMG) \
        --kernel $(PRODUCT_OUT)/kernel \
        --ramdisk $(PRODUCT_OUT)/combinedroot.fs \
        --cmdline "$(BOARD_KERNEL_CMDLINE)" \
        --base $(BOARD_KERNEL_BASE) \
        --pagesize $(BOARD_KERNEL_PAGESIZE) \
        -o $(INSTALLED_BOOTIMAGE_TARGET)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) \
        --kernel $(PRODUCT_OUT)/kernel \
        --ramdisk $(PRODUCT_OUT)/ramdisk-recovery.img \
        --cmdline "$(BOARD_KERNEL_CMDLINE)" \
        --base $(BOARD_KERNEL_BASE) \
        --pagesize $(BOARD_KERNEL_PAGESIZE) \
        -o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
