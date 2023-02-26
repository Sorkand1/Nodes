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

function docker_down {
  docker-compose down
}

function docker_delete {
  rm -rf .ironfish
  rm -rf .fuelup
  rm -rf .okp4d
  rm -rf .manta
}


colors
line
logo
line
docker_down
docker_pull
docker_delete
line
