---
categories: [Programming]
tags: [contextlib, python]
title: 'Python: "ignored" context manager'
---

There was a recent [fantastic addition to Python 3.4](http://hg.python.org/cpython/rev/406b47c64480) by Raymond Hettinger: `contextlib.ignored`. It's a context manager which lets you shorten the following often-occurring pattern:

    try:
        os.remove('i_probably_do_not_exist.txt')
    except OSError:
        pass

And turn it into this:

    with ignored(OSError):
        os.remove('i_probably_do_not_exist')

Much shorted and prettier. But, as probably most of engineers, you have to use older version of python in production. That's where this little chunk of code comes in. Create a little `compat` (as in "compatibility") library and add following function:

    import contextlib

    @contextlib.contextmanager
    def ignored(*exceptions):
        try:
            yield
        except exceptions:
            pass

Beautiful!
