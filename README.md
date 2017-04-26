ash - is very simple wriper for standart ssh-client.

Config path:

`.ssh/aconfig`

Config example:

```
[myhost1]
hostname: 192.168.1.4
user: user1
run_after: sudo su -
```

Example command:

`$ ash myhost1`


Connect to host2 over host1:

`$ ash host1 host2`


# Installation

## Mac OS

`$ sudo easy_install pip`
`$ pip install configparser`
