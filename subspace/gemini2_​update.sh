#!/bin/bash
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------"
echo "Выполняем Обновление"
echo "-----------------------------------------------------------------------------"
cd $HOME
systemctl stop subspaced subspaced-farmer
wget -O subspace-node https://github.com/subspace/subspace/releases/download/gemini-2a-2022-oct-06/subspace-node-ubuntu-x86_64-gemini-2a-2022-oct-06
wget -O subspace-farmer https://github.com/subspace/subspace/releases/download/gemini-2a-2022-oct-06/subspace-farmer-ubuntu-x86_64-gemini-2a-2022-oct-06
chmod +x subspace-node
chmod +x subspace-farmer
mv subspace-node /usr/local/bin/
mv subspace-farmer /usr/local/bin/
systemctl restart subspaced
systemctl restart subspaced-farmer
echo "-----------------------------------------------------------------------------"
echo "Обновление завершено, можете проверять логи"
echo "-----------------------------------------------------------------------------"
