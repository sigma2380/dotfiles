source <(curl -fsSL https://raw.githubusercontent.com/sigma2380/dotfiles/master/functions.sh)

write_title "Scott's Settings v1.6"
sleep 1

# Repo prep
write_section "Repo Prep"
sudo apt-add-repository -y ppa:yktooo/ppa
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get -y update

# Remove Unneeded Software
write_section "Remove Unneeded Software"
sudo apt-get -y remove firefox firefox-locale-en

# Add other software
write_section "Add Software in repos"
sudo apt-get -y install git dconf-editor indicator-sound-switcher jq code

# Upgrade all and clean up
write_section "Upgrade all"
sudo apt-get -y upgrade
sudo apt-get -y autoremove

# Clone dotfiles and move public files
write_section "Clone dotfiles repo and public files"
if [ ! -d "~/.local/share/dotfiles" ]; then
    git clone https://github.com/sigma2380/dotfiles.git ~/.local/share/dotfiles
fi
git -C ~/.local/share/dotfiles pull
sudo mkdir /home/public
sudo chmod 777 /home/public
cd ~/.local/share/dotfiles
cp *.jpg *.png *.sh *.json /home/public
chmod 777 *.sh
cd ~

# Add Chrome
write_section "Add Chrome"
if which "google-chrome" >/dev/null 2>&1; then
    echo "Already installed.  Bypassing."
else
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install
    rm google-chrome-stable_current_amd64.deb
fi

# Add Users
tput setaf 4; echo "Add Users"; tput sgr0
add_user "zach"
add_user "chase"
add_user "katie"
add_user "so"

write_title "Complete"
