{
  boot.loader.systemd-boot.enable = false;
  boot.loader = {
    grub = {
      enable                = true;
      useOSProber           = true;
      copyKernels           = true;
      efiSupport            = true;
      fsIdentifier          = "label";
      devices               = [ "nodev" ];
      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
      '';
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  # boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
}
