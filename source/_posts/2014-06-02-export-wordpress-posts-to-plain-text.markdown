---
categories: [Programming]
date: 2014-06-02 03:44:12+00:00
tags: [python, wordpress]
title: Export WordPress posts to plain text
---

I prefer to create and edit my posts in plain text. It's a timeless format, and
I find it nice to have an archive of posts lying around in plain text.

I wrote a little Python script which I used to extract an archive of my posts
and pages into a bunch of files on my computer. In order to use it, you need to
use "[WordPress Importer][1]" plugin. Export your posts and pages into a WXR
format, and feed the file to the script.

Source code of the script is below (link for downloading the script is at the
bottom of this post):

    #!/usr/bin/env python

    """This script converts WXR file to a number of plain text files.

    WXR stands for "WordPress eXtended RSS", which basically is just a
    regular XML file. This script extracts entries from the WXR file into
    plain text files. Output format: article name prefixed by date for
    posts, article name for pages.

    Usage: wxr2txt.py filename [-o output_dir]
    """

    import os
    import re
    import sys
    from xml.etree import ElementTree

    NAMESPACES = {
            'content': 'http://purl.org/rss/1.0/modules/content/',
            'wp': 'http://wordpress.org/export/1.2/',
    }
    USAGE_STRING = "Usage: wxr2txt.py filename [-o output_dir]"

    def main(argv):
        filename, output_dir = _parse_and_validate_output(argv)
        try:
            data = ElementTree.parse(filename).getroot()
        except ElementTree.ParseError:
            _error("Invalid input file format. Can not parse the input.")
        page_counter, post_counter = 0, 0
        for post in data.find('channel').findall('item'):
            post_type = post.find('wp:post_type', namespaces=NAMESPACES).text
            if post_type not in ('post', 'page'):
                continue
            content = post.find('content:encoded', namespaces=NAMESPACES).text
            date = post.find('wp:post_date', namespaces=NAMESPACES).text
            title = post.find('title').text
            date = date.split(' ')[0].replace('-', '')
            title = re.sub(r'[_]+', '_', re.sub(r'[^a-z0-9+]', '_', title.lower()))
            if post_type == 'post':
                post_filename = date + '_' + title + '.txt'
                post_counter += 1
            else:
                post_filename = title + '.txt'
                page_counter += 1
            with open(os.path.join(output_dir, post_filename), 'w') as post_file:
                post_file.write(content.encode('utf8'))
            post_counter += 1
        print "Saved {} posts and {} pages in directory '{}'.".format(
                post_counter, page_counter, output_dir)

    def _parse_and_validate_output(argv):
        if len(argv) not in (2, 4):
            _error("Wrong number of arguments.")
        filename = argv[1]
        if not os.path.isfile(filename):
            _error("Input file does not exist (or not enough permissions).")
        output_dir = argv[3] if len(argv) == 4 and argv[2] == '-o' else os.getcwd()
        if not os.path.isdir(output_dir):
            _error("Output directory does not exist (or not enough permissions).")
        return filename, output_dir

    def _error(text):
        print text
        print USAGE_STRING
        sys.exit(1)

    if __name__ == "__main__":
        main(sys.argv)

You can download the script from here: [wxr2txt.py][2].

[1]: http://wordpress.org/plugins/wordpress-importer/
[2]: https://gist.github.com/ruslanosipov/b748a138389db2cda1e8
