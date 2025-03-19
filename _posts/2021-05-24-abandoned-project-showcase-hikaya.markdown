---
title: "Abandoned project showcase: Hikaya"
date: 2021-05-24 09:00:00 -0700
categories: [Gamedev]
---

Roguelikes are once niche, but an increasing mainstream video game genre. The genre is named after 1980 "Rogue" - a procedurally generated dungeon crawler. Rogue and games inspired by it often include simple ASCII graphics, feature procedural generation of the world, and include "permadeath": the game is over once you die.

![A screenshot of 1980 "Rogue" video game.](/images/posts/rogue-1980.png)

Many games were heavily inspired by it - like Ancient Domains of Mystery and Nethack, or more recent Cataclysm: DDA and Caves of Qud. Modern games bring a lot of fantastic fusion into the genre too with like The Binding of Isaac or Hades. But I digress.

A few months ago I was struck by a bout of inspiration. I've tried countless times before, but never produced a complete video game -- this was meant to be the time! I've significantly reduced the scope, came up with a plan of action, and started coding!

I codenamed the game "Hikaya", which means "a fairy tale" in Tatar - my native language (although I think the word itself has been borrowed from Arabic). I planned to make a fairly straightforward roguelike, without too many bells and whistles.

![A screenshot of the main menu of Hikaya.](/images/posts/hikaya-splash-screen.png)

I've found a wonderful tutorial on rogueliketutorials.com, which introduces `libtcod` -- a library to simplify the mundane: drawing on screen, handling input, field of view and lighting, pathfinding. I've struggled through all of the above before, and knew that getting deep into the mechanical details would slow me down.

Alas, I didn't finish the game. I've gotten maybe half way there, before my focus slipped away from the project. But not before getting some screenshots and documenting some interesting ideas I had!

The only contains a dozen dungeon levels, with a short story being told through item descriptions. The player is an adventurer who's sent by their village to a nearby cave to retrieve the last flame - a placeholder MacGuffin.

![An inventory screen of Hikaya.](/images/posts/hikaya-inventory.png)

Every item and monster posses a fantasy-sounding name, contrasted with a short, but colorful description hinting at a science fiction nature of the objects. Think magic scrolls with touch screens, or injectable health potions.

Each monster type has a unique behavior - with goblins running away and regrouping, ogres snacking on goblins to restore health, and so on.

![A goblin running away for backup.](/images/posts/hikaya-goblin.png)

As the player descends down the dungeon, they encounter multiple bosses guarding the staircases. The bosses drop unique armor pieces, which tell a story of a group of adventurers descending into the dungeon, but succumbing to traps, greed, and treachery.

Finally, a dragon guards the last light on the final floor. The game ends with the player becoming a dragon, and a cycle becomes anew.

I know, I know: edgy, uninspired -- but I enjoyed the premise.

The combat is focused on tactical movement and avoiding damage, and the player unlocks new moves -- like kicks, jumps, or faints -- as they progress through the dungeon.

![A screenshots of a stunt selector in Hikaya.](/images/posts/hikaya-stunts.png)

I wanted to experiment with the health system. Inspired by FATE tabletop roleplaying system, I attempted to use health pools. The system was meant to keep combat dangerous and entertaining throughout the game by making even the goblins dangerous throughout the game.

My biggest experiment came from a health system. Inspired by FATE tabletop roleplaying ruleset, the health consists of multiple pools (as opposed to a single bar). The goal of the system is to make combat deadly, and create a sense of danger even for trivial encounters, while still leaving room for error. 

Let me try to explain. For example, a player might have three health pools - for 1, 2, and 3 hit points each. Each time a player takes damage, the smallest pool is used to absorb that damage. For instance, a 2 damage hit voids the 2 hit point pool. A second 2 damage hit clears out the 3 hit point pool. A third 2 damage hit is fatal.

You can see the voided health pools marked as red on the screenshot below, and the full health pools in green:

![A screenshots of a player taking damage in Hikaya.](/images/posts/hikaya-damage.png)

To complicate thing further, I give players some leeway by slowly draining partially damaged pools over time. For instance, if the player uses their 5 hit point pool to absorb 2 points of damage, I'll slowly drain that pool over the next three turns. This would let the player take another 2 damage hit (or a few 1 damage hits) "for free" immediately after being hit. You can see those hearts marked as yellow on the screenshot above.

Needless to say, the system turned out to be very convoluted to explain in game (and on paper too -- I don't think the above is clear enough). I still think it's a great idea, but it desperately needs better user experience design to make it accessible. In fact, FATE itself got rid of confusing health pools in it's latest "FATE Condensed" release, simplifying health down to binary hit markers.

Despite not finishing it, putting together Hikaya was a fun experience. I've had a great time working on the prototype: I've learned a lot, and maybe I'll lead my next video game project to completion given everything I've learned!
