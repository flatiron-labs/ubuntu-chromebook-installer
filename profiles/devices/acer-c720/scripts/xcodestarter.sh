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
This should be put in the ubuntu installer when it adds sublime
# function setsUpSublimePreferences {
#   echo 'Setting Up SublimeText 3.0...'
#   cd ~


#   # cp -r "/Volumes/Sublime Text 2/Sublime Text 2.app" "/Applications/Sublime Text 2.app"
#   sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin
#   open "/Applications/Sublime Text 2.app" && sleep 3 && killall "Sublime Text 2"
  
#   cd "$HOME/Library/Application Support/Sublime Text 2/Installed Packages"
#   curl "https://sublime.wbond.net/Package%20Control.sublime-package" -o "Package Control.sublime-package"

#   cd "$HOME/Library/Application Support/Sublime Text 2/Packages/Color Scheme - Default"
#   curl "http://flatironschool.s3.amazonaws.com/curriculum/resources/environment/themes/Solarized%20Flatiron.zip" -o "Solarized Flatiron.zip"
#   tar -zxvf "Solarized Flatiron.zip"
#   rm "Solarized Flatiron.zip"
  
#   cd "$HOME/Library/Application Support/Sublime Text 2/Packages/Default"
#   sed -i "s/\"color_scheme\": \"Packages\/Color Scheme - Default\/Monokai.tmTheme\",/\"color_scheme\": \"Packages\/Color Scheme - Default\/Solarized Light (Flatiron).tmTheme\",/g" Preferences.sublime-settings
#   sed -i "s/\"tab_size\": 4,/\"tab_size\": 2,/g" Preferences.sublime-settings
#   sed -i "s/\"translate_tabs_to_spaces\": false,/\"translate_tabs_to_spaces\": true,/g" Preferences.sublime-settings
# }
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
panelOrderingFile="/usr/share/indicator-application/ordering-override.keyfile"
if [ -f $panelOrderingFile ]; then
  rm $panelOrderingFile
fi
curl "some_path" -o
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