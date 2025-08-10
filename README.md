# Software
    sudo apt update
    sudo apt upgrade
    
## chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install
    rm google-chrome-stable_current_amd64.deb

## misc
    sudo apt remove firefox
    sudo apt install git
    sudo apt-add-repository ppa:yktooo/ppa
    sudo apt-get update
    sudo apt-get install indicator-sound-switcher

## chezmoi
    cd /
    sudo sh -c "$(curl -fsLS get.chezmoi.io)"
    sudo ln /bin/chezmoi /bin/cz
    cd ~

# Users
    sudo useradd --create-home zach

# Settings

    ssh-keygen -t rsa -C "webemail"
    cat ~/.ssh/id_rsa.pub
    % add key to github
    git remote add origin git@github.com:sigma2380/dotfiles.git
    git pull origin main
    

