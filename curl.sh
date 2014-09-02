sudo chmod 777 /var
mkdir /var/chrubuntu-installer
cd /var/chrubuntu-installer
sudo chmod 755 /var

wget https://github.com/codestarterorg/ubuntu-chromebook-installer/archive/master.tar.gz
tar xzf master.tar.gz
cd ubuntu-chromebook-installer-master
sudo bash main.sh
