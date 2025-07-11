# Dotfiles

![Example screenshot](https://github.com/icd-t/dotfiles/blob/main/example.png)

A repository of the main configuration files I use on my NixOS machine.

## Includes

Includes configs for the following programs:

 - `doom` - Doom Emacs
 - `fastfetch` - Fastfetch
 - `hypr` - Hyprland, Hyprland plugins, wallpapers
 - `kitty` - Kitty terminal emulator
 - `lf` - LF file manager
 - `nixos` - NixOS system configurations including `configuration.nix`
 - `rofi` - Rofi program launcher
 - `shell` - currently only contains a custom theme for oh-my-posh. Will eventually contain `.zshrc`
 - `waybar` - Waybar status bar

## Extras

Extra things you can add to your system to make it look a little nicer. These are things I have done to my system but dont necessarily fall into a .config file.

 - Add a Catppuccin theme to Firefox with this  [theme](https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-red/) by Lexi.
 - Convert any image to a specific theme you want with [Wallpaper Theme Converter](https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-red/). Some of the wallpapers in `hypr/wp/mocha` are my own photos that have been converted with this tool. The other wallpapers came from [this](https://github.com/orangci/walls-catppuccin-mocha) repo by orangci.
  - Add your username to the user map in `shell/theme.omp.yaml`
