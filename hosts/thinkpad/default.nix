# hosts/thinkpad/hardware.nix
{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "xe" ];
  boot.blacklistedKernelModules = [ "spd5118" ];
  boot.kernelModules = [ "thinkpad_acpi" ];
  boot.kernelParams = [
    "i915.force_probe=!7d45"
    "xe.force_probe=7d45"
    "pcie_aspm=force"
    "nvme_core.default_ps_max_latency_us=5500"
    "snd_hda_intel.power_save=1"
    "xe.enable_display=1"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt        
    ];
  };
  hardware.enableRedistributableFirmware = true;

  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = true;

  hardware.cpu.intel.npu.enable = false;

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"
    ACTION=="add", SUBSYSTEM=="pci", ATTR{power/control}="auto"
  '';
}
