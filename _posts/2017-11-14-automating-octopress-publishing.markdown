---
title: "Automating Octorpress publishing"
date: 2017-11-14 10:00:00 -0500
categories: [Programming]
---

I really like Octopress. It builds on top of Jekyll to address certain rough edges, and provides ready to go lighting fast blogging platform. It's easily extendible if you know how to code (thanks to a rather clean and well organized code base), and posts are just plain Markdown files.

One issue though - I need to be near a computer to publish and preview the article. This becomes difficult if I'm traveling with, say, a tablet.

I have a low end AWS Lightsail instance I use for writing and publishing, but it's not always fun to write when SSHing into a server, and I often write offline - making it even more difficult to move files between where I write and where I publish. And managing images is a nightmare. To resolve this, I set up a few directories I use in Dropbox, and wrote a few scripts to move things around when needed.

Here's a directory structure in Dropbox:

    - blog/
      - posts/
        - 2017-11-20-automatic-octopress-publishing.markdown
      - img/
        - input/
          - a-picture-of-a-flower.jpg
        - output/

I put Markdown files in `Dropbox/blog/posts/` (and numerous offline editors sync with Dropbox - I'm writing this with [StackEdit](https://stackedit.io/app), and I use [iA Writer](https://ia.net/writer/) on my tablet). I add my images to `Dropbox/img/input/`. I  tend to strip metadata from my images and resize them to fit the maximum page width (I don't really care for high resolution pictures, speed is preferred over ability to zoom into a picture). For this, two tools are needed:

    sudo apt-get install imagemagick exiftool

When I'm done writing or want to preview an article, I SSH into my AWS Lightsail instance and run `sync.sh`, a small script which moves posts to a proper directory, processes images and places them in the desired location, as well as starts Octopress instance (this way I can preview my blog on the AWS Lightsail instance). Contents of `sync.sh` (don't forget to `chmod +x`):

    #!/bin/bash
    cd $HOME/Dropbox/blog/img/input
    mogrify -resize 832x620 -quality 100 -path $HOME/Dropbox/blog/img/output *.jpg
    exiftool -all= $HOME/Dropbox/blog/img/output/*.jpg
    cp $HOME/Dropbox/blog/posts/*.markdown $HOME/blog/source/_posts
    cp $HOME/Dropbox/blog/img/output/*.jpg $HOME/blog/source/images/posts
    cd $HOME/blog
    rake generate
    rake preview

I run the above script every time I want to preview the site. I'm sure it's easy to set up a daemon to watch for changes in the Dropbox folders, but I don't see the need for that yet. Also, I just statically resize images to a particular resolution (832x620) since all of the pictures I upload have the same aspect ratio, I'm sure there's a way to calculate that number on the fly for this script to work with different aspect ratios. 

Lastly, when I deployed and committed my changes (still commit and deploy manually out of a habit), I run `archive.sh`:

    #!/bin/bash
    mv $HOME/Dropbox/blog/posts/*.markdown $HOME/Dropbox/blog/published
    rm $HOME/Dropbox/blog/img/input/*
    rm $HOME/Dropbox/blog/img/output/*

It's not much, but enough to save some manual labor involved in publishing to Octopress.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY3OTE1ODIzNl19
-->
