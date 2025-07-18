{ config, pkgs, ... }:

{
home.username = "icdt";
home.homeDirectory = "/home/icdt";
home.stateVersion = "25.05";

programs.zsh = {
enable = true;
shellAliases = {
hm-test = " echo yes, home manager is installed";
nurse = "sudo nixos-rebuild switch --flake /home/icdt/dotfiles/nixos/#nix-top";
stargaze = "astroterm --color --constellations --speed 1000 --fps 60 --city Memphis";
fetch = "fastfetch";
e = "emacsclient -c -a \"\" -t";
e-nix = " e /sudo::/home/icdt/dotfiles/nixos/configuration.nix";
e-home = "e /sudo::/home/icdt/dotfiles/nixos/home.nix";
e-flake = "e /sudo::/home/icdt/dotfiles/nixos/flake.nix";
l = "exa -alh --no-user --icons --no-permissions";
ff = "fastfetch -c /home/icdt/dotfiles/fastfetch/config-full.jsonc";
};
initExtra = ''
  eval "$(oh-my-posh init zsh --config /home/icdt/dotfiles/shell/theme.omp.yaml)"
'';
};

home.packages = with pkgs; [
bat
dconf
];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

home.sessionPath = [
"/home/icdt/.emacs.d/bin"
];

programs.git = {
enable = true;
userName = "icdt";
userEmail = "p@jnck.net";
};

home.enableNixpkgsReleaseCheck = false;

services.udiskie = {
    enable = true;
    settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
        };
    };
};
}
