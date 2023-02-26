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

function setup_compose {
  curl -o docker-compose.yml https://raw.githubusercontent.com/muon-protocol/muon-node-js/testnet/docker-compose-pull.yml
}

function docker_start {
  docker compose up -d
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
echo "Setup compose"
line
setup_compose
line
echo "Start"
docker_start
line
  
