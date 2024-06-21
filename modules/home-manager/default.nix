# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  alacritty = import ./alacritty/default.nix;
  direnv = import ./direnv/default.nix;
  eza = import ./eza/default.nix;
  foot = import ./foot.nix;
  git = import ./git/default.nix;
  helix = import ./helix/default.nix;
  hyprland = import ./hyprland/default.nix;
  hyprpaper = import ./hyprpaper/default.nix;
  ion = import ./ion/default.nix;
  nushell = import ./nushell/default.nix;
  ssh = import ./ssh/default.nix;
  starship = import ./starship/default.nix;
  waybar = import ./waybar/default.nix;
  wofi = import ./wofi/default.nix;
  zsh = import ./zsh/default.nix;
}
