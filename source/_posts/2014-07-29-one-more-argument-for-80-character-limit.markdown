---
title: "One more argument for 80 character limit"
date: 2014-07-29 23:00:04 -0700
categories: [Notes and rants, Programming]
---

Limiting code to 80 (or 100 or 120) characters per line. It's a well-known
topic, and there's an overall consensus on the subject, not counting occasional
questions by newbies and odd cases. Most established tech companies have their
own line length guidelines. These are often dependent on a language, such as in
the case of Google with their 80 character Python and 100 character Java limits.

In this article, I won't be advocating all the usual arguments, such as easier
diff with version control software, or the ability to stack windows side by side
on wide screens. No, I believe that battle to be won quite a long time ago, the
topic is now closed. But something I didn't find mentioned in any of the
discussions is an interesting point from the world of writers and designers.

Ever since I started being interested in improving my writing skills, I found
article after article mention the importance of line length in reading.
Interestingly enough, this issue was raised in a world of literature. It had
been resolved long before programmers were fascinated with the desire to use up
rapidly expanding screen real estate.

I am talking about something known as "measure" in typography. It seems to be
the reason newspapers use narrow columns, or books leave such vast margins
around the text on a page. Here's an exempt from the [Wikipedia article][1]:

> Measure (or sometimes "The Measure") in typography is the length of a line of
> text. For a single-column design measure should ideally lie between 40 & 80
> characters. Many typographers consider the perfect measure to be 65
> characters. If the lines are too short then the text becomes disjointed, if
> they are too long the content loses rhythm as the reader searches for the
> start of each line. Punctuation should preferably hang outside the measure.

Most programming languages use special operators and keywords, which can be
considered "punctuation". Some languages are more verbose (use more
punctuation), and some aren't. If you remove punctuation, the 80/100/120
character limit perfectly fits the standard time-honed "measure".

Maybe I can use this as an additional argument the next time I have to explain
to a junior new hire why the character limits are so strictly enforced.

[1]: http://en.wikipedia.org/wiki/Measure_(typography)
