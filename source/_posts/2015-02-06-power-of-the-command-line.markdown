---
title: "Power of the command line"
date: 2015-02-06 13:13:49 -0800
categories: [Notes and Rants, Productivity]
---

*Disclaimer: I am not advocating any specific tools or methodologies, I am
simply sharing workflow I find to be efficient and pleasant.*

I am a huge fan of working with CLI applications. I use Vim for editing code,
composing emails, and various kinds of writing. When I have to manipulate huge
amounts of email, I use Mutt: it's intuitive tagging and regular expression
engine are extremely useful for the task. I employ `ack`, `awk`, `grep`, and
`sed` - Linux utilities which allow for precise and fast text manipulation.

However, I would not use CLI browsers like `elinks` or `w3m`, and the idea of
reading every email in Mutt gives me crepes. I love the visualization web
browser offers, something text-based prompt is not able to provide. And it
doesn't have to.

There are two components to most of the tasks performed on a computer: analyzing
output and entering input. Certain tasks employ one component more than the
other. In most modern applications it's rare to have both solid control from
the user perspective and a pleasant informative UI. With increased visual
component, it's more time consuming to make the application do what you need,
especially if your needs are esoteric. With more editing power, visual display
becomes less complex in order to make editing tasks easier.

## Where visual tools fall short

What is the alternative? Using multiple programs with different levels of
control to accomplish one task: to edit text. Each of the programs excels in
it's own field: word processing software allows for beautiful fonts and document
presentation, IDE lets you access aggregated meta information about your
application. But most of the IDEs and word processors lack the powerful tools
needed to manipulate the foundation of what user is working with - plain text.

## Ode to plain text

I spend a lot of time writing and editing plain text. Be it source code, emails,
documentation, or even blog posts. These tasks take up significant amount of my
day, and it is only logical to substitute some of the visual presentation
capabilities for effectiveness.

It is hard to mentally process data which is not explicitly and unambiguously
visible: different levels of headings, hidden meta information. Unlike more
obscuring formats, plain text is all there is - it has nothing to hide. If you
don't see it - it's not there. If you do see it - you know exactly what it is.

One of my favorite tips from "[Pragmatic Programmer][1]" goes:

> Use a single editor well

So I learned one editor well, and now I use it for all my writing and editing
needs. I don't have to jump between IDE, browser, and office software. Most of
the text I edit is manipulated with one editor. There is only one set of key
bindings to know, one skill to master and hone. Fast, without any additional
thought, using single text editor and all of it's powerful features is imprinted
in muscle memory. One less task to worry about.

I write my documents in Markdown format, and later convert them to the desired
output using `pandoc`: be it an HTML page, PDF, or a Microsoft Word document. I
use Vim, so I can rearrange paragraphs or manipulate lines within a couple of
keystrokes. Since I spend so much time editing text, I also touch type, which
makes me even more effective at the given task.

## Harness the power of the command line

When it comes to bulk manipulating files or working with version control -
there is no better candidate then command line applications. There's no need to
go through a number of obscure menus, ticking and unticking checkboxes, and
hoping that your desired result can be achieved with a program's GUI.

Let's look at a few scenarios some users face in their daily workflow.

### Creating a backup

With GUI, you'd have to take multiple steps:

1. Right click `file`.
2. Left click on "Copy".
3. Right click on some empty space.
4. Left click on "Paste".
5. Right click on a newly created copy.
6. Left click on "Rename".
7. Switch to a keyboard.
8. Type `file.bak`.

The above steps can be sped up using shortcuts like `C-c` or `C-v`, but not by
much. Here's an alternative in bash:

    cp file{,.bak}

While first variant would do great for a novice or a casual user - the second
method would be much more preferred by an experienced user whose concern is
speed.

### Recursively bulk replacing text in a directory

Let's assume we want to do a bulk replace text in a directory and all it's
subdirectories. We have our trusted IDE, let's assume this IDE is already
configured to work with a desired directory.

1. Open your IDE.
2. Select "Edit" menu.
3. Select "Find and Replace" submenu.
4. Click on a "Find" input field.
5. Switch to a keyboard.
6. Type `function_to_replace`.
7. Switch to a mouse.
8. Click on "Replace" input field.
9. Switch to a keyboard.
10. Type `new_function_name`.
11. Switch to a mouse.
12. Enable "Search in subdirectories" checkbox.
13. Click "OK".

Again, this can be shortened a bit with some keyboard shortcuts, but not by
much. You still have to switch between keyboard and a mouse a total of 4 times,
and you still have to click through all the menus. This does get time consuming
if you do this often. Now let's try to perform the same task in command line:

	find . -type f | xargs sed -i 's/function_to_replace/new_function_name/g'

Much faster, if you're able to memorize the structure. And remembering what the
commands do is much easier than it looks. Especially with the help of `man` or,
even better, `bro` (see <http://bropages.org> for latter).

## Is it worth learning CLI tools over their GUI counterparts?

This depends on what your intentions are. If you're a power user who writes and
edits a lot of text or manipulates bulk amounts of text on a daily basis - than
it's definitely worth it. Time spent learning these tools will pay off. But if
you're a casual user whose needs end with writing an occasional email or two -
then you probably don't need to worry about this.

Hell, if you've read this far - this means you're the former case. I can
practically guarantee that you will benefit from employing command line tools
and modal editors over their GUI counterparts.

I've put together a table for comparison between two. Indeed, there are
different times when either GUI or CLI tools excel:

| Factor                            | CLI | GUI |
|-----------------------------------|-----|-----|
| Easy to learn                     | No  | Yes |
| Efficient for a novice user       | No  | Yes |
| Efficient for an experienced user | Yes | No  |
| Good for occasional use           | No  | Yes |
| Good for repetitive tasks         | Yes | No  |
| Presents visual information well  | No  | Yes |

As you can see - both CLI and GUI programs have their pluses and minuses. CLI
tools seem to appeal to experienced users, while GUI tools are great for novice
users and do excel in representing visual information. No matter what kind of
interface you prefer, it's crucially important to use the right tool for the job.

[1]: http://amzn.to/1yRe6Th
