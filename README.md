git-merge-sync
==============

Imaging cascade-like branches for separate versions with backward compatibility:

    --o                <-- ver-1
       \
    ----o---o--o       <-- ver-2
         \      \
    ------o--o---o--o  <-- ver 3

When You fix some bugs in any old versions You need to merge it into all next
versions:

                  Fix
    --o------------*      <-- ver-1
       \            \
    ----o---o--o-----*    <-- ver-2
         \      \     \
    ------o--o---o--o--*  <-- ver 3

But first You need to pull all changes from remotes to work with up-to-date
history.

The tool `git-merge-sync` can help You to pull, merge and push even all such
cascade-like branches with a one command even.

In the example above You can pull changes (if any) and merge branches with the
following command:

    $ git-merge-sync --pull --merge ver-1 ver-2 ver-3

At first the branches You specify (`ver-1`, `ver-2` and `ver-3`) will be pulled
in fast-forward manner each one from its corresponding upstream branches, if one
configured in the repo. If pull was success then the branches will be merged
by pairs in the order You specify them. So, `ver-1` will be merged into `ver-2`
and then, if success, `ver-2` will be merged into `ver-3`.

After success merges You are only need to look the result, check if everything
is right and push Your changes back to remotes with the command:

    $ git-merge-sync --push ver-1 ver-2 ver-3

See a man for details:

    $ git-merge-sync --man
