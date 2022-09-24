
#!/bin/bash

echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/welcome.sh | bash
echo "-----------------------------------------------------------------------------"


#Старт установки

bash <(curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh)
echo "alias ironfish='docker exec ironfish ./bin/run'" >> ~/.profile
source ~/.profile
echo "-----------------------------------------------------------------------------"
echo "Запускаем контейнеры введя команды в гайде"
sudo tee <<EOF >/dev/null $HOME/docker-compose.yaml
version: "3.3"
services:
 ironfish:
  container_name: ironfish
  image: ghcr.io/iron-fish/ironfish:latest
  restart: always
  entrypoint: sh -c "sed -i 's%REQUEST_BLOCKS_PER_MESSAGE.*%REQUEST_BLOCKS_PER_MESSAGE = 5%' /usr/src/app/node_modules/ironfish/src/syncer.ts && apt update > /dev/null && apt install curl -y > /dev/null; ./bin/run start"
  healthcheck:
   test: "curl -s -H 'Connection: Upgrade' -H 'Upgrade: websocket' http://127.0.0.1:9033 || killall5 -9"
   interval: 180s
   timeout: 180s
   retries: 3
  volumes:
   - $HOME/.ironfish:/root/.ironfish
 ironfish-miner:
  depends_on:
   - ironfish
  container_name: ironfish-miner
  image: ghcr.io/iron-fish/ironfish:latest
  command: miners:start --threads=1
  restart: always
  volumes:
   - $HOME/.ironfish:/root/.ironfish
EOF
docker-compose up -d

