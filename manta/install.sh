
#!/bin/bash
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------"
echo "Устанавливаем софт"
echo "-----------------------------------------------------------------------------"
sudo apt install make clang pkg-config libssl-dev libclang-dev build-essential git curl ntp jq llvm tmux htop screen unzip cmake -y
curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_rust.sh | bash &>/dev/null
source $HOME/.cargo/env
source $HOME/.profile
source $HOME/.bashrc
sleep 1
echo "Клонируем репозиторий, начинаем билд"
echo "-----------------------------------------------------------------------------"
git clone https://github.com/Manta-Network/manta-rs.git
cd manta-rs
cargo run --release --package manta-trusted-setup --all-features --bin groth16_phase2_client register
echo "Билд закончен, переходим к инициализации ключей"
echo "-----------------------------------------------------------------------------"
