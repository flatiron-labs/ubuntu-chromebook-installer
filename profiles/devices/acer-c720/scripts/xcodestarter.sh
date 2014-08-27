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

# echo "Installing RVM and Ruby"
# cd $tempbuild
# \curl -sSL https://get.rvm.io | bash -s stable --ruby
# source ~/.bashrc
# source /etc/profile.d/rvm.sh
# touch "rvm.done"

# echo "Installing Ruby 2.1.2"
# cd $tempbuild
# rvm install ruby-2.1.2
# touch "ruby.done"s

echo "Installing node.js & npm"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install nodejs npm
touch "nodejs.done"

echo "Installing Git"
cd $tempbuild
export DEBIAN_FRONTEND=noninteractive; apt-get -y -q install git
touch "git.done"

echo 'Getting Flatiron School .bash_profile'
cd $tempbuild
if [ -f .bash_profile ]; then
  mv .bash_profile .bash_profile.old
fi
curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/bash_profile" -o ".bash_profile"
touch "bash_profile.done"

echo "Installing wallpaper"
cd $tempbuild
wget https://s3-us-west-1.amazonaws.com/mojombo-codestarter/codestarter-tree.jpg
cp codestarter-tree.jpg /usr/share/backgrounds
touch "wallpaper.done"

# These dconf overrides do the following:
# 1. Customizes the Launcher (left dock bar) to hold commonly used programs.
# 2. Sets trackpad scrolling to "natural" (same as default on OSX).
# 3. Sets the desktop background to custom Codestarter wallpaper.
echo "Installing dconf overrides"
cd $tempbuild
echo -e "[com.canonical.Unity.Launcher]\n\
\n\
favorites=['application://nautilus.desktop', 'application://google-chrome.desktop', 'application://sublime_text.desktop', 'application://gnome-terminal.desktop', 'application://ubuntu-software-center.desktop', 'application://unity-control-center.desktop']
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
# removed this from favorites arr 'unity://running-apps', 'unity://expo-icon', 'unity://devices'

source /etc/profile.d/rvm.sh

# Cleanup
rm -rf /tmp/tmp.*