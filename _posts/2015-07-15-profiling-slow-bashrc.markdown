---
title: "Profiling slow bashrc"
date: 2015-07-15 10:07:53 -0700
categories: [Productivity, CLI]
---

I've recently noticed that it takes a long time for my bash to load. I've found
[following StackOverflow answer][1] to be useful, and I based my solution to find a
startup time hog in my `~/.bashrc` upon it.

First off, add following few lines to your `/etc/bash.bashrc`,
`~/.bash_profile`, or wherever you'd like to begin tracing the script:

    PS4='+ $(date "+%s.%N")\011 '
    exec 3>&2 2>/tmp/bashstart.$$.log
    set -x

And add following few lines where you want to stop the trace:

    set +x
    exec 2>&3 3>&-

Now start your bash session (you can simply open a new terminal Window for
that). The above will create `/tmp/bashstart.<PID>.log`. To analyze it, I wrote
a little Python script:

    import argparse
    import heapq

    parser = argparse.ArgumentParser(description='Analyze bashstart log for speed.')
    parser.add_argument('filename', help='often /tmp/bashstart.<PID>.log')
    parser.add_argument('-n', default=20, help='number of results to show')
    args = parser.parse_args()
    filename, n = args.filename, int(args.n)

    with open(filename, 'r') as f:
        q = []
        prev_time = None
        for line in f.readlines():
            line = line.split()
            if '+' not in line[0] or len(line) < 3:
                continue
            text = ' '.join(line[2:])
            seconds, nanoseconds = line[1].split('.')
            time = int(nanoseconds)
            diff = time - prev_time if prev_time is not None else 0
            prev_time = time
            heapq.heappush(q, (diff, text))

    for diff, text in heapq.nlargest(n, q):
        print float(diff) / 1000000000, 's:', text

Save it as `bashprofile.py`, and run it as follows (replace file name with an
appropriate):

    python bashprofile.py /tmp/bashstart.2831.log -n 20
    0.050056909 s: _powerline_init_tmux_support
    0.045323022 s: _powerline_setup_prompt
    0.044722024 s: _powerline_setup_prompt
    0.044423727 s: '[' -f /usr/local/google/home/ruslano/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ']'
    0.044364097 s: '[' -f /usr/local/google/home/ruslano/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ']'
    0.044137159 s: _powerline_init_tmux_support
    0.015839574 s: __shell_name=bash
    0.010850276 s: command which which
    0.010105462 s: PS2='\[\]  \[\] \[\]'
    0.010000598 s: PS3=' Select variant  '
    0.009837956 s: complete -F _svn -o default -X '@(*/.svn|*/.svn/|.svn|.svn/)' svn
    0.009767517 s: PS2='\[\]  \[\] \[\]'
    0.0095753 s: PS3=' Select variant  '
    0.007915565 s: other_utils=(ant automake autoreconf libtoolize make mount patch readlink)
    0.00771205 s: for script in version functions/selector cd functions/cli cli override_gem
    0.007008299 s: for gnu_util in '"${gnu_utils[@]}"'
    0.00693653 s: complete -F _crow crow
    0.006803049 s: complete -F _svn -o default -X '@(*/.svn|*/.svn/|.svn|.svn/)' svn
    0.006672906 s: for script in version functions/selector cd functions/cli cli override_gem
    0.005912399 s: for entry in '${scripts[@]}'

In my example, [Powerline][2] turned out to be a massive hog. Looks like I'll
have to troubleshoot the speed or plain disable it.

Don't forget to remove the lines you added to your bash configuration files
after you're done profiling.

[1]: http://stackoverflow.com/a/5015179/2578489
[2]: https://github.com/powerline/powerline
