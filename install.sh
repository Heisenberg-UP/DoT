# Script will build your systemd-resolved service to run on port 853 over TLS encryption

# Variables
dir=$(pwd)
user=$(whoami)

# Install necessary packages
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install ngrep systemd-resolved -y

# Move vanilla resolved configuration file to DoT folder
sudo mv /etc/systemd/resolved.conf $dir/DoT/files/resolved.conf.original
sudo chown $user:$user $dir/DoT/files/resolved.conf.original
chmod 600 $dir/DoT/files/resolved.conf.original

# Copy custom resolved configuation file to /etc/systemd/ folder
sudo cp $dir/DoT/files/resolved.conf /etc/systemd/resolved.conf
sudo chmod 644 ~/etc/systemd/resolved.conf

