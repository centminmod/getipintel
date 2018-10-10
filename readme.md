# GetIPInetl Proxy/VPN/Bad IP Check

Query [GetIPIntel](https://getipintel.net/) data to detect proxy, vpn or bad ips.

## How GetIPIntel Works

> Given an IP address, the system will return a probabilistic value (between a value of 0 and 1) of how likely the IP is a VPN / proxy / hosting / bad IP. A value of 1 means that IP is explicitly banned (a web host, VPN, or TOR node) by our dynamic lists. Otherwise, the output will return a real number value between 0 and 1, of how likely the IP is bad / VPN / proxy, which is inferred through machine learning & probability theory techniques using dynamic checks with large datasets. Billions of new records are parsed each month to ensure the datasets have the latest information and old records automatically expire. The system is designed to be efficient, fast, simple, and accurate.

## Usage

```
./getipintel.sh 

./getipintel.sh check email@yourdomain.com ipaddress
./getipintel.sh proxyvpn-check email@yourdomain.com ipaddress
./getipintel.sh proxyvpn-badipcheck email@yourdomain.com ipaddress
```

You need to pass your own valid email address as second field and the IP address you want to check as the third field

```
./getipintel.sh check email@yourdomain.com xxx.xxx.xxx.xxx
{
  "status": "success",
  "result": "1",
  "queryIP": "xxx.xxx.xxx.xxx",
  "queryFlags": "b",
  "queryOFlags": null,
  "queryFormat": "json",
  "contact": "email@yourdomain.com"
}
```

`proxyvpn-check` option returning value of `1` so likely a proxy, vpn etc

```
./getipintel.sh proxyvpn-check email@yourdomain.com xxx.xxx.xxx.xxx
1
```

`proxyvpn-badipcheck` option returning value of `1` so likely a proxy, vpn including bad IP checks etc

```
./getipintel.sh proxyvpn-badipcheck email@yourdomain.com xxx.xxx.xxx.xxx
1
```