---
categories: [Programming]
date: 2013-12-30 18:48:31+00:00
tags: [django, lettuce, python, splinter]
title: Making Django and Lettuce play nice together
---

Lettuce is a great BDD tool which allows you to parse expressions written via
Gherkin syntax in python. However the documentation is not very comprehensive,
and at the moment current version (0.2.19) has some issues integrating with the
latest Django (1.6.1 at the moment of writing). Without further ado, I'll get
to a comprehensive tutorial.

Let's assume you are using `pip` and `virtualenv` for the dependency control,
and you already have a working project configured. Your project is called
"myproject", and the only app you have within your project is called "polls".

## Setup

First, you have to install `lettuce` library. At the moment of writing, current
released version (0.2.19) has an error integrating with Django, so we'll
install current development version. Releases 0.2.20 and up should include the
fix, so `pip install lettuce` would be better if the version is out.

    pip install -e \
        git://github.com/gabrielfalcao/lettuce@cccc397#egg=lettuce-master
    pip install django-nose splinter
    pip freeze > requirements.txt

First line downloads lettuce package from the github repository and installs
missing dependencies. You can replace `cccc397` with the current commit.
Technically commit can be omitted, but we don't want to have an unstable
ever-changing branch in our `requirements.txt`. I also added `django-nose`
since nose assertions come in handy while writing Lettuce steps, as well as
`splinter`, which is a great tool for testing web application.

Add Lettuce to the `INSTALLED_APPS` in your `myproject/settings.py`:

    INSTALLED_APPS = (
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.sites',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'django.contrib.admin',
        'django.contrib.admindocs',
        # ... third party apps ...
        'lettuce.django',
        'myproject',
        'polls',
    )

You also have to explicitly specify the apps you want to use with lettuce:

    LETTUCE_APPS = (
        'polls',
    )

By default, lettuce will run its' tests against your default database. But we
want to use test database for that, so we have to add few more settings:

    LETTUCE_TEST_SERVER = 'lettuce.django.server.DjangoServer'
    LETTUCE_SERVER_PORT = 9000

Where `LETTUCE_TEST_SERVER` is a subclass of Django's `LiveTestServerCase` - a
class which runs a test server for you and `LETTUCE_SERVER_PORT` is different
from port 8000 so you won't have issues running the development server via
`python manage.py runserver` at the same time as running Lettuce tests.

You also have to create a `features` directories inside the apps you want to
test with Lettuce:

    /myproject
        /myproject
            __init__.py
            settings.py
            urls.py
            wsgi.py
        /polls
            /features
                /steps
                    __init__.py
                    polls_list.py
                polls_list.feature
            __init__.py
            models.py
            tests.py
            views.py
        manage.py
        requirements.txt
        terrain.py

Lettuce has its' own settings file called `terrain.py`. It has to be in the
same directory as a `manage.py`:

    from django.core.management import call_command
    from django.conf import settings
    from lettuce import before, after, world
    from splinter.browser import Browser

    @before.each_scenario
    def flush_database(scenario):
        call_command('flush', interactive=False, verbosity=0)

    @before.each_scenario
    def prepare_browser(scenario):
        world.browser = Browser()

    @after.each_scenario
    def destroy_browser(scenario):
        world.browser.quit()

This code flushes the database before each scenario, as well as prepares and
destroys the `splinter` browser.

## Writing the features

Feature files support standard Gherkin syntax, let's write one right now in
`polls/features/polls_list.feature`:

    Feature: Polls list

        Scenario: Polls list without any polls
            When I access the "polls list" url
            Then I see a text "We didn't find any polls!"

        Scenario: Polls list with one poll
            Given a poll with the title "Hello world"
            When I access the "polls list" url
            Then I see a text "Hello world"
            And I do not see a text "We didn't find any polls!"

Now describe the steps in `polls/features/steps/polls_list.py`:

    from django.core.urlresolvers import reverse
    from lettuce import step, world
    from lettuce.django import django_url
    from nose.tools import assert_in, assert_not_in
    from polls.models import Poll

    PAGES = {
        "polls list": "polls:list"
    }

    @step(r'access the "(.*)" url')
    def access_the_url(step, name):
        world.browser.visit(django_url(reverse(PAGES[name])))

    @step(r'see a text "(.*)"')
    def see_a_text(step, text):
        assert_in(text, world.browser.html)

    @step(r'a poll with the title "(.*)"')
    def create_a_poll_with_the_title(step, title):
        poll = Poll.objects.create(title=title)
        polls.save()

    @step(r'do not see a text "(.*)"')
    def do_not_see_a_text(step, text):
        assert_not_in(text, world.browser.html)

## Running the tests

Now, you can run `python manage.py harvest --test-server` to run the tests you
just wrote:

    $ python manage.py harvest --test-server
    Creating test database for alias 'default'...
    Django's builtin server is running at 0.0.0.0:9000

    Feature: Polls list

      Scenario: Polls list without any polls
        When I access the "polls list" url
        Then I see a text "We didn't find any polls!"

      Scenario: Polls list with one poll
        Given a poll with the title "Hello world"
        When I access the "polls list" url
        Then I see a text "Hello world"
        And I do not see a text "We didn't find any polls!"

    1 feature (1 passed)
    2 scenarios (2 passed)
    6 steps (6 passed)
    Destroying test database for alias 'default'...

Don't forget the `--test-server` switch - otherwise Lettuce will run tests
against your default database.

## Sources

You can find some more details on Lettuce and Django integration here: [Web
development fun with Lettuce and Django][1].

## Update

Rather than using `--test-server` switch, it's easier and safer to set a flag
in your `settings.py` (suggested by Michel Sabchuk):

    LETTUCE_USE_TEST_DATABASE = True

This way you won't end up accidentally erasing your production database after
forgetting to add `--test-server` flag.

[1]: http://lettuce.it/recipes/django-lxml.html
