
#!/bin/bash


function main_tools {
  sudo apt update
  sudo apt upgrade -y
  apt install curl git -y
  
}

function rust {
  curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_rust.sh | bash
  source "$HOME/.cargo/env"
}

function build {
  git clone https://github.com/FuelLabs/fuelup/
  cd fuelup
  ./fuelup-init.sh
}


main_tools
rust 
build
