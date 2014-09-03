
===================================================
Flatiron School installer for Ubuntu on Chromebooks
===================================================

This script will install everything necessary to transform an Acer C720 into a
Flatiron School Ready Laptop. Primarily this involves partitioning the built-in SSD and installing Ubuntu along with various patches and Flatiron School customizations.

Upon completion, your computer will boot by default into the Ubuntu Parition see the [Trouble Shooting] section to change this.

Prerequisites
-------------

* An Acer C720 Chromebook
* A recovery image for your Chromebook in case something goes wrong. In order to achieve that, go to [chrome://imageburner](chrome://imageburner), on your Chromebook, and follow the instructions
* Chromebook in developer mode
* An external media of **at least 1GB** (USB Flash drive or SD Card)
* Patience

Usage
-----

**ATTENTION: This will wipe everything on your device**

1. Enable [developer mode](http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/acer-c720-chromebook).
2. Download the [latest version of this installer](https://github.com/flatiron-labs/ubuntu-chromebook-installer/archive/master.zip) and extract it to a removable media
3. Boot into ChromeOS, connect to a wireless network and log in as guest
4. Open a shell (CTRL + ALT + t) and type `shell`
5. From the shell go to the location of the script on the removable media `cd /media/removable/` and press **[TAB] [TAB]** on your keyboard to show and auto-complete your removable media path automatically
6. Run the script with `sudo bash main.sh`
7. On the first run you will be asked how much storage space you want to dedicate to Ubuntu. We suggest choosing the default.
8. After the first run, your system will reboot to complete the initial formatting, then you will need to re-run the script (steps 3-6) to complete the installation process (only once more)
9. Follow the prompt to complete the installation and be sure to remove the thumb drive
11. On first boot you will be asked to complete your system configuration (Language, Time zone, Computer name) and create a user account

Quick Tips:
-----------
1)Switch to Ubuntu(CTRL+L) or Chrome OS(CTRL+D) when the "OS verification" screen comes on 
2)Remember that you must be in developer mode in order to switch between Ubuntu or Chrome OS

Credits
-------
* The [Code Starter Team and Project](https://codestarter.org/about) for creating the basis of this awesome install script
* The [Ubuntu](http://ubuntu.com/) development team for creating this awesome Linux distribution
* Parimal Satyal for making a [guide](http://realityequation.net/installing-elementary-os-on-an-hp-chromebook-14) on how to install Ubuntu on the HP Chromebook 14
* Jay Lee for creating [ChrUbuntu](http://chromeos-cr48.blogspot.ca/) from which I use a modified version
* SuccessInCircuit on reddit for making a [guide](http://www.reddit.com/r/chrubuntu/comments/1rsxkd/list_of_fixes_for_xubuntu_1310_on_the_acer_c720/) on how to fix mostly everything with the Acer C720
* Benson Leung for his [cros-haswell-modules](https://googledrive.com/host/0B0YvUuHHn3MndlNDbXhPRlB2eFE/cros-haswell-modules.sh) script
* [Quatral Solutions](http://www.quatral.com) for providing the Acer C720 Chromebook
* Jesus Lopez - Thanks for helping testing ChromeeOS for the Asus Chromebox
* Jonathan Frank (Setsuna666) for creating Chromeeos and the Acer C720 profile
* Everyone who contributed
* Kevin Whitaker for c720p patches and Ubuntu specific changes from elementary OS