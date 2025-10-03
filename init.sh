tput setaf 2; echo "Scott's Settings v1.5"; tput sgr0
sleep 1

# Repo prep
tput setaf 4; echo "Repo Prep"; tput sgr0
sudo apt-add-repository -y ppa:yktooo/ppa
sudo apt-get -y update

# Remove Unneeded Software
tput setaf 4; echo "Remove Unneeded Software"; tput sgr0
sudo apt-get -y remove firefox

# Add other software
tput setaf 4; echo "Add Software in repos"; tput sgr0
sudo apt-get -y install git dconf-editor indicator-sound-switcher jq

# Upgrade all
tput setaf 4; echo "Upgrade all"; tput sgr0
sudo apt-get -y upgrade

# Add Chrome
tput setaf 4; echo "Add Chrome"; tput sgr0
if which "google-chrome" >/dev/null 2>&1; then
    echo "Already installed.  Bypassing."
else
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install
    rm google-chrome-stable_current_amd64.deb
fi

# Chezmoi
tput setaf 4; echo "Add Chezmoi"; tput sgr0
if which "cz" >/dev/null 2>&1; then
    echo "Already installed.  Bypassing."
else
    cd /
    sudo sh -c "$(curl -fsLS get.chezmoi.io)"
    sudo ln /bin/chezmoi /bin/cz
    cd ~
    cz init https://github.com/sigma2380/dotfiles.git
fi

# VS Code download only
tput setaf 4; echo "Download VS Code"; tput sgr0
if [ -e ~/Downloads/vscode-latest.deb ]; then
    echo "Already downloaded.  Bypassing."
else
    wget -O ~/Downloads/vscode-latest.deb https://go.microsoft.com/fwlink/?LinkID=760868
fi

# Add Users
tput setaf 4; echo "Add Users"; tput sgr0
if id "zach" >/dev/null 2>&1; then
    echo "User 'zach' exists."
else
    sudo useradd -s /usr/bin/bash --create-home zach
    echo "zach:zach" | sudo chpasswd
fi
if id "chase" >/dev/null 2>&1; then
    echo "User 'chase' exists."
else
    sudo useradd -s /usr/bin/bash --create-home chase
    echo "chase:chase" | sudo chpasswd
fi
if id "so" >/dev/null 2>&1; then
    echo "User 'so' exists."
else
    sudo useradd -s /usr/bin/bash --create-home so
    echo "so:so" | sudo chpasswd
fi

# Settings
tput setaf 4; echo "dconf settings"; tput sgr0
dconf write /org/cinnamon/desktop/notifications/display-notifications false
dconf write /org/cinnamon/desktop/interface/clock-use-24h false
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /com/linuxmint/updates/hide-systray true
dconf write /org/x/apps/portal/color-scheme "'prefer-dark'"
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark-Teal'"
dconf write /org/cinnamon/desktop/interface/cursor-theme "'Bibata-Modern-Classic'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark-Teal'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Mint-Y-Teal'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Mint-Y-Dark-Teal'"
dconf write /org/gnome/desktop/interface/icon-theme "'Mint-Y-Teal'"

# Wallpaper
tput setaf 4; echo "Wallpaper"; tput sgr0
sudo mkdir /home/public
sudo chmod 777 /home/public
cp ~/.local/share/chezmoi/*.jpg ~/.local/share/chezmoi/*.png /home/public
gsettings set org.cinnamon.desktop.background picture-uri "file:///home/public/spiritedaway.png"

# Pin Apps
tput setaf 4; echo "Pin Apps"; tput sgr0
cp ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json ~/2.cinpanel.bk
if ! grep -q "thunderbird" "~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json"; then
    sed -i '361 i\            "thunderbird.desktop",' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
    sed -i '361 i\            "google-chrome.desktop",' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
else
    echo "Shortcuts already pinned."
fi

# Keyboard shortcuts
gsettings set org.cinnamon.desktop.keybindings custom-list "['custom0', 'custom1']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ name 'Switch to Zach'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ command 'dm-tool switch-to-user zach'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ binding "['<Primary><Alt><Shift>z']"
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ name 'Switch to Chase'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ command 'dm-tool switch-to-user chase'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ binding "['<Primary><Alt><Shift>c']"
gsettings set org.cinnamon.desktop.keybindings.media-keys area-screenshot-clip "['<Shift>Print', '<Shift><Super>s']"

# Extensions
tput setaf 4; echo "Desktop Extensions"; tput sgr0
curl "https://cinnamon-spices.linuxmint.com/files/extensions/transparent-panels@germanfr.zip" > /tmp/tp.zip && unzip -o /tmp/tp.zip -d ~/.local/share/cinnamon/extensions
rm /tmp/tp.zip
curl "https://cinnamon-spices.linuxmint.com/files/extensions/CinnamonBurnMyWindows@klangman.zip" > /tmp/bmw.zip && unzip -o /tmp/bmw.zip -d ~/.local/share/cinnamon/extensions
rm /tmp/bmw.zip
dconf write /org/cinnamon/enabled-extensions "['transparent-panels@germanfr', 'CinnamonBurnMyWindows@klangman']"
sleep 1
cinnamon --replace &
sleep 2
cp ~/.local/share/chezmoi/*.json /home/public
cp /home/public/bmw-scott.json ~/.config/cinnamon/spices/CinnamonBurnMyWindows\@klangman/CinnamonBurnMyWindows\@klangman.json
cp /home/public/tp.json ~/.config/cinnamon/spices/transparent-panels\@germanfr/transparent-panels\@germanfr.json

# Zach script
cp ~/.local/share/chezmoi/init-zach.sh /home/public

tput setaf 2; echo "Complete"; tput sgr0

