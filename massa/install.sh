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
. <(wget -qO- https://raw.githubusercontent.com/SecorD0/Massa/main/insert_variables.sh)
. <(wget -qO- https://raw.githubusercontent.com/SecorD0/Massa/main/multi_tool.sh) \
-rb
sudo tee <<EOF >/dev/null /etc/systemd/system/massad.service
[Unit]
Description=Massa Node
After=network-online.target

[Service]
User=$USER
WorkingDirectory=$HOME/massa/massa-node
ExecStart=$HOME/massa/massa-node/massa-node -p "$massa_password"
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable massad
sudo systemctl restart massad
sleep 1
echo "Весь необходимый софт установлен"
echo "-----------------------------------------------------------------------------"
