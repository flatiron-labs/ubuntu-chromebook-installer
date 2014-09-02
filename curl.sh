sudo chmod 777 /var
mkdir /var/chrubuntu-installer
cd /var/chrubuntu-installer
sudo chmod 755 /var

wget https://github.com/flatiron-labs/ubuntu-chromebook-installer/archive/test.tar.gz
tar xzf test.tar.gz
cd ubuntu-chromebook-installer-test
rm curl.sh
sudo bash main.sh
