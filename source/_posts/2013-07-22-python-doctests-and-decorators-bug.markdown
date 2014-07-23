---
categories: [Programming]
date: 2013-07-22 14:57:29+00:00
tags: [decorator, doctest, python]
title: Python doctests and decorators bug
---

Now, this as well might be a feature, but doctest strings are not being
executed for decorated functions (at least in version 2.7). However, there is a
workaround.

You need to decorate your functions with `functools.wraps` within a decorator
to import docstrings into a decorator scope.

    #!/usr/bin/env python

    from functools import wraps

    def decorator(func):
        @wraps(func)
        def wrapper():
            return func()
        return wrapper

    @decorator
    def foo():
        """
        >>> foo()
        False
        """
        return True

    import doctest
    doctest.testmod()

Now you can see this test failing, where otherwise it would have been ignored:

    **********************************************************************
    File "decorator.py", line 12, in __main__.foo
    Failed example:
        foo()
    Expected:
        False
    Got:
        True
    **********************************************************************
    1 items had failures:
       1 of   1 in __main__.foo
    ***Test Failed*** 1 failures.
