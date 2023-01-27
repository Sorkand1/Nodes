# Setup node SUI Testnet2 (DOCKER)

Install Linux dependencies.

```
sudo apt update \&& apt-get install -y --no-install-recommends \
apt-transport-https \
ca-certificates \
curl \
software-properties-common
```

Install Docker.

```
curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh | bash
```

Create repository.

```
mkdir -p $HOME/sui
cd $HOME/sui
```

Download fullnode.yaml.

```
wget -O $HOME/sui/fullnode-template.yaml https://github.com/MystenLabs/sui/raw/main/crates/sui-config/data/fullnode-template.yaml
```

Download genesis state file.

```
wget -O $HOME/sui/genesis.blob  https://github.com/MystenLabs/sui-genesis/raw/main/testnet/genesis.blob
```

Download docker-compose file and update Sui Node image in it

```
IMAGE="mysten/sui-node:2698314d139a3018c2333ddaa670a7cb70beceee"
wget -O $HOME/sui/docker-compose.yaml https://raw.githubusercontent.com/MystenLabs/sui/main/docker/fullnode/docker-compose.yaml
sed -i.bak "s|image:.*|image: $IMAGE|" $HOME/sui/docker-compose.yaml
```

Start SUI Full Node

```
docker-compose up -d
```
