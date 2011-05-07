# My dot-files (coz' there's no place like 127.0.0.1)

## Introduction

These are my dotfiles. They're more a way to learn to use tools like rake, VIM, ZSH, etc. than a real and useful project. I took many ideas for them (and copied a lot of code) from:

* [Ryan Bates](http://github.com/ryanb/dotfile)
* [Bodaniel Jeanes](http://github.com/bjeanes/dot-file)
* [Joe Ferris](http://github.com/jferris/config_file)
* [Nando Vieira](http://github.com/fnando/dotfile)
* [Mislav Marohnić](http://github.com/mislav/dotfile)
* [Martin Grenfell vimfiles](http://github.com/scrooloose/vimfile)
* [carlhuda's janus](https://github.com/carlhuda/janus) (Check it out... the only way to describe it is AWESOME!!)
* [Derek Wyatt](http://www.derekwyatt.org) Have a look at its VIM screencasts, it rocks.
* and some others that I will include when I remember :)

## What it does?

Those files are made just to configure my development system in a way which I'm comfortable with. It also includes some interesting and useful tools that doesn't come by default with Mac OS X Snow Leopard.

## What's included?

* [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh) installation
* some oh-my-zsh customizations
* dotfiles for Rubygems, RDoc, IRB, Capistrano, Ruby on Rails IRB and GIT
* dotfiles for Vim using [Vundle](https://github.com/gmarik/vundle) to install its plugins
* Some alias I like.

## How to install?

First take a look at the included rake tasks with `rake -T` command.

To install all the Vim plugins and snippets you need to open Vim and run `:BundleInstall`

This will install the following plugins

* [Ack.vim](http://github.com/mileszs/ack.vim) to use ack for global finding
* [Textile syntax highlight](http://github.com/timcharper/textile.vim) 
* [Snipmate](http://github.com/msanders/snipmate.vim) and [scrooloose's snippets](http://github.com/scrooloose/snipmate-snippets)
* [Nerdcommenter](http://github.com/scrooloose/nerdcommenter)
* [matchit.vim](http://github.com/edsono/vim-matchit) which extends the `%` Command
* [Surround.vim](http://github.com/tpope/vim-surround) ... the best is that you [read about it](http://www.vim.org/scripts/script.php?script_id=1697), I was amazed first time I used it.
* [Ragtag.vim](http://github.com/tpope/vim-ragtag) to open/close tags the easy way. You can find more info [here](http://www.vim.org/scripts/script.php?script_id=1896).
* [delimitMate](http://github.com/Raimondi/delimitMate)
* [Cucumber syntax highlighting](http://github.com/tpope/vim-cucumber)
* [Ruby refactoring plugin](http://github.com/ecomba/vim-ruby-refactoring), which supports some common ruby refactoring like extract a method or move post conditional.
* [Javascript syntax highlight](http://github.com/pangloss/vim-javascript)
* [Supertab](http://github.com/ervandew/supertab) which together with rubycomplete.vim works amazing with ruby auto completion
* ZoomWin to be able to set a window full screen with `<leader>z`
* [Fugitive.vim](https://github.com/tpope/vim-fugitive) An really good vim plugin to handle GIT. Give it a try if you haven't done yet.

## Can I use them?

Yes of course... but do it at your own risk. Ask me if you need some help or just fix what you think is wrong, but I cant guarantee that it will work.

These files are MIT licensed so you can just change them as you want. However if you do some interesting thing with them I'd be pleased if you let me know... Just some little curiosity, you know ;)

## Should I use them?

No, you probably shouldn't. There are good and well maintained VIM bundles and dot-files out there which you may use and are for sure better build than those. Take a look at [Janus](https://github.com/carlhuda/janus)

## TODO

1. Find a better way to install http://github.com/robbyrussell/oh-my-zsh and its customizations
