# This script customizes the Acer C720 with Codestarter-specific programs and
# settings. The 'x' that prefixes the script name ensures that this is the last
# device script to be run.

# Create a temp directory for our work
tempbuild=`mktemp -d`

echo "Installing Chrome"
cd $tempbuild
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
export DEBIAN_FRONTEND=noninteractive; apt-get -f -y -q install
touch "chrome.done"

echo "Installing Sublime Text 3"
cd $tempbuild
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_amd64.deb
dpkg -i sublime-text_build-3059_amd64.deb
touch "sublime.done"

echo "Installing Vim"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install vim
touch "vim.done"

echo "Installing Emacs"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install emacs
touch "emacs.done"

echo "Installing Curl"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install curl
touch "curl.done"

echo "Installing Postgres"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install postgresql
touch "postgres.done"

echo "Installing Parcellite"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install parcellite
touch "parcellite.done"

echo "Installing node.js & npm"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install nodejs npm
touch "nodejs.done"

echo "Installing Git"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install git
touch "git.done"

echo "Installing wallpaper"
cd $tempbuild
wget https://s3-us-west-1.amazonaws.com/mojombo-codestarter/codestarter-tree.jpg
cp codestarter-tree.jpg /usr/share/backgrounds
touch "wallpaper.done"

echo "Installing Chromebook Environmentalizer Desktop"
cd $tempbuild
touch /usr/share/upstart/xdg/autostart/chromebook-environmentalizer.desktop
chmod 777 /usr/share/upstart/xdg/autostart/chromebook-environmentalizer.desktop
echo -e "[Desktop Entry]\n\
Type=Application\n\
Name=Run Chromebook Environmentalizer\n\
Exec=/etc/chromebook-environmentalizer/setup.sh
" > /usr/share/upstart/xdg/autostart/chromebook-environmentalizer.desktop
touch "chromebook-environmentalizer-desktop.done"

echo "Installing Chromebook Environmentalizer Script"
cd $tempbuild
mkdir /etc/chromebook-environmentalizer/
touch /etc/chromebook-environmentalizer/setup.sh
chmod -R 777 /etc/chromebook-environmentalizer
echo -e "gnome-terminal -x sh -c 'curl -Lo- https://raw.githubusercontent.com/flatiron-labs/chromebook-environmentalizer/master/bootstrap.sh | bash'\n\
sudo echo -e 'Hidden=true' >> /usr/share/upstart/xdg/autostart/chromebook-environmentalizer.desktop\n\
sudo rm -rf /etc/chromebook-environmentalizer\n\
sudo rm /usr/share/upstart/xdg/autostart/chromebook-environmentalizer.desktop
" > /etc/chromebook-environmentalizer/setup.sh
touch "chromebook-environmentalizer-script.done"

# These dconf overrides do the following:
# 1. Customizes the Launcher (left dock bar) to hold commonly used programs.
# 2. Sets trackpad scrolling to "natural" (same as default on OSX).
# 3. Sets the desktop background to custom Codestarter wallpaper.
echo "Installing dconf overrides"
cd $tempbuild
echo -e "[com.canonical.Unity.Launcher]\n\
\n\
favorites=['application://nautilus.desktop', 'application://google-chrome.desktop', 'application://sublime_text.desktop', 'application://gnome-terminal.desktop', 'application://ubuntu-software-center.desktop', 'application://unity-control-center.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']
\n\
[org.gnome.settings-daemon.peripherals.touchpad]\n\
\n\
natural-scroll=true\n\
\n\
[org.gnome.desktop.background]\n\
\n\
picture-uri='file:///usr/share/backgrounds/codestarter-tree.jpg'" > /usr/share/glib-2.0/schemas/codestarter.gschema.override
glib-compile-schemas /usr/share/glib-2.0/schemas/
touch "dconf-overrides.done"

# Cleanup
rm -rf /tmp/tmp.*
