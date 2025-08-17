tput setaf 2; echo "Zach's Settings v1.0"; tput sgr0
sleep 1

# Settings
tput setaf 4; echo "dconf settings"; tput sgr0
dconf write /org/cinnamon/desktop/notifications/display-notifications false
dconf write /org/cinnamon/desktop/interface/clock-use-24h false
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /com/linuxmint/updates/hide-systray true
dconf write /org/x/apps/portal/color-scheme "'prefer-dark'"
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark-Orange'"
dconf write /org/cinnamon/desktop/interface/cursor-theme "'Bibata-Modern-Classic'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark-Orange'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Mint-Y-Orange'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Mint-Y-Dark-Orange'"
dconf write /org/gnome/desktop/interface/icon-theme "'Mint-Y-Orange'"

# Wallpaper
tput setaf 4; echo "Wallpaper"; tput sgr0
gsettings set org.cinnamon.desktop.background picture-uri "file:///home/public/rockyshore-3.jpg"

# Pin Apps
tput setaf 4; echo "Pin Apps"; tput sgr0
cp ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json ~/2.cinpanel.bk
sed -i '361 i\            "google-chrome.desktop",' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json

# Keyboard shortcuts
tput setaf 4; echo "Keyboard Shortcuts"; tput sgr0
gsettings set org.cinnamon.desktop.keybindings custom-list "['custom0']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ name 'Switch to Scott'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ command 'dm-tool switch-to-user scott'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ binding "['<Primary><Alt><Shift>s']"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot "['<Shift>Print', '<Shift><Super>s']"
# cinnamon --replace &

# Extensions
tput setaf 4; echo "Desktop Extensions"; tput sgr0
curl "https://cinnamon-spices.linuxmint.com/files/extensions/transparent-panels@germanfr.zip" > /tmp/tp.zip && unzip -o /tmp/tp.zip -d ~/.local/share/cinnamon/extensions
curl "https://cinnamon-spices.linuxmint.com/files/extensions/CinnamonBurnMyWindows@klangman.zip" > /tmp/bmw.zip && unzip -o /tmp/bmw.zip -d ~/.local/share/cinnamon/extensions
dconf write /org/cinnamon/enabled-extensions "['transparent-panels@germanfr', 'CinnamonBurnMyWindows@klangman']"

# Github credentials
# ssh-keygen -t rsa -C "webemail"
# cat ~/.ssh/id_rsa.pub
# add key to github

tput setaf 2; echo "Complete"; tput sgr0

