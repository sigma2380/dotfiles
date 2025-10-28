function write_title() {
  tput setaf 2
  echo "$1"
  tput sgr0
}

function write_section() {
  tput setaf 4
  echo "$1"
  tput sgr0
}

function add_user() {
    if id "$1" >/dev/null 2>&1; then
        echo "User '$1' exists."
    else
        echo "Adding $1 user"
        sudo useradd -s /usr/bin/bash --create-home $1
        echo "$1:$1" | sudo chpasswd
    fi
}
