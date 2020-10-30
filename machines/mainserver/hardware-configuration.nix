# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{

    hardware.enableRedistributableFirmware = true;

    boot.initrd.availableKernelModules = [ "ohci_pci" "ehci_pci" "pata_amd" "ahci" "firewire_ohci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ "dm-snapshot" ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.enableCryptodisk = true;

    boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/29e93967-944e-4306-adb2-8d2441ca5ed5";

    fileSystems."/" =
        { device = "/dev/disk/by-uuid/4979bbc1-28e8-4505-9a3e-2d2fc0f41fa3";
          fsType = "xfs";
        };

    fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/f5979f75-d494-49ba-a149-82a612dcf543";
          fsType = "ext2";
        };

    swapDevices =
        [ { device = "/dev/disk/by-uuid/8bb10870-d71d-484b-a861-d702a2f55484"; }
        ];

    nix.maxJobs = lib.mkDefault 2;
}
