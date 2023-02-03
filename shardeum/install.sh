#!/bin/bash

function logo {
  bash <(curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh)
}

function line {
  echo "-----------------------------------------------------------------------------"
}

function colors {
  GREEN="\e[1m\e[32m"
  RED="\e[1m\e[39m"
  NORMAL="\e[0m"
}

function main_tools {
  bash <(curl -s https://raw.githubusercontent.com/sorkand1/tools/main/main.sh)
}

function docker {
  bash <(curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh)
}

function setup_validator {
  curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
}

function open_validator {
  cd .shardeum
  ./shell.sh
  operator-cli gui start
}

colors
line
logo
line
echo "Installing tools and docker"
line
main_tools
docker
line
echo "Setup validator"
line
setup_validator

  
