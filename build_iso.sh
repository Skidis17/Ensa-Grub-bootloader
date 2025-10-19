
#!/bin/bash
# ===============================
# Build GRUB ISO for VM1 with theme
# ===============================

# VM name (folder name)
VMNAME=vm1

# Temporary build directory
WORKDIR=build_iso_tmp/$VMNAME
ISOOUT=images/${VMNAME}.iso

# Clean old build
rm -rf $WORKDIR
mkdir -p $WORKDIR/boot/grub/themes/$VMNAME

# Copy grub.cfg
cp vm-themes/$VMNAME/grub.cfg $WORKDIR/boot/grub/grub.cfg

# Copy theme.txt and background.png
cp vm-themes/$VMNAME/theme/theme.txt $WORKDIR/boot/grub/themes/$VMNAME/
cp vm-themes/$VMNAME/theme/background.png $WORKDIR/boot/grub/themes/$VMNAME/
cp vm-themes/$VMNAME/theme/logo.tga $WORKDIR/boot/grub/themes/$VMNAME/
cp vm-themes/$VMNAME/theme/uae.tga $WORKDIR/boot/grub/themes/$VMNAME/

# Copy fonts folder
cp -r vm-themes/$VMNAME/theme/fonts $WORKDIR/boot/grub/themes/$VMNAME/

# Build ISO using grub-mkrescue
# Include common modules for themes
grub-mkrescue -o $ISOOUT $WORKDIR --compress=xz \
  --modules="part_msdos ext2 normal linux multiboot gfxterm png tga font"

echo "✅ ISO built successfully:"
ls -lh $ISOOUT
