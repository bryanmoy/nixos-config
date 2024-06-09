# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
    outputs.homeManagerModules.ssh
    outputs.homeManagerModules.git
    outputs.homeManagerModules.starship
    outputs.homeManagerModules.foot
    outputs.homeManagerModules.hyprland
    outputs.homeManagerModules.zsh
    outputs.homeManagerModules.ion
    outputs.homeManagerModules.nushell
    outputs.homeManagerModules.direnv
    outputs.homeManagerModules.eza
    outputs.homeManagerModules.helix

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    stateVersion = "24.05";
    username = "bryanmoy";
    homeDirectory = "/home/bryanmoy";
    file = {
      ".ssh/allowed_signers".text =
        "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvMq/Zpl7z9G5EOv9lfI7XK+U4SnNSq9PMGU6Kv7SaC";
    };
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  modules = {
    ssh.enable = true;
    git.enable = true;
    starship.enable = true;
    foot.enable = true;
    hyprland.enable = true;
    zsh.enable = true;
    ion.enable = true;
    nushell.enable = true;
    direnv.enable = true;
    eza.enable = true;
    helix.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
