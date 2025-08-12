sudo apt-add-repository -y ppa:yktooo/ppa
sudo apt-get -y update
sudo apt-get -y upgrade

% Remove Unneeded
sudo apt-get -y remove firefox

% Add Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install
rm google-chrome-stable_current_amd64.deb

% Add other software
sudo apt-get -y install git dconf-editor indicator-sound-switcher

% Chezmoi
cd /
sudo sh -c "$(curl -fsLS get.chezmoi.io)"
sudo ln /bin/chezmoi /bin/cz
cd ~
cz init https://github.com/sigma2380/dotfiles.git

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
    

