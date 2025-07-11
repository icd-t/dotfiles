# Dotfiles

![Example screenshot](https://github.com/icd-t/dotfiles/blob/main/example.png)
![Example screenshot](https://github.com/icd-t/dotfiles/blob/main/example3.webp)

A repository of the main configuration files I use on my NixOS machine.

## Includes

Includes configs for the following programs:

 - `doom` - Doom Emacs
 - `fastfetch` - My custom Fastfetch theme
 - `hypr` - Hyprland, Hyprland plugins, wallpapers
 - `kitty` - Kitty terminal emulator
 - `lf` - LF file manager
 - `nixos` - NixOS system configurations including `configuration.nix`
 - `rofi` - Rofi program launcher
 - `shell` - Contains my own custom theme for `oh-my-posh`, and my `.zshrc`.
 - `waybar` - Waybar status bar

## Config it Yourself

Extra things you can add to your system to make it look a little nicer. These are things I have done to my system but dont necessarily fall into a .config file.

 - Add a Catppuccin theme to Firefox with this  [theme](https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-red/) by Lexi.
 - Convert any image to a specific theme you want with [Wallpaper Theme Converter](https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-red/). Some of the wallpapers in `hypr/wp/mocha` are my own photos that have been converted with this tool. The other wallpapers came from [this](https://github.com/orangci/walls-catppuccin-mocha) repo by orangci.
  - Some variables are hard-coded because I am lazy. You should replace my user name with yours in the files `shell/theme.omp.yaml`, and `fastfetch/config.jsonc`.
  - If you use a different home dirrectory structure than me, add icons to your most used dirs in the `mapped_locations` section of `shell/theme.omp.yaml`.

## Extras

Some custom media I made for my system. You can use these as you wish, just credit me if you share your own configurations online.

### Catppuccin Themed NixOS Wallpaper

![Wallpaper](https://github.com/icd-t/dotfiles/blob/main/hypr/wp/mocha/nixos_wp_cat_glow.png?raw=true)

### Custom NixOS Logo for Fastfetch

![Logo](https://github.com/icd-t/dotfiles/blob/main/fastfetch/nixos_custom_cat.png?raw=true)
