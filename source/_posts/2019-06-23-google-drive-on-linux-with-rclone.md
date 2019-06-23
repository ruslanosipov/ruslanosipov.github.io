---
title: "Google Drive on Linux with rclone"
date: 2019-06-23 15:00:00 +0800
categories: [CLI, Productivity]
---

Recently Dropbox hit me with the [following announcement][0]:

> Basic users have a three device limit as of March 2019.

Being the "basic" user, and relying on Dropbox across multiple machines, I got unreasonably upset ("How dare you deny me free access to your service?!") and started looking for a replacement.

I already store quite a lot of things in Google Drive, so it seemed like a no brainer: I migrated all my machines to Google Drive overnight. There was but only one problem: Google Drive has official clients for Windows and Mac, but there's nothing when it comes to Linux.

I found the Internets to be surprisingly sparse on the subject, and I had to try multiple solutions and spent more time than I'd like researching options.

The best solution for me turned out to be `rclone`, which mounts Google Drive as a directory. It requires `rclone` service to be constantly running in order to access the data, which is a plus for me - I've accidentally killed Dropbox daemon in the past and had to deal with conflicts in my files.

Install `rclone` with the package manager of your choice:

    sudo apt install rclone

From then on, [rclone website some documentation][1] when it comes to the setup. I found it somewhat difficult to parse, so here it is paraphrased:

Launch `rclone config` and follow the prompts:

* `n) New remote`
* `name> remote`
* Type of storage to configure: `Google Drive`
* Leave `client_id>` and `client_secret>` blank
* Scope: `1 \ Full access to all files`
* Leave `root_folder_id>` and `service_account_file>` blank
* Use auto config? `y`
* Configure this as a team drive? `n`
* Is this OK? `y`

From here on, you can interact with your Google Drive by running `rclone` commands (e.g. `rclone ls remote:` to list top level files). But I am more interested in a continuous running service and `mount` is what I need:

    rclone mount remote: $HOME/Drive

Now my Google Drive is accessible at `~/Drive`. All that's left is to make sure the directory is mounted on startup.

For Ubuntu/Debian, I added the following line to `/etc/rc.local` (before `exit 0`, and you need `sudo` access to edit the file):

    rclone mount remote: $HOME/Drive

For my i3 setup, all I needed was to add the following to `~/.config/i3/config`:

    exec rclone mount remote: $HOME/Drive

It's been working without an issue for a couple of weeks now - and my migration from Dropbox turned out to be somewhat painless and quick.

[0]: https://help.dropbox.com/accounts-billing/settings-sign-in/computer-limit
[1]: https://rclone.org/drive/
