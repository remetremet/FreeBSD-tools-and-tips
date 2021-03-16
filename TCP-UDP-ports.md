Common TCP and UDP ports
===
Known ports (0-1023)
---
|Port/Protocol|Service|Port/Protocol|Service
|---:|:---|---:|:---|
19/TCP,UDP|Char generator|20/TCP,UDP,SCTP|FTP data
21/TCP|FTP|22/TCP|SSH
23/TCP|Telnet|25/TCP|SMTP
49/TCP,UDP|TACACS|53/TCP,53/UDP|DNS
67/UDP|BOOTP/DHCP|68/UDP|BOOTP/DHCP
69/UDP|TFTP|70/TCP|Gopher
79/TCP,UDP|Finger|80/TCP,UDP|HTTP
81/TCP|HTTP alternative|88/TCP|HTTP alternative
110/TCP|POP3|111/TCP,UDP|RPC
113/TCP,UDP|IDENT|119/UDP|NNTP
123/UDP|NTP|135/TCP,UDP|RPC
137/TCP,UDP|Netbios|138/TCP,UDP|Netbios
139/TCP,UDP|Netbios/SMB|143/TCP|IMAP
161/UDP|SNMP|162/UDP|SNMP Trap
179/TCP,UDP 179/SCTP|BGP|194/TCP,UDP|IRC
201-208/TCP,UDP|Appletalk|389/TCP|LDAP
427/TCP,UDP|SLP|443/TCP,UDP|HTTPS
444/TCP|Cisco Webex|445/TCP|SMB
465/TCP|SMTPS|500/TCP,UDP|IPsec/IKE
514/TCP|rsh|514/UDP|Syslog
515/TCP|Printer|520/UDP|RIP
521/UDP|RIPng|521/TCP|IRC
546/TCP,UDP|DHCPv6|547/TCP,UDP|DHCPv6
548/TCP|AFS|554/TCP,UDP|RTSP
563/TCP,UDP|NNTPS|587/TCP|SMTP/STARTTLS
623/TCP,UDP|IPMI/BMC|631/TCP,UDP|IPP
635/TCP,UDP|NFS|636/TCP|LDAPS
689/TCP,UDP|NMAP|694/UDP|HA-cluster
703/TCP,UDP|FortiGate|730/TCP,UDP|FortiGate
781-783/TCP,UDP|HP iLO|853/UDP|DNS/TLS
860/TCP,UDP|iSCSI|861/TCP,UDP|OWAMP
862/TCP,UDP|TWAMP|873/TCP|Rsync
902-904/TCP|VMware|912/TCP|APEX
913/TCP,UDP|APEX,VMware|950/TCP|NFS
953/TCP,UDP|DNS/RDNC|987/TCP,UDP|SNMP
990/TCP|FTPS|993/TCP|IMAPS
994/TCP,UDP|IRCS|995/TCP|POP3S


Known ports (1024-16383)
---
|Port/Protocol|Service|Port/Protocol|Service
|---:|:---|---:|:---|
1024/TCP|kdm|1167/UDP,SCTP|Cisco IP SLA
1194/TCP,UDP|OpenVPN|1433/TCP,UDP|MS SQL
1434/TCP,UDP|MS SQL|1521/TCP|Oracle SQL
1645-1646/UDP|RADIUS|1701/TCP,UDP|L2TP
1720/TCP|H.323|1723/TCP,UDP|PPTP
1812-1813/UDP|RADIUS|1880/TCP|Node-RED
1883/TCP|MQTT|UDP|1900|SSDP/UPnP
2008/TCP|Teamspeak|2010/UDP|Teamspeak
2049/TCP,UDP,SCTP|NFS|2055-2056/UDP|NetFlow
2062/UDP|Skype|2121/TCP|FTP Proxy
2156/TCP|Citrix SD-WAN|2371/TCP|HP RDA
2375/TCP|Docker|2376/TCP|Docker SSL
2525/TCP|SMTP Alternative|2746/TCP,UDP|CheckPoint VPN
2775/TCP|SMPP|3000/TCP|NodeJS, Ruby
3000/UDP|BitTorrent|3128/TCP|WWW Proxy
3225/TCP,UDP|FC over IP|3260/TCP,UDP|iSCSI
3268/TCP,UDP|LDAP-GC|3269/TCP,UDP|LDAP-GC SSL
3283/TCP,UDP|ARD|3299-3301/TCP|SAP R/3
3306/TCP|MySQL/MariaDB|3389/TCP|RDP
3478/TCP,UDP|STUN|3478-3481/UDP|MS Teams
3478-3497/UDP|Apple FaceTime|3493/TCP|NUT
3998/TCP,UDP|Nagios|3544/TCP,UDP|Teredo
4021/TCP|Envisalink|4025/TCP|Envisalink
4070/TCP,UDP|Amazon Echo|4242-4243/TCP,UDP|CrashPlan
4244/TCP|Viber|4369/TCP|RabbitMQ, SolarWinds
4380/UDP|Steam|4500/UDP|IPsec
4713/TCP|PulseAudio|4786/TCP|Cisco Smart Install
4949/TCP|Munin|5000/TCP|SSDP/UPnP
5001/TCP,UDP|iPerf|TCP,UDP|5004|Cisco Webex
5004-5005/UDP|RTSP|TCP|5037|Android ADB
5060-5061/TCP|SIP|5190-5193/TCP,UDP|ICQ, AIM, Apple iChat
5201/TCP,UDP|iPerf3|5220/TCP,UDP|iChat
5222/TCP,UDP|WhatsApp, Google Talk, iChat|5223-5224/TCP|Apple Notifications
5228/TCP,UDP|Google Play|5242-5243/TCP,UDP|Viber
5246/UDP|FortiGate|5246-5247/UDP|CAPWAP
5349/TCP,UDP|STUNS|5353/UDP|mDNS
5355/UDP|LLMNR|5432/TCP|PostgreSQL
5521/TCP|Skype|5631-5632/TCP,UDP|pcAnywhere
5666-5667/TCP|Nagios|5671-5672/TCP,UDP|RabbitMQ, SolarWinds
5678/UDP|Mikrotik Discovery|5683/UDP|CoAP
5684/UDP|CoAPS|5800/TCP|VNC
5900-5903/TCP|VNC|5938-5939/TCP|TeamViewer
5999/TCP,UDP|CVSup|6121/TCP|SPDY
6343/UDP|OpenFlow, NetFlow|6514/TCP,UDP|Syslog TLS
6568/TCP|AnyDesk|6653/TCP|OpenFlow
6660-6669/TCP|IRC|6882-6900/TCP|BitTorrent
7000-7006/TCP|AFSTCP|7070/TCP|AnyDesk, RealAudio, RTSP
7210/TCP|SAP MaxDB|7275-7276/TCP|A-GPS
7351/UDP|Meraki|7423/UDP|ReadyShare
7631/TCP|Tesla Messaging|8000/TCP|HTTP Alternative
8010/TCP|FortiGate|8013-8014/TCP|FortiGate
8080/TCP|HTTP Alternative|8081/TCP|HTTP Alternative
8086/TCP|InfluxDB|8291-8292/TCP|Mikrotik WinBox
8333/TCP|Bitcoin|8384/TCP|Syncthing
8443/TCP|HTTPS alternative|8543/TCP|Ubiquiti Cloud
8544/TCP|JSON-RPC|8728-8729/TCP|Mikrotik API
8843/TCP|Ubiquiti Cloud|8866/TCP|NextPVR
8880/TCP|Ubiquiti Cloud|8883/TCP|MQTT
8889/TCP|Splunk|8899/TCP|Qnap
8953/TCP|Unbound|9030/TCP|Tor
9050-9051/TCP|Tor|9100/TCP|Printer
9150/TCP|Tor|9200/TCP|Elasticsearch
9300/TCP|Elasticsearch|9324/TCP|Google Assistant
9332-9333/TCP|Litecoin|9418/TCP,UDP|Git
9582/TCP|FortiGuard|9987/UDP|Teamspeak
9997-9998/TCP|Splunk|10001/TCP|Ubiquiti Discovery
10011/TCP|Teamspeak|10050-10052/TCP|Zabbix
11000/TCP,UDP|Cisco BGP|11112/TCP,UDP|DICOM
11143/TCP|UniFi|12346/UDP|Cisco SD-WAN
12446/UDP|Cisco SD-WAN|12489/TCP|Nagios
12546/UDP|Cisco SD-WAN|12646/UDP|Cisco SD-WAN


Known ports (16384-65535)
---
|Port/Protocol|Service|Port/Protocol|Service
|---:|:---|---:|:---|
16384-16403/UDP|iChat|17440-17444/TCP|VMware
17472/TCP|VMware|17477/TCP|VMware
17500/TCP|Dropbox|17771/UDP|Hamachi
17777-17779/TCP|SolarWinds|17790-17791/TCP|SolarWinds
17988/TCP|HP iLO|18231-18234/TCP 18231-18234/UDP|CheckPoint
18242-18243/TCP|CheckPoint|18264/TCP|CheckPoint
18332/TCP|Bitcoin|18443-18444/TCP|Siemens Gigaset
19302-19308/TCP,UDP|Google VoIP|19421/TCP,UDP|Zoom
19424/TCP,UDP|Zoom|20001/UDP|Qnap
20002/TCP,UDP|TP-Link|20048-20049/TCP,UDP,SCTP|NFS
20561/UDP|Mikrotik|21027/UDP|Syncthing
22000/TCP|Syncthing|23399/TCP,UDP|Skype
23456/TCP|Cisco SD-WAN|23556/TCP|Cisco SD-WAN
23656/TCP|Cisco SD-WAN|23756/TCP|Cisco SD-WAN
25672/TCP|SolarWinds|27000-27050/TCP,UDP|Steam
27017/TCP|Mongo DB|28221/TCP|eMule, BitTorrent
30033/TCP|Teamspeak|30301/TCP|BitTorrent
32976/TCP|Hamachi|33434-33534/UDP|traceroute
33434/UDP|Cisco Webex|34571-34572/TCP|IBM ServeRAID
37483/TCP|Google Drive|37777/TCP|NVR
41144/TCP|Teamspeak|41230/TCP,UDP|Z-wave
42172/TCP|iTunes|42557/TCP|iTunes
43439/TCP,UDP|eQ3|43440/TCP,UDP|Cisco EnergyWise
43441/TCP,UDP|Cisco DB|43594-43595/TCP,UDP|Runescape
43958/TCP|Serv-U FTP|44123/TCP|Z-wave
44333-44337/TCP,UDP|Kerio|44445/TCP|Acronis Backup
44501/TCP|Kerio|44818/TCP,UDP|Rockwell Automation, Cisco
47000/TCP,UDP|mbus|47001/TCP|WinRM
51820/UDP|Wireguard VPN|53484/TCP|Linksys
54925-54926/UDP|Brother MFP|57621/UDP|Spotify
62078/UDP|UPnP, iTunes|62514-62515/UDP|Cisco VPN
62516/UDP|Sonicwall VPN|63333/TCP|TrippLite UPS
65002/UDP|D-Link|