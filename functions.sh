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
