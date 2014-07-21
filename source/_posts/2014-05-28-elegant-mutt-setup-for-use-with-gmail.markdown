---
categories: [Productivity]
date: 2014-05-28 21:33:55+00:00
tags: [mutt]
title: Elegant Mutt setup for use with Gmail
---

I have been using Mutt for a while now. Wouldn't say that it saves my time, but nor does it extend the amount of time I spend reading email. For me, the best part about Mutt is that it lets me use text editor of my choice - Vim. Everything else - keyboard shortcuts, minimalist design, and simplicity - already exists in Gmail.

I found configuration below to work really well for my needs: all of the important for me Gmail features are translated. Here's my `.muttrc` file:

    bind editor <space> noop
    set alias_file        = '~/.mutt/aliases.txt'
    set copy              = no
    set display_filter    = '$HOME/.mutt/aliases.sh'
    set edit_headers
    set editor            = "vim +/^$ ++1"
    set folder            = "imaps://imap.gmail.com/"
    set hostname          = "gmail.com"
    set imap_check_subscribed
    set imap_pass         = "$PASSWORD"
    set imap_user         = "$USERNAME"
    set mail_check        = 5
    set move              = no
    set postponed         = "+[Gmail]/Drafts"
    set spoolfile         = "+INBOX"
    set text_flowed       = yes
    unset imap_passive
    unset record

    # Gmail-style keyboard shortcuts
    macro index ga "<change-folder>=[Gmail]/All Mail<enter>" "Go to all mail"
    macro index gd "<change-folder>=[Gmail]/Drafts<enter>" "Go to drafts"
    macro index gi "<change-folder>=INBOX<enter>" "Go to inbox"
    macro index gs "<change-folder>=[Gmail]/Starred<enter>" "Go to starred messages"
    macro index gt "<change-folder>=[Gmail]/Trash<enter>" "Go to trash"
    macro index,pager d "<save-message>=[Gmail]/Trash<enter><enter>" "Trash"
    macro index,pager y "<save-message>=[Gmail]/All Mail<enter><enter>" "Archive"

    source $alias_file

It is quite self-explanatory, and includes such nice features as:

  * Automatically adding addresses from read emails to address book (see below).
  * Using vim as a text editor, with an ability to edit message headers/recipients from within vim.
  * Ability to access all the default Gmail folders: All mail, Drafts, Inbox, Starred, Trash.
  * Key bindings to delete and archive messages bound to `d` and `y` respectfully (I am a huge fun of a zero-mail inbox).

You might also want to have your password encrypted by GPG as opposed to leaving it in plain text in your `.muttrc` file. You can read how to do this here: [Using Mutt with GPG](http://www.rosipov.com/blog/using-mutt-with-gpg/).

As you may have noticed, `.muttrc` above sets `display_filter` to `$HOME/.mutt/aliases.sh`. This script is being executed every time you read an email, and it collects email address to `$HOME/.mutt/aliases.txt`. Contents of the `aliases.sh` are below:

    #!/bin/sh

    MESSAGE=$(cat)

    AWK='{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) '
    AWK+='{print "alias" $0 $0;} else if (NF > 3) {print "alias", '
    AWK+='tolower($(NF-1))"-"tolower($2) $0;}}'

    NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk $AWK)

    if grep -Fxq "$NEWALIAS" $HOME/.mutt/aliases.txt; then
        :
    else
        echo "$NEWALIAS" >> $HOME/.mutt/aliases.txt
    fi

    echo "${MESSAGE}"

This script will create `aliases.txt` file containing email addresses for search and auto completion of email-addresses.
