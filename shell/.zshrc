typeset -U path cdpath fpath manpath
for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/ym75ziw5xry66p1cxfzkds4y86fp9rv8-zsh-5.9/share/zsh/$ZSH_VERSION/help"

autoload -U compinit && compinit
# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_SAVE_NO_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


eval "$(oh-my-posh init zsh --config /home/icdt/dotfiles/shell/theme.omp.yaml)"

alias -- e='emacsclient -c -a "" -t'
alias -- e-flake='e /sudo::/home/icdt/dotfiles/nixos/flake.nix'
alias -- e-home='e /sudo::/home/icdt/dotfiles/nixos/home.nix'
alias -- e-nix=' e /sudo::/home/icdt/dotfiles/nixos/configuration.nix'
alias -- fetch=fastfetch
alias -- ff=fastfetch
alias -- hm-test=' echo yes, home manager is installed'
alias -- l='exa -alh --no-user --icons --no-permissions'
alias -- nurse='sudo nixos-rebuild switch --flake /home/icdt/dotfiles/nixos/#nix-top'
alias -- stargaze='astroterm --color --constellations --speed 1000 --fps 60 --city Memphis'