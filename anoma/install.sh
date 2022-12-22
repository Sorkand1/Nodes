#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"

apt update &>/dev/null
apt install git &>/dev/null
apt install apt-transport-https ca-certificates software-properties-common curl &>/dev/null
curl -f -s -S -L https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &>/dev/null
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &>/dev/null
apt update &>/dev/null
cd /root &>/dev/null
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y &>/dev/null
sudo systemctl status docker &>/dev/null

echo "Нода добавлена в автозагрузку на сервере, запущена"
echo "-----------------------------------------------------------------------------"
