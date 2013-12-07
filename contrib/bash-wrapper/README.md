Bash wrapper for `git-merge-sync`
=================================

At first time it was just a temporary wrapper for `git-merge-sync`.
When you need to use `git-merge-sync` in your repository, that repo often has
exactly one set of branches for cascading. Probably, you doesn't change that
set every day, so you don't want to write names of that branches every time
you run `git-merge-sync`.

So, you just need to hardcore names of the branches in the wrapper-script once
and change it far later, when set of target branches will be changed.
Also, may be, you need to change something in the `USAGE`, which you will
see when run a wrapper with `--help` option.

You, probably, need to put copy of the wrapper script in the root of your
repository, specify path to `git-merge-sync` and names of the branches.

In my repository, where this script was createted first time, I called
it `gms~` (because I had `*~` in the `.gitignore` to ignore any backup files).
Then I run it, for example, just with `./gms~ -lm` for pulling and merging.
Looks like comfortably, IMHO.
