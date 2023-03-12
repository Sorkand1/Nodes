#!/bin/bash

source <(curl -s https://raw.githubusercontent.com/R1M-NODES/utils/master/common.sh)

printLogo

printGreen "Install docker and docker compose"
bash <(curl -s https://raw.githubusercontent.com/R1M-NODES/utils/master/docker-install.sh)

printGreen "Install and running node"
curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh

cd .shardeum
./shell.sh
operator-cli gui start


printGreen "Node installed"
printGreen "Create a new account with name wallet for sending and receiving coins: ironfish wallet:create myname"
printGreen "Export an account to a mnemonic 24 word phrase: ironfish wallet:export myname --mnemonic --language=English"
printGreen "Export an account: ironfish wallet:export myname"
printGreen "Display your account address: ironfish wallet:address myname"
