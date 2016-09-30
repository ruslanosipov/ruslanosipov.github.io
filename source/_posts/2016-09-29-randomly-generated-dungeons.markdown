---
title: "Randomly generated dungeons"
date: 2016-09-29 16:26:32 -0700
categories: [Gamedev]
---

After playing with random dungeon generation for a bit, I seem to be satisfied
with the results:

{% img /images/posts/random-dungeon-1.png A randomly generated ASCII-dungeon. %}

The above is displayed using ADOM notation - `#` represents a wall, `.` is a
floor tile, and `+` is meant to be a closed door. After fiddling about with a
few random dungeon generation ideas, I settled with the following.

## The algorithm

1. Start with a random point on a canvas.
2. Create a room with random width and height. Don't worry about walls yet.
3. Select a few points on the sides of the room, put those in a stack. Save the
   direction in which the potential doors would point.
4. Go through the stack, and try to add a room or a corridor (corridor is just a
   room with a width or a height of 1). Higher chance of corridors seems to look
   better and results in those wiggly passageways.
   1. Try to add a room a few dozen times with different random configurations.
      If no luck - give up and grab a new item from the stack. If couldn't
      generate a continuation to the corridor - mark it as a loose end, we'll
      clean those up later.
   2. If a room was added successfully - add a door where it connects to the
      previous room/corridor. Add a floor section if it's a corridor connecting
      to another corridor.
   3. At this point one ends up with quite a few interconnected corridors,
      merged rooms, and all kinds of fun surroundings (my desired goal).
5. Do the above until the stack is empty or a desired number of rooms has been
   generated.
6. Clean up the loose ends from step 4.1. Remove loose corridor segments one by
   one until intersection with another room/corridor is detected.
7. Add walls around the rooms and corridors, while also cleaning up any extra
   doors we may have left behind when creating merged corridors or rooms.
   1. I simply used slightly modified depth first search starting inside any
      room and drawing walls wherever I could find floor/door not connected to
      anything.
   2. When encountering a door - check if it's surrounded by walls or doors from
      the opposite sides. If not - remove the door and replace it with a floor
      tile. If any doors were adjucent to the removed door - requeue the door
      check on them.
8. Perform steps 1-7 a few hundred times, saving the resulting dungeons each
   time. Pick the best candidate with the most desired features - like a number
   of rooms, breadth, square footage, longest corridors, etc.

A more detailed explanation of the steps is below. For now, here are a few more
dungeons generated using this method:

{% img /images/posts/random-dungeon-2.png A randomly generated ASCII-dungeon. %}

{% img /images/posts/random-dungeon-3.png A randomly generated ASCII-dungeon. %}

{% img /images/posts/random-dungeon-4.png A randomly generated ASCII-dungeon. %}

I think dungeon generation is far more art than science, and I had a lot of fun
tweaking all the different input parameters:

* Room size boundaries.
* Corridor lengths.
* Frequency of corridor occurrences.
* Number of exits from the room.
* Number of room generation attempts.
* Number of dungeon generation attempts.
* Final dungeon picking heuristics. 

Last item on the list is the most interesting one - with few hundred dungeons as
an input, picking the right one is rather important. I ended up settling on
using max priority queue with a rough surface area of the dungeon as a key
(it's more of a breadth, really - how wide and tall it is). Then I'd sift
through some top results and pick the one with the most rooms available. This
results in the most fun-looking map which feels up most of the screen, while
still usually not being too cluttered.

Here's a breakdown of a simple scenario:

### Steps 1 and 2

Pick a random spot on a canvas and generate a room of random size (4 x 3):

    ....
    ....
    ....

### Step 3

Select potential spots for doors, let's label them 1, 2, 3.

    ....2
    ....
    ....1
      3

I went for a uniform distribution by unfolding the rectangle and folding it back
in to get a proper coordinate on the perimeter. Now, stack contains coordinates
of `[1, 2, 3]` (along with the directions in which they are pointing).

### Steps 4 and 5

Add a room or a corridor to a connector number 3. We'll be adding the room to
the right of number 3. Let's assume random sends a corridor of length 5 our way.
We're happy with the corridor pointing either up, down, or right - so we let the
random decide again: up.

         4
         .
         .
    ....2.
    .... .
    ....3.
      1

We add the end of the corridor to the stack as number 4 (now `[1, 2, 4]`). We
also mark 4 as a loose end, in case we end up not adding a room to it. Dangling
corridors are never pretty.

Now, to replace number 3 with a door:


         4
         .
         .
    ....2.
    .... .
    ....+.
      1

Adding another random corridor of length 2 to the point 4, pointing right.
Replace number 4 with a floor segment, since point 4 was the end of another
corridor. Remove point 4 from loose ends, add point 5.

         ...5
         .
         .
    ....2.
    .... .
    ....+.
      1

Take point 5, generate a room of size 3 x 6. 5 becomes a door. Loose ends list
is empty.

         ...+...
         .   ...
         .   ...
    ....2.   ...
    .... .   ...
    ....+.   ...
      1

For simplicity's sake, let's assume we don't want any more exits from this room.
Back to the stack of `[1, 2]`. Point 2 seem to not have much room for growth.
After a few unsuccessful attempts to place a room or a corridor there, we give
up:

         ...+...
         .   ...
         .   ...
    .... .   ...
    .... .   ...
    ....+.   ...
      1

Now for point 1: we get another corridor of length 3. Point 6 is now added to
the loose ends list.

         ...+...
         .   ...
         .   ...
    .... .   ...
    .... .   ...
    ....+.   ...
      +
      .
      .
      .
      6

Let's assume we run out of space and can't add anything to the end of 6. We're
done generating the dungeon. Our stack is empty, and our loose ends contains
coordinates of `6`.

### Step 6

Start with the loose end, and remove items one by one until a tile with multiple
neighbors is encountered:

         ...+...
         .   ...
         .   ...
    .... .   ...
    .... .   ...
    ....+.   ...
      X
      X
      X
      X
      X

Viola:

         ...+...
         .   ...
         .   ...
    .... .   ...
    .... .   ...
    ....+.   ...

### Steps 7 and 8

There are no rogue doors in this scenario, so all we need to do is add  the
walls:

         #########
         #...+...#
         #.###...#
    ######.# #...#
    #....#.# #...#
    #....#.# #...#
    #....+.# #...#
    ######## #####

All of the steps above should be repeated a few hundred times with different
dungeons, and then the best dungeon should be picked as a final one.

Did I miss anything? Was cleaning up "loose ends" too much of a hack? What
should have I done differently?
