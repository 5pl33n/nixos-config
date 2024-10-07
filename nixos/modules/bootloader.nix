{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  # boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ]; 
}
