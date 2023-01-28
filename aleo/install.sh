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
  sudo apt install curl tar wget clang pkg-config libssl-dev libclang-dev jq build-essential bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y
  sudo apt install -y uidmap dbus-user-session
}

function rust {
  bash <(curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_rust.sh)
  source $HOME/.profile
}

function build_aleo {
  cd $HOME
  git clone https://github.com/AleoHQ/snarkOS.git --depth 1
  cd snarkOS
  cargo build --release
  mv $HOME/snarkOS/target/release/snarkos /usr/bin
}

function wallet {
  snarkos account new > $HOME/aleo_account.txt
  . <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n aleo_wallet_address -v `grep -oPm1 "(?<=Address  )([^%]+)(?=$)" $HOME/aleo_account.txt`
  . <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n aleo_private_key -v `grep -oPm1 "(?<=Private Key  )([^%]+)(?=$)" $HOME/aleo_account.txt`
  echo $aleo_wallet_address $aleo_private_key
}

function open_port {
 . <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/ports_opening.sh) 3033 4133
}

function systemd_aleo {
  sudo tee <<EOF >/dev/null /etc/systemd/system/aleod.service
[Unit]
Description=Aleo Prover
After=network-online.target
[Service]
User=$USER
ExecStart=`which snarkos` start --nodisplay --prover $aleo_private_key
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

  sudo systemctl daemon-reload
  sudo systemctl enable fleek &>/dev/null
  sudo systemctl restart fleek
}

function log {
 . <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n aleo_log -v "sudo journalctl -fn 100 -u aleod" -a
}


colors
line
logo
line
echo "installing tools...."
line
main_tools
rust
line
echo "create wallet"
line
wallet
line
echo "open port"
line
open_port
line
echo "creating systemd file, adding to autostart, starting"
systemd_aleo
echo "installation complete, check logs by command:"
echo "sudo journalctl -fn 100 -u aleod"
echo "and wait for -bootstrap complete-"
