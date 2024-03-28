# Script will build your systemd-resolved service to run on port 853 over TLS encryption

# Variables
dir=$(pwd)
user=$(whoami)

# Install necessary packages
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install ngrep unbound -y

# Move vanilla resolved configuration file to DoT folder
sudo cp /etc/unbound/unbound.conf $dir/DoT-AdBlock/files/unbound.conf.original
sudo chown $user:$user $dir/DoT-AdBlock/files/unbound.conf.original
chmod 400 $dir/DoT-AdBlock/files/resolved.conf.original

# Copy custom resolved configuation file to /etc/systemd/ folder
sudo cp $dir/DoT-AdBlock/files/unbound.conf /etc/unbound/unbound.conf
sudo chmod 644 /etc/unbound/unbound.conf

