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

Editing the file <b>.env</b>

```
sudo docker-compose down
sudo nano .env
```
In the editor we will open the <b>.env</b> file that we need to edit. We will have to change the following lines

ENABLE_PROPOSER=<b>false changes true</b>
L1_PROPOSER_PRIVATE_KEY=<b>you privat key</b>
L2_SUGGESTED_FEE_RECIPIENT=<b>you address_0x</b>
<b>Saving the editor CTRL+X,Y,Enter</b>
```
sudo docker-compose up -d
```
<b>Useful commands:</b>
Stop Node
```
docker-compose down
```
Check Logs
```
cd simple-taiko-node
docker-compose logs -f
```
Delete Node
```
docker-compose down -v
rm -f .env
cd ~
rm -rf simple-taiko-node
```





