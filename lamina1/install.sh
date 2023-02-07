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
  sudo apt update && sudo apt upgrade -y
  apt install screen -y
}

function download {
  wget https://lamina1.github.io/lamina1/lamina1.latest.ubuntu-latest.tar.gz
  tar -xvzf lamina1.latest.ubuntu-latest.tar.gz
  rm lamina1.latest.ubuntu-latest.tar.gz
}

function create {
  cd lamina1
  curl https://lamina1.github.io/lamina1/config.testnet.tar | tar xf -
  screen -S Lamina1
}

#function screen {
  
#}

function start {
  ./lamina1-node  --config-file configs/testnet/default.json # CTRL+A+D
}

function status {
  ./get_my_nodeid.sh
  ./check-bootstrap.sh
}

function log {
  screen -r Lamina -1
}



colors
line
logo
line
echo "Installing tools"
line
main_tools
download
create
screen
line
echo "Start"
line
start
line
echo "Status and Log"
status
log
