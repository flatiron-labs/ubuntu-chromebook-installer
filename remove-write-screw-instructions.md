# How to set your Acer C720 Chromebook to boot to Ubuntu by default.
by [Mojombo](https://gist.github.com/mojombo)

1. Place your closed laptop on a soft surface, upside down.
1. Use a sharp knife to cut a hole in the warranty sticker (YES THIS WILL VOID THE WARRANTY).
1. Remove the 13 screws with a small phillips head screwdriver (PH1 size works well). Be careful, the screws are very small and will strip easily if you use the wrong size screwdriver.
1. Remove the bottom of the laptop by pulling up on it near the hinges. It takes a bit of pressure to remove, but if you lift it from the back (near the hinges) the same way you would open a laptop screen, the hooks won't break (even though they will make a loud snapping sound).
1. Remove the BIOS write-protect screw. It is labeled as #7 in [this image](http://www.chromium.org/_/rsrc/1381990807648/chromium-os/developer-information-for-chrome-os-devices/acer-c720-chromebook/c720-chromebook-annotated-innards.png)
1. With the bottom off, turn over the laptop and open the screen.
1. Plug the laptop in (it must be plugged in to boot with the bottom off).
1. Boot to ChromeOS (Ctrl-D during white screen).
1. Sign in (you may sign in as a guest and you won't be using the internet).
1. Open a terminal with Ctrl-Alt-T
1. Type `shell` and press Enter.
1. Run `sudo /usr/share/vboot/bin/set_gbb_flags.sh 0x489`
1. It should take a few seconds to complete and print a SUCCESS message when it's done.
1. Shutdown laptop and unplug power cable.
1. Close lid and place upside-down on a soft surface.
1. Replace the write-protect screw.
1. Replace the bottom cover.
1. Screw the cover back on.
1. Done!

Thanks to John Lewis for the [original tip on how to do this](https://johnlewis.ie/how-to-make-seabios-the-default-on-your-acer-c720/): 