# diabolo does dotfiles

this is a forked project of [holman does dotfiles](https://github.com/holman/dotfiles).

for the original blog article by Holman which inspired this [see](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)

## dotfiles

My personalised mix of dotfiles will focus on Git, Homebrew, RVM and VIM. I will try and make them useful on nix VM's as well as OSX.

## install

This install is destructive, it will create a number of symlinks in your home folder. Files or existing symlinks will be replaced

- `git clone git://github.com/diabolo/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

However everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## what's inside

A lot of what's inside is just aliases.  You can browse the `aliases.zsh` files in each topic directory. There's also a collection of scripts in `bin` you can browse. A few notable ones:

###rails
- `s` pings your system for any running Rails apps, and `deathss` will then
  kill all of them indiscriminately. `ss` starts up a new Rails server on the
  next available port- if 3000 is taken, it'll spin up your server on 3001.

###system
- `c` is an autocomplete shortcut to your projects directory. For example, `c
  git` and then hitting tab will autocomplete to `github`, and then it simply
  changes to my `github` directory.
- `check [filename]` is a quick script that tells you whether a domain is
  available to register.
- `smartextract [filename]` will extract about a billion different
  compressed/uncompressed/whatever files and you'll never have to remember the
  syntax.
- `backup` is a quick hook into `rsync` to backup a selection of files. Check
  out the comments for more details.

###fun
- `cloudapp` uploads any file to [CloudApp](http://getcloudapp.com).
- `gifme` is a command-line animated GIF generator. It's also amazing.

##moar custom
There are a few things I use to make my life awesome. They're not a required
dependency, but if you make it happen, THEY'LL MAKE **YOU** HAPPEN.

- If you want some more colors for things like `ls`, install grc: `brew install
  grc`.
- If you install the excellent [rvm](http://rvm.beginrescueend.com) to manage
  multiple rubies, your current branch will show up in the prompt. Bonus.

## thanks

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
