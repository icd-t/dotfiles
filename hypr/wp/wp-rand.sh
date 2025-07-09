wp="$(ls ~/.config/hypr/wp/mocha/ | shuf -n 1)"
hyprctl hyprpaper preload "~/.config/hypr/wp/mocha/$wp"
sleep 1
hyprctl hyprpaper wallpaper ",~/.config/hypr/wp/mocha/$wp"
