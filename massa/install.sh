#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"
echo "Устанавливаем софт"
echo "-----------------------------------------------------------------------------"

sudo apt update -y &>/dev/null
sudo apt install build-essential libssl-dev libffi-dev python3-dev screen git python3-pip python3.*-venv -y &>/dev/null
sudo apt-get install libgmp-dev -y &>/dev/null
pip3 install fastecdsa &>/dev/null
sudo apt-get install -y pkg-config &>/dev/null
curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_ufw.sh | bash &>/dev/null
curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_rust.sh | bash &>/dev/null
rustup default nightly &>/dev/null
source $HOME/.cargo/env &>/dev/null
sleep 1
echo "Весь необходимый софт установлен"
echo "-----------------------------------------------------------------------------"
