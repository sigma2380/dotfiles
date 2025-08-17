echo "Scott's settings v1.0"

% Repo prep
sudo apt-add-repository -y ppa:yktooo/ppa
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get -y update

% Remove Unneeded
sudo apt-get -y remove firefox

% Add other software
sudo apt-get -y install git dconf-editor indicator-sound-switcher

% Upgrade all
sudo apt-get -y upgrade

% Add Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install
rm google-chrome-stable_current_amd64.deb

% Chezmoi
cd /
sudo sh -c "$(curl -fsLS get.chezmoi.io)"
sudo ln /bin/chezmoi /bin/cz
cd ~
cz init https://github.com/sigma2380/dotfiles.git

% Ghostty
ARCH="$(dpkg --print-architecture)"
curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/$ARCH/ghostty_1.1.3-2_$ARCH.deb
sudo apt install ./ghostty_1.1.3-2_$ARCH.deb

% VS Code
wget -O vscode-latest.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i vscode-latest.deb
sudo apt install -f

% Add Users
sudo useradd --create-home zach

% Settings
dconf write /org/cinnamon/desktop/notifications/display-notifications false
dconf write /org/cinnamon/desktop/interface/clock-use-24h false
dconf write /org/gnome/desktop/interface/clock-format "'12h'"
dconf write /com/linuxmint/updates/hide-systray true

% Wallpaper
sudo mkdir /home/public
sudo chmod 777 /home/public
cp ~/.local/share/chezmoi/*.jpg ~/.local/share/chezmoi/*.png /home/public
gsettings set org.cinnamon.desktop.background picture-uri "file:///home/public/spiritedaway.png"

% Github credentials
% ssh-keygen -t rsa -C "webemail"
% cat ~/.ssh/id_rsa.pub
% add key to github
    

