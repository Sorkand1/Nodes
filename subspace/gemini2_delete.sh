#!/bin/bash
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"

echo "-----------------------------------------------------------------------------"
echo "Выполняем удаление"
echo "-----------------------------------------------------------------------------"
sudo systemctl stop subspaced subspaced-farmer
sudo systemctl disable subspaced subspaced-farmer
rm -rf ~/.local/share/subspace*
rm -rf /etc/systemd/system/subspace*
rm -rf /usr/local/bin/subspace*
echo "-----------------------------------------------------------------------------"
echo "Удаление завершено"
echo "-----------------------------------------------------------------------------"
