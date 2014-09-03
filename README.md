=====================================
Flatiron School's Chrubuntu Installer
=====================================

This script will install everything necessary to transform an Acer C720 into a
Flatiron School Ready Laptop. Primarily this involves partitioning the built-in SSD and installing Ubuntu along with various patches and Flatiron School customizations.

Upon completion, your computer will boot by default into the Ubuntu parition see the [Trouble Shooting] section to change this.

Prerequisites
-------------

* An Acer C720 Chromebook
* A recovery image for your Chromebook in case something goes wrong. Make one via the [Chromebook Recovery Utility](https://chrome.google.com/webstore/detail/chromebook-recovery-utili/jndclpdbaamdhonoechobihbbiimdgai?hl=en) (For more details see how to set this up in the [Trouble Shooting](#trouble-shooting) section)
* An external media of **at least 1GB** (USB Flash drive or SD Card)
* Patience

Instructions
------------

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
10. On first boot you will be asked to complete your system configuration (Language, Time zone, Computer name) and create a user account
11. After you first login into your new account on Ubuntu, it will run a post install script to finish setting up the environment for your machine (RVM, Ruby, Bashrc, Git Profile, etc...). Just follow the prompts, and after that you'll be good to go

Trouble Shooting
----------------
1. How do I get into developer mode?
  - Enter [ESC + REFRESH + POWER]
  - On reboot your screen should read "OS verification off"
  - Enter [CTRL + d] to boot into Chrome OS or do nothing and wait ten seconds and it will do so by default

2. Something went wrong, and now my screen has a menacing exclamation point and reads "Chrome OS is missing or damaged"!!! What now!?!?!?!
  - No worries you just need to make a recovery USB or SD card with the [Chromebook Recovery Utility](https://chrome.google.com/webstore/detail/chromebook-recovery-utili/jndclpdbaamdhonoechobihbbiimdgai?hl=en)
  **NOTE:** Google has two recovery utilties, but this is the only one that works.You will need to switch to [Chrome Beta](https://www.google.com/chrome/browser/beta.html?platform=mac&extra=betachannel) if you are using a Mac as your primary computer.
  - Create a new image of Chrome OS specific to your machine.  As of 9/3/2014 the model number for the Acer c720 is PEPPY C6A-V3C-A86 but double check by the looking at the bottom of the scary screen you should see your machines model number
  - After the Chromebook Recovery Utility is finished creating a recovery USB or SD simply plug it into the machine and let it do it's thing. It shouldn't take more than 5 minutes

3. My computer is stuck booting into Ubuntu; how do I stop it?
  - Restert your computer
  - As soon as you see the screen with "OS verification off" press [CTRL + d]
  - Login as guest and open a shell with [CTRL + ALT + t] and enter `shell`
  - Next enter `sudo -s set_gbb_flags.sh 0x00000000`
  - Restart your computer and you will now stay on the "OS verification off". From here switch to Ubuntu [CTRL + l] or Chrome OS[CTRL + d]

4. I messed up on the post install script and entered incorrect information.  How do I change that?
  - Open the Terminal app and run this command to rerun the post-install script by entering `curl -Lo- https://raw.githubusercontent.com/flatiron-labs/chromebook-environmentalizer/master/bootstrap.sh | bash`


Future Plans
------------
Stay posted for a curl version of this script.  No more USBs!


Credits
-------
* The [Code Starter Team and Project](https://codestarter.org/about) for creating awesome install script
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