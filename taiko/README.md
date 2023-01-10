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
