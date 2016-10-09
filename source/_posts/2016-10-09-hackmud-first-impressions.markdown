---
title: "Hackmud first impressions"
date: 2016-10-09 14:24:26 -0700
categories: [Games]
---

My Saturday just disappeared, quickly, and barely with any trace. You could find
leftover scripts all over my hard drive here and there, all pointing to Hackmud.
One moment I had plans for the day, and the next it was well past midnight, I
was listening to the 90s hacker movies inspired soundtrack while cracking locks
and farming for credits with a script I crafted.

I've spent ten hours in game, and it was glorious.

{% img /images/posts/hackmud-startup-logo.png Hackmud startup logo. %}

Hackmud is a text-only MUD (multi-user dungeon) set in a not so distant future,
where humanity was wiped out by a combination of Welsh Measels, killer rabbit
outbreak, and multiple other disasters. All that's left is a trace of old
corporations, dead user accounts, and AIs roaming the net. That's you, an AI.

Game has a heavy 90s vibe to it, and the atmosphere reminds me of Ready Player
One. References to popular TV shows and dial up sounds included.

You start in a training area, a vLAN without access to the rest of the network
and other players. You quickly learn all-text interface, and simple bash-like
command line - it's based on JavaScript, with a few syntax changes. Hackmud is
very much a puzzle game, and lets you take your time with a tutorial: you'll
need a few hours to go through all the puzzles, cracking locks, installing
upgrades, learning about security, and finally - escaping vLAN.

Here are some basics I picked up:

* You can have multiple user accounts within a game, and so can everyone else.
  Be on the lookout.
* "Locs" are account locations, something similar to an IP or a domain name. You
  can launch an attack against a user or a dead account if you know their loc.
* Scripts are just that - scripts written in JavaScript (outside of the game).
  Hit `#help` and Google to get started, but at least some basic programming
  background is necessary here.
* Locks protect accounts - one can be behind multiple locks. Lock usually
  requires you to guess the correct combination, like a color, correct lower
  order prime, or a keyword.
* Upgrades are installed on user accounts and include locks, script
  slots, character limits, etc.

At some point I successfully struggled through the tutorial and escaped vLAN.
And that's where the open-ended social nature of the game shines. You're thrown
into a global chat channel with users trying to trick you into running their
malware, players and corporations providing banking services, selling breached
account information, locks, and scripts.

The game encourages lying, betrayal, deception, ponzi schemes, money laundering
- you name it. And players take advantage of such freedoms to the full extent:

{% img /images/posts/hackmud-window-screenshot.png This is how the Hackmud gameplay looks.. %}

It looks rather confusing, but tutorial prepares you well for the chaotic flow
of characters on the screen.

I really wasn't sure what to do next. The tutorial taught me how to get money
out of dead accounts, so I decided to try to find one or two. After asking about
in the main channel and being offered a few dozen "risk free scripts to get locs
worth millions", I decided to set out on a search. I looked through a list of
`scripts.fullsec`, and found a few corporations.

{% img /images/posts/hackmud-corporations-screenshot.png Two Hackmud corporations - Macrosoft and Core. %}

After digging about in their files for a good few hours, I found a way to get to
employee registry and get a dozen of dead user locs. The locs were protected by
different kinds of locks, and I went through the first batch manually. It took
me a long time to get all the combinations and pull out some cash out of the
accounts.

I found my second batch of locs shortly after, and decided to try automating
some manual attempts through scripting. After struggling with syntax and being
aggravated by having only 120 seconds at a time to crack a lock (in line with
the 90s feel of the game, one needs to be connected to a "hardline"), I wrote a
first sample script, and started to play around with game concepts.

{% img /images/posts/hackmud-hardline-dial.png Hardline dial screenshot. %}

Hackmud is in no way an accurate hacking simulator, but it's a really fun puzzle
game, and it doesn't make any outrageous mistakes. It allows you to write your
own scripts to use in game using valid JavaScript with access to a game library.
Game developer (it's a one person project) implemented his own JavaScript
interpreter, so it has bugs here and there - one should be careful using obscure
language features.

The worst part about scripting was character limitations: one needs quite a bit
of money to be able to install first upgrades, and default limit of one active
script and 500 characters per script is straight-up rage inducing. Before
getting my first 1MGC to finally upgrade my rig, I wrote a bunch of tiny
scripts, one per lock type, struggling to keep to the character limit. I ended
up with ugly monstrosities like this, manually passing results from one script
to another when encountering multiple accounts:

    function(o, g) {
      var
        a = {},
        b = "ez_35",
        c = ["open", "release", "unlock"],
        d = "digit",
        r = "",
        s = false,
        t = g.target.call;

      for (var x in g) {
        if (x != "target") {
          a[x] = g[x];
        }
      }

      for (var i = 0; i < c.length; i++) {
        a[b] = c[i];
        r = t(a);
        if (r.indexOf(d) > -1) {
          for (var k = 0; k < 10; k++) {
            a[d] = k
            r = t(a);
            if (r.indexOf(d) == -1) {
              var m = b + ":\"" + a[b] + "\", " + d + ": \"" + a[d] + "\"";
              return { ok:true, msg:r + "\n\n" + m };
            }
          }
        }
      }
      return { ok:s, msg:r };
    }

It was really interesting working with the limitations:

* I couldn't write scripts longer than 500 characters (spaces not included).
* I couldn't have access to one script without unloading the other first.
* I had to debug and test the scripts within 120 second windows.

Few more batches of locs later, I was finally able to afford to initialize my
system to tier 1 and install upgrades I bought and accumulated from hacking
accounts:

{% img /images/posts/hackmud-upgrades-screenshot.png Installed upgrades. %}

Now I can write all the scripts I want! Excited, I built my first t1 (tier 1)
lock breaker, which automatically cracks a loc with any number of t1 locks on
it:

    function(context, func_args) { // {target:"#s."}

      var digits = Array();
      for (var i = 0; i < 10; i++) {
        digits.push(i);
      }

      var
        COLORS = [
          "purple", "blue", "cyan", "green", "lime", "yellow", "orange", "red"],
        DIGITS = digits,
        LOCKS = ["open", "release", "unlock"],
        // ez_prime lock seems to only request low order primes, hardcoding this
        PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
          61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137,
          139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193];

      var hackMultLevels = function(target, args, levels) {
        for (var i = 0; i < levels.length; i++) {
          var
            item = levels[i].item,
            itemDesc = levels[i].itemDesc,
            itemList = levels[i].itemList;
          for (var k = 0; k < itemList.length; k++) {
            args[item] = itemList[k];
            ret = target(args);
            if (ret.indexOf(itemDesc) == -1) {
              break;
            }
          }
        }
        return ret, args;
      }

      var hackEz21 = function(target, args) {
        return hackMultLevels(
          target,
          args,
          [
            { item: "ez_21", itemDesc: "command", itemList: LOCKS }
          ]);
      };

      var hackEz35 = function(target, args) {
        return hackMultLevels(
          target,
          args,
          [
            { item: "ez_35", itemDesc: "command", itemList: LOCKS },
            { item: "digit", itemDesc: "digit", itemList: DIGITS }
          ]);
      };

      var hackEz40 = function(target, args) {
        return hackMultLevels(
          target,
          args,
          [
            { item: "ez_40", itemDesc: "command", itemList: LOCKS },
            { item: "ez_prime", itemDesc: "prime", itemList: PRIMES }
          ]);
      };

      var hackC001 = function(target, args) {
        return hackMultLevels(
          target,
          args,
          [
            { item: "c001", itemDesc: "correct", itemList: COLORS },
            { item: "color_digit", itemDesc: "digit", itemList: DIGITS }
          ]);
      }

      var hackC002 = function(target, args) {
        return hackMultLevels(
          target,
          args,
          [
            { item: "c002", itemDesc: "correct", itemList: COLORS },
            { item: "c002_complement", itemDesc: "complement", itemList: COLORS }
          ]);
      }

      var hackC003 = function(target, args) {
        return hackMultLevels(
          target,
          args,
          [
            { item: "c003", itemDesc: "correct", itemList: COLORS },
            { item: "c003_triad_1", itemDesc: "first", itemList: COLORS },
            { item: "c003_triad_2", itemDesc: "second", itemList: COLORS }
          ]);
      }

      var
        args = {},
        i = 0,
        locks = [
          { name: "EZ_21", func: hackEz21 },
          { name: "EZ_35", func: hackEz35 },
          { name: "EZ_40", func: hackEz40 },
          { name: "c001", func: hackC001 },
          { name: "c002", func: hackC002 },
          { name: "c003", func: hackC003 }
        ],
        ret = "",
        target = func_args.target.call,
        unlocked = [];

      ret = target(args);

      while (true) {
        i++;
        var flag = true;

        for (var k = 0; k < locks.length; k++) {
          if (ret.indexOf(locks[k].name) > -1 &&
              unlocked.indexOf(locks[k].name) == -1) {
            ret,  args = locks[k].func(target, args);
            unlocked.push(locks[k].name);
            flag = false;
          }
        }

        if (flag === true) {
          return { ok: true, msg: ret };
        }

        if (i > 10) {
          return { ok: false, msg: ret }
        }
      }
    }

Rather rough around the edges, not easiest to read, but it works - and I was
really proud of finishing it (and too tired to go back and refactor). With this,
next dozen of t1 locs took me a few minutes to crack open. Success!

That was the logical conclusion of my Saturday, and left me feel really
satisfied. The game is rough around the edges, and has numerous bugs here and
there. But the text-only world of Hackmud is alive and atmospheric, and puzzles
and exploration of the derelict world through randomly-generated documents pulls
you in, making you lose track of time.
