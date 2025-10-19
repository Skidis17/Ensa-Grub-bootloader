# Ensa-Grub-bootloader
In this repo, I created a simple operational dedicated Grub interface for the VMs used by our School server

## Structure

- `vm-themes/vm1/theme/` → theme files (background, logos, fonts, theme.txt)
- `vm-themes/vm1/grub.cfg` → GRUB configuration
- `vm-themes/vm1/build_iso.sh` → build ISO script

## How to build

```bash
cd vm-themes/vm1
chmod +x build_iso.sh
./build_iso.sh
qemu-system-x86_64 -cdrom vm1.iso -boot order=d -m 1024 -vga std
