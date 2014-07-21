---
categories: [Notes and rants, Productivity]
date: 2013-09-12 01:26:15+00:00
title: Remap your Caps Lock
---

The following three paragraphs are an angry `Caps Lock` rant. Feel free to skip past it or join me by commenting below.

I've had it with `Caps Lock`! How many times did I accidentally press it while hitting the `A` key! How many times did I mean `Tab` or `Shift`! There is an obvious problem with the `Caps Lock` placement, and there being only a millimeter of space to designate it from an adjacent key, it is quite difficult to notice when you accidentally press it.

Pushing `Caps Lock` is more tolerable when typing, but while using keyboard controlled software it's a real pain; `vim` turns into a beeping ravaging nightmare, `vimperator` messes up all your bookmarks... Same thing with websites supporting keyboard shortcuts.

When was the last time I ever used `Caps Lock`? Over ten years ago, when I was playing a video game that used `Caps Lock` to switch between running and walking. Em... Seriously? Time to put an end this nonsense.

## Linux and Mac

Drop this into your `~/bin/capslockremap`, and don't forget to `chmod +x ~/bin/capslockremap`. Now run the script with root privileges (that'll last you until the next restart).

    #!/bin/sh

    # This temporarily remaps the Caps Lock key to a Control key.
    # The keyboard will return to the previous settings after a
    # reboot. The Linux console and the X Window system each
    # handles keypresses separately, so each must be remapped
    # separately. First remap the X keyboard since this does not
    # require root access.

    # Remap the Caps Lock key to a Control key for
    # the X Window system.
    if type setxkbmap >/dev/null 2>&1; then
    fi

    # You have to be root to remap the console keyboard.
    if [ "$(id -u)" != "0" ]; then
      echo "This script is not running as root so"
      echo "the console Caps Lock cannot be remapped."
      echo "Perhaps you forgot to run this under sudo."
      echo "Note that this problem does not effect X."
      echo "This only effects the consoles running on"
      echo "Alt-f1 through Alt-f6."
      exit 2
    fi
    # Remap the CapsLock key to a Control key for the console.
    (dumpkeys | grep keymaps; echo "keycode 58 = Control") | loadkeys

## Windows

Download [Sysinternals Ctrl2Cap v2.0](http://technet.microsoft.com/en-us/sysinternals/bb897578.aspx), run it as Administrator with `install` flag: `ctrl2cap.exe /install`.

Source [CapsLock Remap Howto - Noah.org](http://www.noah.org/wiki/CapsLock_Remap_Howto).
