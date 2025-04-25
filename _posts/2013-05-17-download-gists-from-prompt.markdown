---
title: Download gists from prompt
categories: [Productivity, CLI]
date: 2013-05-17 18:52:02+00:00
tags: [gist, github, python]
---

I wrote a little script to download gists from the command prompt.

Generate your Github API Token under Settings -> Applications, change it within
a script, and then:

    chmod +x shgist.py
    mv shgist.py ~/bin/shgist

Where ~/bin is a directory in your path. Now you can use it as shgist file to
quickly download your gists ([Gist on Github][1]).

    #!/usr/bin/env python

    # Ruslan Osipov
    # Usage: shgist keywords
    # Description: Gists downloader

    import urllib
    import urllib2
    import sys
    import json

    token = 'Personal API Access Token'  # Github Settings -> Applications

    class Gist:
        def __init__(self, token):
            """
            token -- str, github token
            """
            self.token = token
            self.url = 'https://api.github.com'

        def find_by_name(self, keywords):
            """
            keywords -- list of strings
            """
            gists, urls = self._get_gists()
            for i, gist in enumerate(gists):
                for keyword in keywords:
                    if keyword not in gist:
                        del gists[i]
                        del urls[i]
                        break
            if len(gists) == 0:
                print "Sorry, no gists matching your description"
                return
            if len(gists) == 1:
                self._download_gist(gists[0], urls[0])
                return
            for i, gist in enumerate(gists):
                print i, gist
            while True:
                num = raw_input("Gist number, 'q' to quit: ")
                if num == 'q':
                    print "Quiting..."
                    return
                try:
                    num = int(num)
                    if 0 <= num < len(gists):
                        break
                    print "Number should be within specified range"
                except:
                    print "Only integers or 'q' are allowed"
            self._download_gist(gists[num], urls[num])

        def _download_gist(self, name, url):
            """
            name -- str, filename
            url -- str, raw gist url
            """
            print "Downloading %s..." % name
            gist = self._send_get_request(url)
            open(name, 'wb').write(gist)

        def _get_gists(self):
            """
            Returns 2 lists which should be treated as ordered dict
            """
            url = '/gists'
            response = self._send_get_request(self.url + url)
            response = json.loads(response)
            gists, urls = [], []
            for gist in response:
                for name, meta in gist['files'].items():
                    gists.append(name)
                    urls.append(meta['raw_url'])
            return gists, urls

        def _send_get_request(self, url):
            """
            url -- str
            """
            headers = {
                    'Authorization': 'token ' + self.token
                    }
            request = urllib2.Request(url, headers=headers)
            response = urllib2.urlopen(request)
            return response.read()

    argv = sys.argv[1:]
    if not len(argv):
        print "Usage: shgist keywords"
        sys.exit(0)

    gist = Gist(token)
    gist.find_by_name(argv)

[1]: https://gist.github.com/ruslanosipov/5599377
