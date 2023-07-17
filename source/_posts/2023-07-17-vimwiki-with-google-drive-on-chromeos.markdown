---
title: "Vimwiki with Google Drive on ChromeOS"
date: 2023-07-17 08:00:00 -0700
categories: [Vim]
---

In the past few years my work heavily shifted towards being mostly done in a web browser. Much of what I use today is email and documents, and I'm able to SSH into a dedicated Linux machine for rare instances of coding or running some scripts. Because of that my primary machine these days is a trusty Chromebook - really just a web browser with an OS stapled on top of it.

I've [used Vimwiki][1] extensively for nearly 10 years now: it's a fantastic way to organize my thoughts and everything I learn about the world, and it works with the tool I know and love - Vim. My Vimwiki followed me across machines, and I use Google Drive to keep it in sync regardless of the environment I use the Vimwiki in.

It took me way longer than I would like to admit to get Vimwiki working on my Chromebook: here lies the journey of getting the Vimwiki to work on a ChromeOS. There are three major hurdles I had to jump over:

* Getting Vim to run on ChromeOS.
* Getting Vimwiki, Google Drive, and ChromeOS to play together nicely.
* Getting the web view to work.

Good news is that ChromeOS allows you to run a Linux environment. Bad news, is that things can't get a tiny bit finnicky.

First, set up Linux to run on ChromeOS via "Settings > Advanced > Developers > Linux Development Environment > Turn on". After a few prompts and a freshly brewed cup of coffee, you'll have a Debian Linux environment running on your Chromebook.

Newly installed Linux is accessible from the terminal:

{% img /images/posts/chromeos-linux-terminal.png Screenshot of a Linux terminal available from ChromeOS. %}

Pop open the terminal and update Vim and get the latest version of Python:

    sudo apt install python3 vim

Download and install Vimwiki however you'd like: there are extensive instructions on [GitHub][2]. If you're anything like me, you might have a [self-installing vim-plug][3], and all you need is just plop your existing .vimrc into your Chromebook Linux instance.

Now, for getting Google Drive, Vim, and ChromeOS to play together. ChromeOS and Linux are integrated well enough, and you can access your home directory through ChromeOS native file manager:

{% img /images/posts/chromeos-linux-files.png Screenshot of Linux home directory available in ChromeOS file manager. %}

To share files in another direction, there's a handy "Share with Linux" option for files:

{% img /images/posts/chromeos-share-with-linux.png Screenshot of "Share with Linux" option in ChromeOS file manager. %}

This option shares files with Linux via `/mnt/chromeos`. In Google Drive, I have a `vimwiki/` folder which contains `wiki/` and `wiki_html/`. I'm able to share that folder, and update Vimwiki configuration accordingly:

    let g:vimwiki_list = [{
      \ 'path': '/mnt/chromeos/GoogleDrive/MyDrive/vimwiki/wiki/',
      \ 'template_path': '/mnt/chromeos/GoogleDrive/MyDrive/vimwiki/wiki/templates',
      \ 'template_default': 'default',
      \ 'template_ext': '.html'}]

Now there's a corner case I ran into when I had Vimwiki set up on a different account than the one I use to log into the Chromebook. Only the primary account's Google Drive shows up in ChromeOS file manager. To work around that, I had to share my `vimwiki/` folder with the primary account, and then share that with Linux. The resulting directory was available through a `/mnt/chormeos/GoogleDrive/ShortcutsSharedWithMe/...`:

{% img /images/posts/chromeos-linux-shared-folders.png Screenshot of Linux folders shared with ChromeOS. %}

At this point Vimwiki works just fine: working with the wiki and generating HTML is functional. All that's left is getting the generated Vimwiki to show up in the web browser. Ever since Chrome disabled local file access, I (expectedly) haven't been able to get `:Vimwiki2HTMLBrowse` to function, since simple `file:///` URLs aren't accessible for security reasons.

That's where Python comes in, with it's native web server module. I made a small alias in my `.bashrc`:

    alias vimwiki="cd /mnt/chromeos/GoogleDrive/MyDrive/vimwiki/ && python3 -m http.server"

Next thing you know, I'm finally able to access the generated web version of my Vimwiki via `localhost:8000/wiki_html`:

{% img /images/posts/vimwiki-web-view.png Screenshot of an HTML version of Vimwiki. %}

[1]: https://www.rosipov.com/blog/personal-wiki-with-vimwiki/
[2]: https://github.com/vimwiki/vimwiki
[3]: https://www.rosipov.com/blog/cross-platform-vim-plug-setup/
