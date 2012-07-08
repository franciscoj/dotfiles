require 'rubygems'
require 'thor'

class Dotfiles < Thor
  include Thor::Actions
  source_root File.join(File.expand_path(File.dirname(__FILE__)), 'templates')

  desc :ruby, 'Installs ruby dotfiles'
  def ruby
    self.install 'ruby'
  end

  desc :misc, "Install misc dotfiles"
  def misc
    self.install 'misc'
  end

  desc :bash, "Install bash dotfiles"
  def bash
    self.install 'bash'
  end

  desc :git, "Install git dotfiles"
  def git
    template 'gitconfig.erb', 'git/gitconfig'

    install 'git'
  end

  desc :vim, "Install Vim dotfiles"
  def vim
    install 'gvimrc'

    remove_file "#{self.home}/.vim"
    link_file 'vim', "#{self.home}/.vim"
    system %Q{vim +BundleInstall +qall}
  end

  desc :zsh, "Install ZSH dotfiles"
  def zsh
    install 'zsh'

    remove_file "#{self.home}/.oh-my-zsh"
    system %Q{/usr/bin/env git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh}
  end

  desc :all, "Install all dotfiles"
  def all
    self.ruby
    self.git
    self.bash
    self.zsh
    self.vim
  end

  protected

  def home
    @home ||= Thor::Util.user_home
  end

  def install(folder)
    Dir["#{folder}/*"].each do |file|
      next if file == folder

      self.link_dotfile file.split('/')[1], File.expand_path(file)
    end
  end

  def link_dotfile(dotfile, absolute_file_path)
    create_link "#{self.home}/.#{dotfile}", absolute_file_path
  end
end
