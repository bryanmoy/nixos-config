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
    outputs.homeManagerModules.foot

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

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };
  };

  # SSH
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ~/.1password/agent.sock
          AddressFamily inet
    '';
  };

  # Git
  programs.git = {
    enable = true;
    userName = "Bryan Moy";
    userEmail = "dev@bryanmoy.com";
    extraConfig = {
      init.defaultBranch = "main";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvMq/Zpl7z9G5EOv9lfI7XK+U4SnNSq9PMGU6Kv7SaC";
      commit.gpgsign = true;
      tag.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.program = "op-ssh-sign";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
  };

  # Shell
  programs.starship.enable = true;
  programs.starship.settings = {}; # TODO: https://starship.rs/config/

  # Zsh
  programs.zsh.enable = true;
  programs.zsh.shellAliases = {
    ls = "eza";
    ll = "eza";
  };

  # Ion
  programs.ion.enable = true;
  programs.ion.shellAliases = {
    ls = "eza";
    ll = "eza";
  };

  # Nushell
  programs.nushell.enable = true;
  programs.nushell.shellAliases = {
    ll = "ls -al";
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # Eza
  programs.eza.enable = true;
  programs.eza.extraOptions = [
    # Display options
    # https://github.com/eza-community/eza#display-options
    "--long"
    "--classify=always"
    
    # Filtering options
    # https://github.com/eza-community/eza#filtering-options
    "--all"
    "--group-directories-first"

    # Long view options
    # https://github.com/eza-community/eza#long-view-options
    "--binary"
    "--group"
    "--header"
    "--time-style=long-iso"
  ];

  # Helix
  programs.helix.enable = true;
  # programs.helix.themes = {};
  programs.helix.settings = { # https://docs.helix-editor.com/configuration.html
    theme = "tokyonight";
    editor = {
      line-number = "relative";
      lsp.display-messages = true;
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };
  programs.helix.languages = {};
  programs.helix.defaultEditor = true;

  # Wezterm
  programs.wezterm.enable = true;
  programs.wezterm.extraConfig = ''
    return {
      font = wezterm.font("FiraCode Nerd Font Mono"),
      font_size = 10.0,
      color_scheme = "Tokyonight",
    }
  '';

  modules = {
    foot.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
