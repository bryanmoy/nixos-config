# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  ssh = import ./ssh/default.nix;
  git = import ./git/default.nix;
  starship = import ./starship/default.nix;
  foot = import ./foot.nix;
  hyprland = import ./hyprland/default.nix;
  zsh = import ./zsh/default.nix;
}
