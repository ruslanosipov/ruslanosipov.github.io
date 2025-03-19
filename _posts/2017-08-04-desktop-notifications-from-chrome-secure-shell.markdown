---
title: "Desktop notifications from Chrome Secure Shell"
date: 2017-08-04 17:33:16 +0000
categories: [Productivity, CLI]
---

For the past year or two I've been working in the cloud. I use Chrome [Secure Shell][1] to connect to my machines, and it works rather well. In fact, I moved away from my work Linux/Mac laptops towards an [HP Chromebook][2], which fullfilled both requirements I had: a browser and a terminal. One thing I missed about a Linux machine though is lack of `notify-send`-like functionality, especially when working with long-running builds.

Yesterday I pinged hterm team for assistance with this matter, and turns out recent release of Secure Shell supports Chrome desktop notifications! Furthermore, two amazing engineers (thanks Andrew and Mike!) crafted an [hterm-notify][3] script, which propagates notifications to Chrome, and by extent to desktop!

I made a few tiny changes, mainly since I don't use `screen`, and tmux sets my `$TERM` to `screen-256color` for some reason:

    #!/bin/sh
    # Copyright 2017 The Chromium OS Authors. All rights reserved.
    # Use of this source code is governed by a BSD-style license that can be
    # found in the LICENSE file.

    # Write an error message and exit.
    # Usage: <message>
    die() {
      echo "ERROR: $*"
      exit 1
    }

    # Send a notification.
    # Usage: [title] [body]
    notify() {
      local title="${1-}" body="${2-}"

      case ${TERM-} in
      screen*)  # This one's really tmux
        printf '\ePtmux;\e\e]777;notify;%s;%s\a\e\\' "${title}" "${body}"
        ;;
      *)        # This one's plain hterm
        printf '\e]777;notify;%s;%s\a' "${title}" "${body}"
        ;;
      esac
    }

    # Write tool usage and exit.
    # Usage: [error message]
    usage() {
      if [ $# -gt 0 ]; then
        exec 1>&2
      fi
      cat <<EOF
    Usage: hterm-notify [options] <title> [body]

    Send a notification to hterm.

    Notes:
    - The title should not have a semi-colon in it.
    - Neither field should have escape sequences in them.
      Best to stick to plain text.
    EOF

      if [ $# -gt 0 ]; then
        echo
        die "$@"
      else
        exit 0
      fi
    }

    main() {
      set -e

      while [ $# -gt 0 ]; do
        case $1 in
        -h|--help)
          usage
          ;;
        -*)
          usage "Unknown option: $1"
          ;;
        *)
          break
          ;;
        esac
      done

      if [ $# -eq 0 ]; then
        die "Missing message to send"
      fi
      if [ $# -gt 2 ]; then
        usage "Too many arguments"
      fi

      notify "$@"
    }
    main "$@"

Throwing this in as `~/bin/notify` (not forgetting to `chmod +x` and having `~/bin` in the `$PATH`) I can get a notification when a particular long running command is complete:

    sleep 30 && notify Hooray "The sleep's done!"

[1]: https://chrome.google.com/webstore/detail/secure-shell/pnhechapfaindjhompbnflcldabbghjo?hl=en
[2]: http://amzn.to/2hv68Ck
[3]: https://chromium-review.googlesource.com/c/601549/3/hterm/etc/hterm-notify.sh
