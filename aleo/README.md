<B>I have prepared a command for you to install the node in phase 3 of the testnet</B>
This is a one-line command that does these actions for you:

1. Update packages and Install the necessary packages
2. Install Rust
3. Create wallet and open ports

<b>And much more, all to make your node work</b>

```
bash <(curl -s https://raw.githubusercontent.com/sorkand1/nodes/main/aleo/install.sh)
```

<b>Useful commands</b>

Log
```
sudo journalctl -fn 100 -u aleod
```
Stop node
```
sudo systemctl stop aleod
```
Restart node
```
sudo systemctl restart aleod
```
Delete node
```
sudo systemctl disable aleod
rm -rf /etc/systemd/system/aleod.service
sudo systemctl daemon-reload
rm -rf $HOME/snarkOS /usr/bin/snarkos
```
