source <(curl -fsSL https://raw.githubusercontent.com/sigma2380/dotfiles/master/functions.sh)
write_title "SO's Settings v1.1"

# Common settings
source <(curl -fsSL https://raw.githubusercontent.com/sigma2380/dotfiles/master/init-common.sh)

# Wallpaper
write_section "Wallpaper"
gsettings set org.cinnamon.desktop.background picture-uri "file:///home/public/minions.jpg"

# Dconf Settings
write_section "Dconf Settings"
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark-Sand'"
dconf write /org/cinnamon/desktop/interface/cursor-theme "'Bibata-Modern-Classic'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark-Sand'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Mint-Y-Sand'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Mint-Y-Dark-Sand'"
dconf write /org/gnome/desktop/interface/icon-theme "'Mint-Y-Sand'"

# Pin Apps
write_section "Pin Apps"
cp ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json ~/2.cinpanel.bk
if ! grep -q "chrome" "~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json"; then
    sed -i '361 i\            "google-chrome.desktop",' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
else
    echo "Shortcuts already pinned."
fi

# Extension Customizations
write_section "Extension Customizations"
cp /home/public/bmw-scott.json ~/.config/cinnamon/spices/CinnamonBurnMyWindows\@klangman/CinnamonBurnMyWindows\@klangman.json
cp /home/public/tp.json ~/.config/cinnamon/spices/transparent-panels\@germanfr/transparent-panels\@germanfr.json

cinnamon --replace &
sleep 2

write_title "Complete"
