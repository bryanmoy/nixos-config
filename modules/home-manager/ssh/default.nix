{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.ssh;

in {
    options.modules.ssh = { enable = mkEnableOption "ssh"; };
    config = mkIf cfg.enable {
        programs.ssh = {
            enable = true;
            extraConfig = ''
              Host *
                  IdentityAgent ~/.1password/agent.sock
                  AddressFamily inet
            '';
        };
    };
}
