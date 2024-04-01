# Script will build your systemd-resolved service to run on port 853 over TLS encryption

# Variables
dir=$(pwd)
user=$(whoami)

# Install necessary packages
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install ngrep unbound iptables-persistent -y

# Move vanilla resolved configuration file to DoT folder
sudo cp /etc/unbound/unbound.conf $dir/DoT-AdBlock/files/unbound.conf.original
sudo chown $user:$user $dir/DoT-AdBlock/files/unbound.conf.original
chmod 400 $dir/DoT-AdBlock/files/resolved.conf.original

# Copy custom resolved configuation file to /etc/systemd/ folder
sudo cp $dir/DoT-AdBlock/files/unbound.conf /etc/unbound/unbound.conf
sudo chown root:root /etc/unbound/unbound.conf
sudo chmod 644 /etc/unbound/unbound.conf

# Make symbolic link for logrotate file
sudo ln -s $dir/DoT-AdBlock/files/logrotate-unbound /etc/logrotate.d/logrotate-unbound
sudo chown root:root $dir/DoT-AdBlock/files/logrotate-unbound
sudo chmod 644 $dir/DoT-AdBlock/files/logrotate-unbound

# Add AppArmor file
sudo cp $dir/DoT-AdBlock/files/usr.sbin.unbound /etc/apparmor.d/local/usr.sbin.unbound
sudo chown root:root /etc/apparmor.d/local/usr.sbin.unbound
sudo chmod 644 /etc/apparmor.d/local/usr.sbin.unbound

# Test Unbound without firewall
sudo iptables -F
sudo systemctl try-restart unbound




