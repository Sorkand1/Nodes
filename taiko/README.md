# Setup Taiko node + Proposer

Install Docker

```
curl -s https://raw.githubusercontent.com/sorkand1/tools/main/install_docker.sh | bash
```

Clone a repository

```
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
```

Copy .env.sample in .env

```
cp .env.sample .env
```

Start node

```
docker-compose up -d
```

Waiting for the you node sync,you can see the lash block [HERE](https://l2explorer.a1.taiko.xyz/)

then you can run proposer(If you want)

Editing the file .env

```
sudo docker-compose down
sudo nano .env
```
In the editor we will open the <b>.env<b> file that we need to edit. We will have to change the following lines
