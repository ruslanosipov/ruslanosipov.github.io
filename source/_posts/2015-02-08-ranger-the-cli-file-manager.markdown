---
title: "Ranger - the CLI file manager"
date: 2015-02-08 19:33:16 -0800
categories: [Productivity, CLI]
---

Ranger is a lightweight but powerful file manager with Vi-like key bindings.
It shines at exploring file trees, looking for specific files, and performing
bulk operations on folders and files. Three column layout will be very similar
to Mac OS X users: center column shows contents of the current directory, left
column lists contents of a parent directory, and the right column contains
preview for the selected file or folder.

{% img /images/posts/ranger-file-preview.png File preview screen in Ranger: parent directory in the left column, current directory in the center column, and selected file preview in the left column. %}

Ranger supports movement with familiar to Vi users `h`, `j`, `k`, and `l` keys,
has internal command line which is invoked with `:`, as well as many other
features and key bindings similar to Vi. Another great selling point - Ranger
can be extended with custom commands and key bindings. Utility is written in
Python, therefore all the commands are nothing more than Python scripts.

{% img /images/posts/ranger-marking-files.png Marking files for deletion in Ranger.  Files highlighted in yellow will be deleted by executing `:delete` command. %}

## Installation

Ranger is easy to install and can be found in most public repositories, just
install `ranger` package using your favorite package manager. While you're at
it, you may want to install some external utilities to help Ranger properly
display file previews (list is taken from [ArchWiki page on Ranger][1]):

- `atool` for archives.
- `highlight` for syntax highlighting.
- `libcaca` (`img2txt`) for image previews in ASCII.
- `lynx`, `w3m` or `elinks` for HTML.
- `mediainfo` or `perl-image-exiftool` for media file information.
- `poppler` (`pdftotext`) for PDF.
- `transmission-cli` for BitTorrent information.
- `w3m` for image previews.

After all the dependencies are installed, quickly start up `ranger`, exit it
with `q`, and run `ranger --copy-config=all` to generate configuration files in
`~/.config/ranger`.

## Usage

Here are a few of the key bindings and commands I found useful:

- Use spacebar to select files one by one. By selecting multiple files, you can
  perform bulk operations on them. Use `V` to perform visual selection.
  Lowercase `v` reverses current selection. For instance, you can run `:delete`
  after selecting multiple files and folders.
- As mentioned above, execute `:delete` to remove currently selected file (or
  files).
- To fullscreen a preview window, hit `i`. Hit `i` again to return the preview
  window to it's normal size.
- Vi's `gg` and `G` allow you to jump to the top and bottom of the file list
  respectively.
- Hit `zh` to toggle hidden files display.
- As in Vim, `/` searches for a file in a current buffer, while `n` and `N` let
  you navigate to the next and previous matches respectively.
- Similarly, `:filter` allows you to only limit your view to the files matching
  a pattern. It's also interactive - changes are applied as you type.

If you're an avid Vim user, you'll find using Ranger surprisingly intuitive.
Otherwise you might get confused and scared away, probably for a good reason.
Ranger is designed to provide Vi-like feel for file browsing, and it does that
job well.

[1]: https://wiki.archlinux.org/index.php/ranger
