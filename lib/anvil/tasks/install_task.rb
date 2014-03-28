require 'anvil'
require 'anvil/task'

class InstallTask < Anvil::Task
  description 'Installs the dot-files'

  def task
    install_ohmyzsh
    symlink_dotfiles
    install_prelude
    install_snippets
  end

  def install_ohmyzsh
    Anvil.logger.info 'Installing oh-my-zsh'
    github_install 'robbyrussell/oh-my-zsh', on_home('.oh-my-zsh')

    symlink 'zsh/zshrc'
    touch_unless_exists on_home('.zshrc_local')
  end

  def symlink_dotfiles
    Anvil.logger.info 'Symlinking dot-files'
    %w(ruby/gemrc ruby/irbrc ruby/railsrc ruby/rdebugrc ruby/pryrc).each do |file|
      symlink file
    end

    %w(git/gitconfig git/gitignore).each do |file|
      symlink file
    end

    %w(others/agignore others/tmux.conf).each do |file|
      symlink file
    end

    symlink_if_exists 'ruby/default-gems',
                      on_home('.rbenv/default-gems'),
                      on_home('.rbenv')
    touch_unless_exists on_home('.gemrc_local')
  end

  def install_prelude
    Anvil.logger.info 'Installing prelude'
    github_install 'bbatsov/prelude', on_home('.emacs.d')

    symlink 'emacs/personal.el', on_home('.emacs.d/personal/personal.el')
    symlink 'emacs/prelude-modules.el', on_home('.emacs.d/prelude-modules.el')
  end

  def install_snippets
    Anvil.logger.info 'Installing snippets'
    github_install 'AndreaCrotti/yasnippet-snippets',
                   on_home('.emacs.d/yasnippet-snippets')

    symlink 'emacs/snippets', on_home('.emacs.d/personal-snippets')
  end

  protected

  def touch_unless_exists path
    FileUtils.touch path unless File.exists? path
  end

  def project_root
    %x{git rev-parse --show-toplevel}.strip
  end

  def symlink(orig_file, dest_file = nil)
    dest_file ||= on_home ".#{orig_file.split('/').last}"
    orig_file = "#{project_root}/#{orig_file}"

    if !File.identical? orig_file, dest_file
      File.symlink orig_file, dest_file
    else
      Anvil.logger.info "Not symlinking #{orig_file} to #{dest_file}" \
                        " since they are identical."
    end
  end

  def symlink_if_exists(orig, dest, condition)
    symlink orig, dest if File.exists? condition
  end

  def remove_if_exists(path)
    FileUtils.rm_rf path if File.exists? path
  end

  def github_clone(repo, dest_path)
    Git.clone "git@github.com:#{repo}.git", '', path: dest_path
  end

  def github_install(repo, dest_path)
    remove_if_exists dest_path
    FileUtils.mkdir_p dest_path
    github_clone repo, dest_path
  end

  def on_home(file)
    "#{ENV['HOME']}/#{file}"
  end
end
