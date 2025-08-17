tput setaf 2; echo "Scott's Settings v1.3.5"; tput sgr0
sleep 1

# Repo prep
tput setaf 4; echo "Repo Prep"; tput sgr0
sudo apt-add-repository -y ppa:yktooo/ppa
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
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
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install
rm google-chrome-stable_current_amd64.deb

# Chezmoi
tput setaf 4; echo "Add Chezmoi"; tput sgr0
cd /
sudo sh -c "$(curl -fsLS get.chezmoi.io)"
sudo ln /bin/chezmoi /bin/cz
cd ~
cz init https://github.com/sigma2380/dotfiles.git

# Ghostty
tput setaf 4; echo "Skipping Ghostty"; tput sgr0
# ARCH="$(dpkg --print-architecture)"
# curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/$ARCH/ghostty_1.1.3-2_$ARCH.deb
# sudo apt install ./ghostty_1.1.3-2_$ARCH.deb

# VS Code download only
tput setaf 4; echo "Download VS Code"; tput sgr0
wget -O vscode-latest.deb https://go.microsoft.com/fwlink/?LinkID=760868

# Add Users
tput setaf 4; echo "Add Users"; tput sgr0
sudo useradd --create-home zach

# Settings
tput setaf 4; echo "dconf settings"; tput sgr0
dconf write /org/cinnamon/desktop/notifications/display-notifications false
dconf write /org/cinnamon/desktop/interface/clock-use-24h false
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /com/linuxmint/updates/hide-systray true

# Wallpaper
tput setaf 4; echo "Wallpaper"; tput sgr0
sudo mkdir /home/public
sudo chmod 777 /home/public
cp ~/.local/share/chezmoi/*.jpg ~/.local/share/chezmoi/*.png /home/public
gsettings set org.cinnamon.desktop.background picture-uri "file:///home/public/spiritedaway.png"

# Pin Apps
tput setaf 4; echo "Pin Apps"; tput sgr0
# sed -i '361 i\            "com.mitchellh.ghostty.desktop"' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
sed -i '361 i\            "thunderbird.desktop",' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
sed -i '361 i\            "google-chrome.desktop",' ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
cp ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json 2.cinbak
tac 2.cinbak | sed '0,/firefox/{/firefox/d}' | tac > 3.cinbak
# tac 3.cinbak | sed '0,/Terminal/{/Terminal/d}' | tac > 4.cinbak
cp 3.cinbak ~/.config/cinnamon/spices/grouped-window-list@cinnamon.org/2.json
cinnamon --replace &

# Github credentials
# ssh-keygen -t rsa -C "webemail"
# cat ~/.ssh/id_rsa.pub
# add key to github

tput setaf 2; echo "Complete"; tput sgr0

