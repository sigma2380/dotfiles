curl -fsSL https://raw.githubusercontent.com/sigma2380/dotfiles/master/functions.sh | source
write_title "Common Settings v1.0"

#Dconf Settings
write_heading "Dconf Settings"
dconf write /org/cinnamon/desktop/notifications/display-notifications false
dconf write /org/cinnamon/desktop/interface/clock-use-24h false
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /com/linuxmint/updates/hide-systray true
dconf write /org/x/apps/portal/color-scheme "'prefer-dark'"

# Keyboard shortcuts
write_heading "Keyboard Shortcuts"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot-clip "['<Shift>Print', '<Shift><Super>s']"
gsettings set org.cinnamon.desktop.keybindings custom-list "['custom0', 'custom1', 'custom2', 'custom3', 'custom4']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ name 'Switch to Scott'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ command 'dm-tool switch-to-user scott'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ binding "['<Primary><Alt><Shift>s']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ name 'Switch to Chase'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ command 'dm-tool switch-to-user chase'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ binding "['<Primary><Alt><Shift>c']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ name 'Switch to Zach'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ command 'dm-tool switch-to-user zach'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ binding "['<Primary><Alt><Shift>z']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ name 'Switch to Katie'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ command 'dm-tool switch-to-user katie'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ binding "['<Primary><Alt><Shift>k']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom4/ name 'Switch to SO'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom4/ command 'dm-tool switch-to-user so'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom4/ binding "['<Primary><Alt><Shift>o']"

# Desktop Extensions
write_heading "Desktop Extensions"
curl "https://cinnamon-spices.linuxmint.com/files/extensions/transparent-panels@germanfr.zip" > /tmp/tp.zip && unzip -o /tmp/tp.zip -d ~/.local/share/cinnamon/extensions
rm /tmp/tp.zip
curl "https://cinnamon-spices.linuxmint.com/files/extensions/CinnamonBurnMyWindows@klangman.zip" > /tmp/bmw.zip && unzip -o /tmp/bmw.zip -d ~/.local/share/cinnamon/extensions
rm /tmp/bmw.zip
dconf write /org/cinnamon/enabled-extensions "['transparent-panels@germanfr', 'CinnamonBurnMyWindows@klangman']"
sleep 1
cinnamon --replace &
