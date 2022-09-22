#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"
echo "Устанавливаем ноду"
echo "-----------------------------------------------------------------------------"
sudo apt update && sudo apt upgrade -y
sudo apt install wget jq git build-essential pkg-config libssl-dev -y
massa_version=`wget -qO- https://api.github.com/repos/massalabs/massa/releases/latest | jq -r ".tag_name"`; \
wget -qO $HOME/massa.tar.gz "https://github.com/massalabs/massa/releases/download/${massa_version}/massa_${massa_version}_release_linux.tar.gz"; \
tar -xvf $HOME/massa.tar.gz; \
rm -rf $HOME/massa.tar.gz
chmod +x $HOME/massa/massa-node/massa-node \
$HOME/massa/massa-client/massa-client
. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n massa_password
sleep 1
echo "Весь необходимый софт установлен"
echo "-----------------------------------------------------------------------------"
