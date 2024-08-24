+++
altitude = 0
created = '2021-01-16 02:22:13Z'
latitude = 8.9948
longitude = -79.523
tags = ['published']
title = 'DNS Configuration'
updated = '2021-01-16 14:16:27Z'
url = '/dns-configuration'
+++

Testing of this configurations can be made at [DNSLeakTest](https://www.dnsleaktest.com)

1. Install DNSCloak
1. Add Nixnet DNS to configuration. [Nixnet DNS reference](https://docs.nixnet.services/NixNet_DNS)

````
[static.'NIXNET.NY-199.195.251.84']
stamp = 'sdns://AgMAAAAAAAAADjE5OS4xOTUuMjUxLjg0AB11bmNlbnNvcmVkLm55MS5kbnMubml4bmV0Lnh5egovZG5zLXF1ZXJ5'
````

*NY Stamp*

3. Enable a fallback DNS (libredns) and the dummy VPN connection.

# Arch Linux

* Install `dnscrypt-proxy`

* Edit `/etc/dnscrypt-proxy/dnscrypt-proxy.toml`
  
  Enable the `server_names` with the allowed servers from the manually added and those from [this](https://dnscrypt.info/public-servers), enable DNSSEC and add stamp for static servers.
  
  ````
  server_names = ['NIXNET.NY-196.195.251.84','libredns']
  require_dnssec = true
  ````

* Modify `/etc/resolv.conf` to have the following content and lock it from being modified with `# chattr -i /etc/resolv.conf`
  
  ````
  nameserver ::1
  nameserver 127.0.0.1
  options edns0 single-request-reopen
  ````

* Disable any other DNS clients (i.e. `systemd-resolved`)

* Enable DNS systemd service `sudo systemctl enable dnscrypt-proxy`
