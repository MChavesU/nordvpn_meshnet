#!/bin/bash

apt update && apt upgrade -y

#always start nordvpn daemon
/etc/init.d/nordvpn start;

nordvpn conect

sleep 5;

tail -f /dev/null