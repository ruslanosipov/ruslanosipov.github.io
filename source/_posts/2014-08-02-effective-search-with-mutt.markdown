---
title: "Effective search with Mutt"
date: 2014-08-02 13:32:51 -0700
categories: [Productivity, CLI]
tags: [mutt]
---

I generally don't use Mutt for everyday emails - I find smooth non-monospace
fonts to be more pleasant to the eye, and the visualization my browser offers
is hard to beat. The main use-case for me is composing long emails: Mutt lets
me use my favorite text editor, which speeds up the editing of long and
carefully composed responses.

Recently I added a new use-case to my work flow: searching through emails.
Mutt has a powerful built-in regular-expressions engine, which is something the
web Gmail client is missing.

Mutt has two ways of finding things: search and limit. "Search" just jumps from
one matching letter to another, something along the lines what `/` command does
in `less`, `more`, or `vim`. "Limit" is something I am more used to with the
web client, and it's what I use the most.

## Using limits

Limit works the way regular search works in Gmail: it limits the view to
conversations matching the query. Hit `l`, and enter a search query.

By default, Mutt will only search through the subject lines, but this behaviour
can be changed by prefixing the command with a special identifier. For
instance, searching for `~b oranges` will limit the view to all the messages
which mention "oranges" in the message body. Here are a couple I use the most:

* `~b` -- Search in the message body.
* `~B` -- Search in the whole message.
* `~f` -- Message originated from the user.
* `~Q` -- Messages which have been replied to.

You can find full list in the [Mutt Advanced Usage Manual][1].

Patterns can be chained to produce narrower results: `~f joe ~B apples`. This
will search for a message mentioning "apples" coming from an author whose name
contains "joe".

### Caching mail for faster search

You may find that searching whole messages is slow, especially if you have more
than a couple hundred messages to search through. That's because by default
Mutt does not store messages for local use. This can be changed by specifying
`header_cache` and `message_cachedir` variables in your `.muttrc` file:

	set header_cache     = "$HOME/Mail"
	set message_cachedir = "$HOME/Mail"

Now, after you perform your first search, it will cache every message you open,
making all the consecutive searches lightning fast.

Oh, and keep in mind, Mutt stores messages and headers in plain text, so make
sure the cache directory is not shared with anyone but yourself.

[1]: http://www.sendmail.org/~ca/email/mutt/manual-4.html#ss4.2
