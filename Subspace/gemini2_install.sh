#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"
#Створення імя ноди
if [ ! $NODE_NAME ]; then
	read -p "Введите имя вашей ноды : " NODE_NAME
fi
echo 'Имя вашей ноды: ' $NODE_NAME
sleep 1
echo 'export SUBSPACE_NODENAME='$NODE_NAME >> $HOME/.bash_profile
echo "Готово"
echo "-----------------------------------------------------------------------------"
#Додавання Кошелька
if [ ! $YOUR_WALLET ]; then
	read -p "Адрес кошелька Gemini2: " YOUR_WALLET
fi
echo 'Адрес кошелька: ' $YOUR_WALLET
sleep 1
echo 'export SUBSPACE_WALLET='$YOUR_WALLET >> $HOME/.bash_profile
echo "Готово"
echo "-----------------------------------------------------------------------------"

#Старт установки

exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
	echo ''
else
  sudo apt update && sudo apt install curl -y < "/dev/null"
fi
bash_profile=$HOME/.bash_profile
if [ -f "$bash_profile" ]; then
    . $HOME/.bash_profile
fi
sleep 1 && curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash && sleep 1

sudo apt update && sudo apt install ocl-icd-opencl-dev libopencl-clang-dev libgomp1 -y
cd $HOME
rm -rf subspace*
wget -O subspace-node https://github.com/subspace/subspace/releases/download/gemini-2a-2022-sep-06/subspace-node-ubuntu-x86_64-gemini-2a-2022-sep-06
wget -O subspace-farmer https://github.com/subspace/subspace/releases/download/gemini-2a-2022-sep-06/subspace-farmer-ubuntu-x86_64-gemini-2a-2022-sep-06
chmod +x subspace*
mv subspace* /usr/local/bin/

systemctl stop subspaced subspaced-farmer &>/dev/null
rm -rf ~/.local/share/subspace*

source ~/.bash_profile
sleep 1

echo "[Unit]
Description=Subspace Node
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/subspace-node --chain gemini-2a --execution wasm --state-pruning archive --validator --name $SUBSPACE_NODENAME
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/subspaced.service


echo "[Unit]
Description=Subspaced Farm
After=network.target

[Service]
User=$USER
Type=simple
ExecStart=/usr/local/bin/subspace-farmer farm --reward-address $SUBSPACE_WALLET --plot-size 50G
Restart=on-failure
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target" > $HOME/subspaced-farmer.service


mv $HOME/subspaced* /etc/systemd/system/
sudo systemctl restart systemd-journald
sudo systemctl daemon-reload
sudo systemctl enable subspaced subspaced-farmer
sudo systemctl restart subspaced
sleep 10
sudo systemctl restart subspaced-farmer

echo "==================================================="
echo -e '\n\e[42mCheck node status\e[0m\n' && sleep 1
if [[ `service subspaced status | grep active` =~ "running" ]]; then
  echo -e "Your Subspace node \e[32minstalled and works\e[39m!"
  echo -e "You can check node status by the command \e[7mservice subspaced status\e[0m"
  echo -e "Press \e[7mQ\e[0m for exit from status menu"
else
  echo -e "Your Subspace node \e[31mwas not installed correctly\e[39m, please reinstall."
fi
sleep 2
echo "==================================================="
echo -e '\n\e[42mCheck farmer status\e[0m\n' && sleep 1
if [[ `service subspaced-farmer status | grep active` =~ "running" ]]; then
  echo -e "Your Subspace farmer \e[32minstalled and works\e[39m!"
  echo -e "You can check node status by the command \e[7mservice subspaced-farmer status\e[0m"
  echo -e "Press \e[7mQ\e[0m for exit from status menu"
else
  echo -e "Your Subspace farmer \e[31mwas not installed correctly\e[39m, please reinstall."
fi
