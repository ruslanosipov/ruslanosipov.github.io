---
title: "Lessons learned: engineering productivity"
categories: [Work]
date: 2015-6-8 14:03:58 -0800
---

I enjoy optimizing the way I work: the less time I can spend on something
without sacrificing quality - the better. Below are few ideas on the subject of
engineering productivity I've successfully applied in my career.

## Don't work long hours

A fascinating paper was released in 2011 by a group of Israeli researchers, who
studied the factors which affect if prisoners were given a parole or not
(source: [Extraneous factors in judicial decisions][1].

First prisoner in a morning has approximately 65% chance of being released. With
every next case, the chance dropped significantly, reaching nearly 0% starting
with the third case. After returning from a lunch break, odds of a prisoner
being released went back up to 65%. And once again, with each new prisoner the
odds decline rapidly.

![A graph of favorable parole decisions given by the judges.](/images/posts/israeli-parole-study.gif)

Authors of the paper suggest that making decisions depletes a limited mental
facility. People start looking for shortcuts and making mistakes.

Working long hours is something we've all done more than once. Be it an upcoming
deadline, fascinating problem, or a personal project. The problem with working
too long is that you're doing a poor job without realizing it.

I try to avoid working more than 7 hours a day, and there are people who get an
incredible amount of work done under an even shorter amount of time.

This is probably explained by a phenomenon called "ego depletion": the idea that
self-control or willpower draw upon a pool of limited mental resources that can
be used up. When the energy for mental activity is low, self-control is
typically impaired, which is what is considered to be a state of ego depletion.

## Dangers of burning out

Another problem with working too long - is a possibility of a burnout.

A while back I worked as a freelancer for a client of mine. I worked long hours
from home office. This was my first time working from home for such a long
period of time, and I made a number of mistakes in the beginning. One of which
was working too much.

I've put in a number of 12-hour marathons in order to get more work done. I was
on call most of the time. I became overwhelmed with all the work I had to get
done. I started losing interest in work and feeling like things are getting out
of my control. Every day felt like a bad day.

Those are the symptoms of a burnout. Feeling of life spinning out of control
and feeling like nothing you do makes any impact.

I broke out of a mental prison of a burnout by getting a better work-life
balance, enforcing exercise routine, and never working more than 8 hours a day.
7 in most cases.

## Work-life balance

Another thing I learned from working from home is how to keep a work-life
balance. Not having a separate office and living in a 1-bedroom apartment with
my wife, I had to barricade myself in a far corner of a bedroom and turn it into
a physically separated office space. That was the space I worked in, and it
remained empty after I was done and until I started the next work day.

Work-life balance deserves a special say: it's the difference between doing an
amazing job and going insane. Set aside time and place for work, and never allow
a bleed-through. Don't be on call if you can avoid it. Don't open or reply to
work-related emails at your spare time. Office is for work and home is for
family.

## Distraction-free environment

Everybody is aware that interruptions hamper productivity, but not everyone
actively avoids interruptions during work. Replying to a text message, quickly
checking your social network notifications, or looking up that one thing you've
been forgetting to look up for days - all of this impairs your mental ability to
complete the task within a desired time frame and, more importantly, with high
quality.

According to various studies it takes from 20 to 30 minutes to get regain the
same level of concentration and productivity after a single act of disruption. A
[2014 study from George Mason University][2] found that students composed lower
quality essays when interrupted only a few times throughout both planning and
writing phases. Distracted students performed considerably worse, even though
they were given additional time to complete an assignment in order to make up
for the interruptions.

## Know your tools

> Use a single editor well

- [Pragmatic Programmer][3], Tip #22.

This is lower level tip than the rest, but something I find utterly important in
my daily work. We, the software engineers, spend at least half the time editing
some sort of text - code, email, documentation. Taking time to improve the
knowledge of the software you use every day pays off.

- Using Gmail? Learn the keyboard shortcuts.
- Use Eclispe? Do the same. Search for plugins which can make your everyday work
  faster and easier.
- Use command shell for daily work? Practice your shell scripting skills, find
  the tools that let you do more work with lesser amount of typing.
- Pick up touch typing. It's also a part of your toolbox. Why think about keying
  words in? Lower error rate while typing - you need to go back less.

For instance, I do all my work in shell. I use [Tmux][4] for creating and
navigating multiple sessions. I use Vim for all my editing needs - code,
documentation, blogging, composing long emails (via [Mutt][5]). I touch type, so
working in a text mode is easy.

Over the years I accumulated aliases for all the frequently used shell commands.
All the Vim and Tmux shortcuts are a part of a muscle memory. Jumping from file
to file or from one place to another within a file doesn't take any mental
effort and is accomplished with only a couple of keystrokes.

By eliminating the need to think about or spend too much time working with low
level concepts - you free up the mental bandwidth for higher level reasoning and
problem solving.

## Read, don't stop learning

As per DeMarco and Lister, authors of
["Peopleware: Productive Projects and Teams"][6] - one book is more than most
programmers read each year. This is the same point Steve McConnell's
["Code Complete"][7] emphasizes.

A lot of programmers don't read books. A few even don't follow relevant blogs
or websites. Don't do what software engineers had to do in the olden days:
coding by error in isolation from the rest of the industry. Read a book, learn
something you don't know about. A single book read from beginning to end
contains wider array of information compared to disjointed articles some
programmers limit themselves to.

As Jeff Atwood suggests in his article
["Programmers Don't Read Books - But You Should"][8], pick up one of the
timeless books - not affected by changing technologies and processes.

[1]: http://www.pnas.org/content/108/17/6889.abstract
[2]: http://hfs.sagepub.com/content/56/7/1262
[3]: http://amzn.to/1B1PWw8
[4]: http://tmux.sourceforge.net
[5]: http://www.mutt.org
[6]: http://amzn.to/1D2csza
[7]: http://amzn.to/1D2cB5K
[8]: http://blog.codinghorror.com/programmers-dont-read-books-but-you-should/
