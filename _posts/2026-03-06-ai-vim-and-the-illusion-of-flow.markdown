---
title: "AI, Vim, And the illusion of flow"
date: 2026-03-06 20:00:00 -0800
categories: [Technology]
---

I've been using AI in my job a lot more lately — and it's becoming an explicit expectation across the industry. Write more code, deliver more features, ship faster. You know what this makes me think about? Vim.

I'll explain myself, don't worry.

I like Vim. Enough to write [a book about the editor](https://amzn.to/4rl4Kjf), and enough to use Vim to write this article. I'm sure you've encountered colleagues who swear by their Vim or Emacs setups, or you might be one yourself.

Here's the thing most people get wrong about Vim: it isn't about speed. It doesn't necessarily make you faster (although it can), but what it does is keep you in the flow. It makes text editing easier — it's nice not having to hunt down the mouse or hold an arrow key for exactly three and a half seconds. You can just delete a sentence. Or replace text inside the parentheses, or maybe swap parentheses for quotes. You're editing without interruption, and it gives your brain space to focus on the task at hand.

AI tools look this way on the surface. They promise the same thing Vim delivers: less friction, more flow, your brain freed up to think about the hard stuff. And sometimes they actually deliver on that promise! I've had sessions where an AI assistant helped me skip past the tedious scaffolding and jump straight into the interesting architectural problem. There's lots of good here.

Well, I think the difference between AI and Vim explains a lot of the discomfort engineers are feeling right now.

## The depth problem

When I use Vim, the output is mine. Every keystroke, every motion, every edit — it's a direct translation of my intent. Vim is a transparent tool: it does exactly what I tell it to do, nothing more. The skill floor and ceiling are high, but the relationship is honest. I learn a new motion, I understand what it does, and I can predict its behavior forever. There's no hallucination. `ci)` will always **c**hange text **i**nside parentheses. It won't sometimes change the whole paragraph because it misunderstood the context.

AI tools have a different relationship with their operator. The output looks like yours, reads like yours, and certainly looks more polished than what you would produce on a first pass. But it isn't a direct translation of your intent. Sometimes it's a fine approximation. Sometimes it's subtly wrong in ways you won't catch until a hidden bug hits production.

This is what I'd call the depth problem. When I use Vim, nobody can tell from reading my code whether I wrote it in Vim, VS Code, or Notepad. The tool is invisible in the artifact. And that's fine, great even - because the quality of the output still depends entirely on me. My understanding of the problem, my experience with the codebase, my judgment about edge cases, my ability to produce elegant code - all of that shows up in the final product, regardless of which editor I used to type it up.

AI inverts this. The tool is extremely visible in the artifact - it shapes the output's style, structure, and polish - but the operator's skill level becomes invisible. Everything comes out looking equally competent. You can't tell from a pull request whether the author spent thirty minutes carefully steering the AI through edge cases or just hit accept on the first suggestion.

That's a huge problem, really. Because before, a bad pull request was easy to spot. Oftentimes a junior engineer would give you "hints" by not following the style guides or established conventions, which eventually tips you off and leads you to discover a major bug or missed corner case.

Well, AI output always looks polished. We lost a key indicator which makes engineering spidey sense tingle. Now every line of code, every pull request is a suspect. And that's exhausting.

## Looking done versus being right

I just read Ivan Turkovic's excellent [AI Made Writing Code Easier. It Made Being an Engineer Harder](https://www.ivanturkovic.com/2026/02/25/ai-made-writing-code-easier-engineering-harder/) (thanks for the share-out, Ben), and I couldn't agree more with his core observation. The gap between "looking done" and "being right" is growing, and it's growing fast.

You know what's annoying? When your PM can prototype something in an afternoon and expects you to get that prototype "the rest of the way done" by Friday. Or the same day, if they're feeling particularly optimistic about what "the rest of the way" means (my PMs are wonderful and thankfully don't do this).

But either way I don't blame them, honestly. The prototype looks great. It's got real-ish data, it handles the happy path, and it even has a loading spinner. It looks like a product. And if I could build this in two hours with an AI tool - well, how hard could it be for a full-time engineer to finish it up?

The answer, of course, is that the last 10% of the work is 90% of the effort. Edge cases, error handling, validation, accessibility, security, performance under load, integration with existing systems, observability - none of that is visible in a prototype, and AI tools are exceptionally good at producing work that doesn't have any of it. The prototype isn't 90% done. It 90% looks good.

Of course there's an education component here - understanding the difference between surface level polish and structural soundness. But there's a deeper problem here too, and it's hard to solve with education alone.

## The empathy gap

My friend and colleague Sarah put this better than I could: we're going to need lessons in empathy.

Here's what she means. When a PM can spin up a working prototype in an afternoon using AI, they start to believe - even subconsciously - that they understand what engineering involves. When an engineer uses AI to generate user-facing documentation, they start to think the tech writer's job is trivial. When a designer uses AI to write frontend code, they wonder why the team needs a dedicated frontend engineer.

And none of these people are wrong about what they experienced. The PM really did build a working prototype. The engineer really did produce passable documentation. But the conclusion that they "did the other person's job" and the job is therefore easy - is completely wrong.

Speaking of Sarah. Sarah is a staff user experience researcher. It's Doctor Sarah, actually. And I had the opportunity to contribute on a research paper, and I used AI to structure my contributions, and I was oh-so-proud of the work because it looked exactly like what I've seen in countless research papers I've read over the years. And Sarah scanned through my contributions, and was real proud of me. Until she sat down to read what I wrote, and had to rewrite just about everything I "contributed" from scratch. 

AI gives everyone a surface-level ability to contribute across almost any domain or role. And surface-level ability is the most dangerous kind, because it comes with surface-level understanding and full-depth confidence. Modern knowledge jobs are often understood by their output. Tech writers by the documents produced, designers by the mocks, and software engineers by code. But none of those artifacts are core skills of each role. Tech writers are really good at breaking down complex concepts in ways majority of people can understand and internalize. Designers build intuition and understanding of how people behave and engage with all kinds of stuff. Software engineers solve problems. AI tools can't do those things.

The path forward isn't to gatekeep or to dismiss AI-generated contributions. It's to build organizational empathy - a genuine understanding that every discipline has depth that isn't visible from the outside, and that a tool which lets you produce artifacts in another person's domain doesn't mean you understand that domain.

This is, admittedly, not a new problem. Engineers have underestimated designers since the dawn of software. PMs have underestimated engineers for just as long. But AI is pouring fuel on this particular fire by making everyone feel like a competent generalist.

## So what do we actually do?

I don't want to be the person writing yet another "AI is ruining everything" essay. Frankly, there are enough of those. AI tools are genuinely useful - I use them daily, they make certain kinds of work better, and they're here to stay. The scaffolding, the boilerplate, the "I know exactly what this should look like but I don't want to type it out" moments - AI is great for those. Just like Vim is great for the "I need to restructure this method" moments.

A few things I think help, borrowing from Turkovic's recommendations and adding some of my own:

**Draw clear boundaries around AI output.** A prototype is a prototype, not a product. AI-generated code is a first draft, not a pull request. Making this explicit - in team norms, in review processes, in how we talk about work - helps close the gap between appearance and reality.

**Invest in education, not just adoption.** Rolling out AI tools without teaching people how to evaluate their output is like handing someone Vim without explaining modes. They'll produce something, sure, but they won't understand what they produced. And unlike Vim, where the failure mode is `jjjjjjkkkkkk:help!` in your file, the failure mode with AI is shipping code that looks correct and isn't.

**Build empathy across disciplines.** This is Sarah's point, and I think it's the most important one. If AI makes it easy for anyone to produce surface-level work in any domain, then we need to get much better at respecting the depth beneath the surface. That means engineers sitting with PMs to understand their constraints, PMs shadowing engineers through the painful parts of productionization, and everyone acknowledging that "I made a thing with AI" is the beginning of a conversation, not the end of one.

**Protect your flow.** This is the Vim lesson. The best tools are the ones that serve your intent without distorting it. If an AI tool is helping you think more clearly about the problem, great. If it's generating so much output that your job has shifted from "solving problems" to "reviewing AI's work" - that's not flow. That's a different job, and it might not be the one you signed up for.

I keep coming back to this: Vim is a good tool because it does what I mean. The gap between my intent and the output is zero. AI tools are useful, sometimes very useful, but that gap is never zero. Knowing when the gap matters and when it doesn't - that's a core skill for where we are today.

P.S. Did this piece need a Vim throughline? No it didn't. But I enjoyed shoehorning it in regardless. I hear that's going around lately.

*All opinions expressed here are my own. I don't speak for Google.*
