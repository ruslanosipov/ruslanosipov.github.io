---
categories: [Programming]
date: 2013-07-22 14:47:47+00:00
tags: [doctest, python, unittest]
title: Python tests with doctest and unittest
---

When it comes to tests, `doctest` is a great simple module to write tests for
your application. However it is pretty basic and does not have any extended
features like, for example, centralized unit tests. If you have multiple
modules with doctests (and you probably do) you most likely want to be able to
run all doctests recursively from one place. That's where `unittest` comes in.

Let's assume we store modules in the `lib/` directory:

    $ ls lib/
    __init__.py bar.py foo.py

Here are the contents of `foo.py` and `bar.py` respectfully:

    def foo():
        """
        >>> foo()
        False
        """
        return False

    def bar():
        """
        >>> bar()
        True
        """
        return True

    def baz():
        """
        >>> baz()
        False
        """
        return False

Now, to run all tests we need a wrapper script. Let's call it: `runtests.py`:

    #!/usr/bin/env python

    import unittest
    import doctest
    import os

    files = []
    root_dir = 'lib/'

    for root, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename == '__init__.py' or filename[-3:] != '.py':
                continue
            f = os.path.join(root, filename)
            f = f.replace('/', '.')
            f = f[:-3]
            files.append(f)

    suite = unittest.TestSuite()
    for module in files:
        suite.addTest(doctest.DocTestSuite(module))
    unittest.TextTestRunner(verbosity=1).run(suite)

This approach invokes the `doctest.DocTestSuite` method, which converts
doctests strings into unittest suites. Time to run our tests:

    $ chmod +x runtests.py
    $ ./runtests.py
    ...
    ----------------------------------------------------------------------
    Ran 3 tests in 0.008s

    OK

And just to be sure that approach actually works, let's make one of the tests
fail:

    $ ./runtests.py
    .F.
    ======================================================================
    FAIL: baz (lib.bar)
    Doctest: lib.bar.baz
    ----------------------------------------------------------------------
    Traceback (most recent call last):
      File "/usr/lib/python2.7/doctest.py", line 2201, in runTest
        raise self.failureException(self.format_failure(new.getvalue()))
    AssertionError: Failed doctest test for lib.bar.baz
      File "/home/rosipov/unitdoc/lib/bar.py", line 8, in baz

    ----------------------------------------------------------------------
    File "/home/rosipov/unitdoc/lib/bar.py", line 10, in lib.bar.baz
    Failed example:
        baz()
    Expected:
        True
    Got:
        False

    ----------------------------------------------------------------------
    Ran 3 tests in 0.009s

    FAILED (failures=1)
