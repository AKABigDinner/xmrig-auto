# xmrig-auto
Installs on Raspberry Pi board to setup mining crypto.

## setup to clone file
```bash
sudo apt-get install git -y
```
```bash
git clone https://github.com/AKABigDinner/xmrig-auto.git
```
```bash
cd xmrig-auto
```
```bash
sudo chmod +x install-xmrig.sh
```
```bash
./install-xmrig.sh
```
```bash
cd xmrig/build
```
```bash
nano config.json
```
### Now edit the lines in the pool header 
```bash
    "pools": [
        {
            "algo": null,
            "coin": null,
            "url": "donate.v2.xmrig.com:3333",
            "user": "YOUR_WALLET_ADDRESS",
            "pass": "x",
            "rig-id": null,
            "nicehash": false,
            "keepalive": false,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        }
```

For the pool if you want to use unmineable here is the configuration
```bash
            "url": "rx.unmineable.com:3333",
```
Now all you need to add is the wallet.
```bash
            "user": "COIN-TYPE-IE-BTC or SHIB:ADD-YOUR-ADDRESS-HERE.ADD-YOUR-NAME-OF-YOUR-WORKER#x2tc-x2eg",
```

Now you can start mining with this command.
```bash
screen -S shib ./xmrig -c config.json
```






