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
  sudo apt update \&& apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common
}

function docker {
  bash <(curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh)
}

function create {
  mkdir -p $HOME/sui
  cd $HOME/sui
}

function download_f {
  wget -O $HOME/sui/fullnode-template.yaml https://github.com/MystenLabs/sui/raw/main/crates/sui-config/data/fullnode-template.yaml
}

function start_file {
  IMAGE="mysten/sui-node:2698314d139a3018c2333ddaa670a7cb70beceee"
  wget -O $HOME/sui/docker-compose.yaml https://raw.githubusercontent.com/MystenLabs/sui/main/docker/fullnode/docker-compose.yaml
  sed -i.bak "s|image:.*|image: $IMAGE|" $HOME/sui/docker-compose.yaml
}

function start_conteiner {
  docker-compose up -d
}



colors
line
logo
line
echo "Installing tools and docker"
line
main_tools
docker
create
download_f
line
echo "Start"
line
start_file
start_conteiner
