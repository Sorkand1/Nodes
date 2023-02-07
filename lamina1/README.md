INSTALL FOR 1 COMMAND

```
bash <(curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/lamina1/install.sh)
```
Start Node

```
./lamina1-node  --config-file configs/testnet/default.json
```

<b>Press CTRL+A+D </b>

Get NODE ID
```
./get_my_nodeid.sh
```

Check Status
```
./check-bootstrap.sh
```
Check Logs
```
screen -r lamina1
```
<b>Safe KEY</b>

Delete node
```
screen -X -S lamina1 quit
```
```
cd 
rm -rf lamina1
rm -rf .lamina1
```

