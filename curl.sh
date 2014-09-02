sudo chmod 777 /var
mkdir /var/chrubuntu-installer
cd /var/chrubuntu-installer
sudo chmod 755 /var

wget https://github.com/flatiron-labs/ubuntu-chromebook-installer/archive/new-curl.tar.gz
tar xzf new-curl.tar.gz
cd ubuntu-chromebook-installer-new-curl
sudo bash main.sh