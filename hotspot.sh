INTERFACE="wlp2s0"
SSID="1234"
PASSWORD="12345678"

nmcli dev wifi hotspot ifname "$INTERFACE" ssid "$SSID" password "$PASSWORD"

# use this command to shutdown the hotspot
# nmcli connection down Hotspot
# there also a config file in /etc/NetworkManager/system-connections for debian for auto start hotspot

