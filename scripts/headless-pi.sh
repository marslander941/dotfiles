#!/bin/bash

# WARNING MESSAGE
# read -p "Press enter to continue"
clear
echo Mount SD card from GUI file manager before running this script!
sleep .5
read -p "Are you sure you want to continue (y/N)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo 'Proceeding in 3 seconds...' && sleep 3
else
        echo 'Exiting...'; exit
fi

# Enable SSH:
touch /run/media/$USER/boot/ssh

# Set user pi and password raspberry:
cat > /run/media/$USER/boot/userconf <<- 'EOF'
	pi:$6$/4.VdYgDm7RJ0qM1$FwXCeQgDKkqrOU3RIRuDSKpauAbBvP11msq9X58c8Que2l1Dwq3vdJMgiZlQSbEXGaY5esVHGBNbCxKLVNqZW1
EOF

# Connect to wifi on boot:
cat > /run/media/$USER/boot/wpa_supplicant.conf <<- 'EOF'
	ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev  
	update_config=1   
	country=US  
	
	network={ 
	ssid=""
	scan_ssid=1
	psk="" 
	key_mgmt=WPA-PSK
	}  
EOF

