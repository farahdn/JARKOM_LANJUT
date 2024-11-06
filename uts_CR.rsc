# nov/06/2024 17:35:47 by RouterOS 6.49.10
# software id = 5E9J-IUIA
#
# model = RB941-2nD
# serial number = HFA09BYXTTN
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface ipip
add local-address=10.60.6.138 name=ipip-tunnel1-CR-KHI remote-address=\
    10.60.6.140
add local-address=10.60.6.138 name=ipip-tunnel2-CR-KJ remote-address=\
    10.60.6.139
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.1.1/24 interface=ether2 network=192.168.1.0
add address=10.208.10.1 interface=ipip-tunnel2-CR-KJ network=10.208.10.2
add address=10.208.20.1 interface=ipip-tunnel1-CR-KHI network=10.208.20.2
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add distance=1 dst-address=192.168.2.0/24 gateway=10.208.10.2
add distance=1 dst-address=192.168.3.0/24 gateway=10.208.20.2
/system clock
set time-zone-name=Asia/Jakarta
