---
title: "Vortex Core 40% keyboard"
date: 2020-09-13 10:00:00 -0700
categories: [Reviews]
---

_This review is written entirely using Vortex Core, in Markdown, and using Vim._

Earlier this week I purchased [Vortex Core][vortex_core] - a 40% keyboard from a Taiwanese company Vortex, makers of the ever popular [Pok3r][pok3r] keyboard (which I happen to use as my daily driver). This is a keyboard with only 47 keys: it drops the numpad (what's called 80%), function row (now we're down to 60%), and the dedicated number row (bringing us to the 40% keyboard realm).

Words don't do justice to how small a 40% keyboard is. So here is a picture of Vortex Core next to Pok3r, which is an already a small keyboard.

![A picture of Vortex Core 40% keyboard next to a Pok3r 60% keyboard.](/images/posts/vortex-core-and-pok3r.jpg)

At around a [$100 on Amazon][vortex_core] it's one of the cheaper 40% options, but Vortex did not skimp on quality. The case is sturdy, is made of beautiful anodized aluminum, and has some weight to it. The keycaps this keyboard comes with feel fantastic (including slight dips on `F` and `J` keys), and I`m a huge fan of the look.

I hooked it up to my Microsoft Surface Go as a toy more than anything else. And now I think I may have discovered the perfect writing machine! Small form factor of the keyboard really compliments the already small Surface Go screen, and there's just enough screen real estate to comfortably write and edit text.

![A picture of Vortex Core 40% keyboard plugged into Microsoft Surface Go screen.](/images/posts/vortex-core-and-surface-go.jpg)

I've used Vortex Core on and off for the past few days, and I feel like I have a solid feel for it. Let's dig in!

## What's different about it?

First, the keycap size and distance between keys are standard: it's a standard staggered layout most people are used to. This means that when typing words, there is no noticeable speed drop. In fact I find myself typing a tiny bit faster using this keyboard than my daily driver - but that could just be my enthusiasm shining through. I hover at around 80 words per minute on both keyboards.

That is until it's time to type "you're", or use any punctuation outside of the `:;,.<>` symbols. That's right, the normally easily accessible apostrophe is hidden under the function layer (`Fn1 + b`), and so is the question mark (`Fn1 + Shift + Tab`). `-`, `=`, `/`, `\`, `[`, and `]` are gone too, and I'll cover those in due time.

On a first day this immediately dropped my typing speed to around 50 words per minute, as it's completely unintuitive at first! In fact, I just now stopped hitting `Enter` every time I tried to place an apostrophe! But only after a few hours of sparingly using Vortex Core I'm up to 65 WPM, and it feels like I would regain my regular typing speed within a week.

Despite what you might think, it's relatively easy to get used to odd key placement like this.

Keys have 4 layers (not to be confused with programming layers), and that's how the numbers, symbols, and some of the more rarely used keys are accessed. For example, here's what the key `L` contains:

* Default layer (no modifiers): `L`
* `Fn1` layer: `0`
* `Fn1 + Shift` layer: `)`
* `Fn` layer: `right arrow key`

The good news is that unlike many 40% keyboards on the market (and it's a rather esoteric market), Vortex Core has key inscriptions for each layer. Something like [Planck][planck] would require you to print out layout cheatsheets while you get used to the function layers.

![Left side of the Vortex Core keyboard, demonstrating numbers and special characters.](/images/posts/vortex-core-left-half.jpg)

As I continue attempting to type, numbers always take me by surprise: the whole number row is a function layer on top of the home row (where your fingers normally rest). After initially hitting the empty air when attempting to type numbers, I began to get used to using the home row instead.

The placement mimics the order the keys would be in on the number row (`1234567890-=`), but `1` is placed on the `Tab` key, while `=` is on the `Enter`. While I was able to find the numbers relatively easily due to similar placement, I would often be off-by-one due to row starting on a `Tab` key.

Things get a lot more complicated when it comes to special symbols. These are already normally gated behind a `Shift`-press on a regular keyboard, and Vortex Core requires some Emacs-level gymnastics! E.g. you need to press `Fn1 + Shift + F` to conjure `%`.

Such complex keypresses are beyond counter-intuitive at first. Yet after a few hours, I began to get used to some of the more frequently used keys: `!` is `Fn1 + Shift + Tab`, `-` is `Fn1 + Shift + 1`, `$` (end of line in Vim) is `Fn1 + Shift + D`, and so on. Combining symbols quickly becomes problematic.

It's fairly easy to get used to inserting a lone symbol here and there, but the problems start when having to combine multiple symbols at once. E.g. writing an expression like `'Fn1 + Shift + D' = '$'` above involves the following keypresses: `<Fn1><Esc> F N <Fn1><Tab> <Fn1><Shift><Enter> S H I F T <Fn1><Shift><Enter> D <Fn1><Esc> <Fn1><Enter> <Fn1><Esc> <Fn1><Shift>D <Fn1><Esc>`. Could you image how long it took me to write that up?

![Right side of the Vortex Core keyboard, demonstrating special characters placed on `bnm,.` keys.](/images/posts/vortex-core-right-half.jpg)

The most difficult part of getting used to the keyboard is the fact that a few keys on the right side are chopped off: `'/[]\` are placed in the bottom right of the keyboard, to `bnm,.` keys. While the rest of the layout attempts to mimic the existing convention and only shifting the rows down, the aforementioned keys are placed arbitrarily (as there's no logical way to place them otherwise).

This probably won't worry you if you don't write a lot of code or math, but I do, and it`s muscle memory I'll have to develop.

There are dedicated `Del` and `Backspace` keys, which is a bit of an odd choice, likely influenced by needing somewhere to place the `F12` key - function row is right above the home row, and is hidden behind the `Fn1` layer.

Spacebar is split into two (for ease of finding keycaps I hear), and it doesn't affect me whatsoever. I mostly hit spacebar with my left thumb and it's convenient.

`Tab` is placed where the `Caps Lock` is, which feels like a good choice. After accidentally hitting `Esc` a few times, I got used to the position. Do make sure to get [latest firmware][firmware] for your Vortex Core - I believe earlier firmware versions hides Tab behind a function layer, defaulting the key to `Caps Lock` (although my keycaps reflected the updated firmware).

So I'd say the numbers and the function row take the least amount of time to get used to. It's the special characters that take time.

## Can you use it with Vim?

I'm a huge fan of Vim, and I even wrote [a book][mastering_vim] on the subject. In fact, I'm writing this very review in Vim.

And I must say, it's difficult. My productivity took a hit. I use curly braces to move between paragraphs, I regularly search with `/`, `?`, and `*`, move within a line with `_` and `$`, and use numbers in my commands like `c2w` (change two words) as well as other special characters, e.g. `da"` (delete around double quotes).

The most difficult combination being spelling correction: `z=` followed by a number to select the correct spelling. I consistency break the flow by having to press `Z <Fn1><Enter> <Fn1><Tab>` or something similar to quickly fix a misspelling.

My Vim productivity certainly took a massive hit. Yet, after a few days it's starting to slowly climb back up, and I find myself remembering the right key combinations as the muscle memory kicks in.

I assume my Vim experience translates well into programming. Even though I write code for a living, I haven't used Vortex Core to crank out code.

## Speaking of programming

The whole keyboard is fully programmable (as long as you update it to the [latest firmware][firmware]).

It's an easy process - a [three page manual][firmware] covers everything that's needed like using different keyboard layers or remapping regular and function keys.

The manual also mentions using right `Win`, `Pn`, `Ctrl`, and `Shift` keys as arrow keys by hitting left `Win`, left `Alt`, and right spacebar. Vortex keyboards nowadays always come with this feature, but due to small form factor of the keys (especially Shift), impromptu arrow keys on Vortex Core are nearly indistinguishable from individual arrow keys.

Remapping is helpful, since I'm used to having `Ctrl` where `Caps Lock` is (even though this means I have to hide Tab behind a function layer), or using `hjkl` as arrow keys (as opposed to the default `ijkl`).

It took me only a few minutes to adjust the keyboard to my needs, but I imagine I will come back for tweaks - I'm not so sure if I'll be able to get used to special symbols hidden behind `Fn1` + `Shift` + key layer. Regularly pressing three keys at the time (with two of these keys being on the edge of the keyboard) feels unnatural and inconvenient right now. But I'm only a few hours in, and stenographers manager to do it.

## Living in the command line

The absence of certain special characters is especially felt when using the command line. Not having a forward slash available with a single keypress makes typing paths more difficult. I also use `Ctrl + \` as a modifier key for tmux, and as you could imagine it's just as problematic.

Despite so many difficulties, I'm loving my time with Vortex Core! To be honest with myself, I don't buy new keyboards to be productive, or increase my typing speed. I buy them because they look great and are fun to type on. And Vortex Core looks fantastic, and being able to cover most of the keyboard with both hands is amazing.

There's just something special about having such a small board under my fingertips.

[vortex_core]: https://amzn.to/3ivzMCK
[pok3r]: https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=3633
[planck]: https://mechanicalkeyboards.com/shop/index.php?l=product_detail&p=3633https://olkb.com/collections/planck
[firmware]: http://www.vortexgear.tw/vortex3.asp
[mastering_vim]: https://amzn.to/3htsTjK
