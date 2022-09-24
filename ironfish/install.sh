
#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"


#Старт установки
echo "Устанавливаем docker и создаем alias"
echo "-----------------------------------------------------------------------------"
bash <(curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh)
echo "alias ironfish='docker exec ironfish ./bin/run'" >> ~/.profile
source ~/.profile
echo "-----------------------------------------------------------------------------"
echo "Запускаем контейнеры введя команды в гайде"


