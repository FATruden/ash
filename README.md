ash - is very simple wriper for standart ssh-client.

Config path: .ssh/aconfig

Config example:

[myhost1]
hostname: 1.1.1.1
user: user1
run_after: sudo su -


Example command:

`$ ash myhost1`


Connect to myhost2 over myhost1:
`$ ash myhost1 myhost2`