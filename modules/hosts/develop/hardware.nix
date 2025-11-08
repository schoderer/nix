{
  flake.modules.nixos."nixosConfigurations/develop" =
    {
      config,
      lib,
      modulesPath,
      pkgs,
      inputs,
      ...
    }:
    {

      boot = {
        # Use latest linux kernel
        # kernelPackages = pkgs.linuxPackages_latest;

        initrd = {
          availableKernelModules = [
            "nvme"
            "ahci"
            "xhci_pci"
            "thunderbolt"
            "usbhid"
          ];
          kernelModules = [ ];
        };
        kernelModules = [ "kvm-amd" ];
        extraModulePackages = [ ];
      };

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}