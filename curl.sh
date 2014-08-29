chmod -R 777 /etc
sudo mkdir /etc/chrubuntu-installer
cd /etc/chrubuntu-installer

wget https://github.com/flatiron-labs/ubuntu-chromebook-installer/archive/master.tar.gz
tar xzf master.tar.gz
cd ubuntu-chromebook-installer-master
sudo bash main.sh