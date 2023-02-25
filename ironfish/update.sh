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
  docker rm -f ironfish
}

function docker_pull {
  docker-compose pull
}

function docker_run {
  docker-compose run --rm --entrypoint "./bin/run migrations:start" ironfish
}

function docker_up {
  docker-compose up -d
}


colors
line
logo
line
docker_down
docker_pull
docker_run
docker_up
line
