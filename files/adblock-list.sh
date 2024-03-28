#!/bin/bash

sudo python3 ~/DoT-AdBlock/files/adblock-script > ~/DoT-AdBlock/files/adblock.conf

sudo cp ~/DoT-AdBlock/files/adblock.conf /etc/unbound/unbound.conf.d/adblock.conf

sudo chown $user:$user ~/DoT-AdBlock/files/adblock.conf

sudo chmod 400 ~/DoT-AdBlock/files/adblock.conf

exit 0
