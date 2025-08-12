# Software
    sudo apt-get update
    sudo apt-get --yes upgrade
    % Remove Unneeded
    sudo apt-get -y remove firefox
    % Add Chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install
    rm google-chrome-stable_current_amd64.deb
    % Add others
    sudo apt-get -y install git
    sudo apt-add-repository -y ppa:yktooo/ppa
    sudo apt-get -y update
    sudo apt-get -y install indicator-sound-switcher
    % chezmoi
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
    

