source <(curl -fsSL https://raw.githubusercontent.com/sigma2380/dotfiles/master/functions.sh)
write_title "Scott's Settings v1.1"

# Common settings
source <(curl -fsSL https://raw.githubusercontent.com/sigma2380/dotfiles/master/init-common.sh)

# Wallpaper
write_section "Wallpaper"
gsettings set org.cinnamon.desktop.background picture-uri "file:///home/public/spiritedaway.png"

# Dconf Settings
write_section "Dconf Settings"
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark-Teal'"
dconf write /org/cinnamon/desktop/interface/cursor-theme "'Bibata-Modern-Classic'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark-Teal'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Mint-Y-Teal'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Mint-Y-Dark-Teal'"
dconf write /org/gnome/desktop/interface/icon-theme "'Mint-Y-Teal'"

# Pin Apps
write_section "Pin Apps"
cp ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json ~/2.cinpanel.bk
pin_app "thunderbird.desktop"
pin_app "google-chrome.desktop"


# Extension Customizations
write_section "Extension Customizations"
cp /home/public/bmw-scott.json ~/.config/cinnamon/spices/CinnamonBurnMyWindows\@klangman/CinnamonBurnMyWindows\@klangman.json
cp /home/public/tp.json ~/.config/cinnamon/spices/transparent-panels\@germanfr/transparent-panels\@germanfr.json

cinnamon --replace &
sleep 2

write_title "Complete"
