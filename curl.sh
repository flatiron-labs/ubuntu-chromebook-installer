mkdir $HOME/chrubuntu-installer
cd $HOME/chrubuntu-installer

curl https://codeload.github.com/flatiron-labs/ubuntu-chromebook-installer/archive/master.zip
unzip ubuntu-chromebook-installer-master.zip
sudo bash main.sh

rm -rf $HOME/chrubuntu-installer