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
    github_install 'robbyrussell/oh-my-zsh', '~/.oh-my-zsh'

    symlink 'zsh/zshrc'
  end

  def symlink_dotfiles
    %w(ruby/gemrc ruby/irbrc ruby/railsrc ruby/rdebugrc).each do |file|
      symlink file
    end

    symlink_if_exists 'ruby/default-gems', '~/.rbenv/default-gems', '~/.rbenv'
  end

  def install_prelude
    github_install 'bbatsov/prelude', '~/.emacs.d'

    symlink 'emacs/personal.el', '~/.emacs.d/personal/personal.el'
    symlink 'emacs/prelude-modules.e.', '~/.emacs.d/prelude-modules.el'
  end

  def install_snippets
    github_install 'AndreaCrotti/yasnippet-snippets',
                   '~/.emacs.d/yasnippet-snippets'

    symlink 'emacs/snippets', '~/.emacs.d/personal-snippets'
  end

  protected

  def project_root
    %x{git rev-parse --show-toplevel}.strip
  end

  def symlink(orig_file, dest_file = nil)
    dest_file ||= orig_file.split('/').last
    orig_file = "#{project_root}/#{orig_file}"

    if !File.identical? origp_file, dest_file
      File.symlink orig_file, "~/.#{dest_file}"
    else
      Anvil.logger "Not symlinking #{orig_file} to #{dest_file}" \
                   "since they are identical."
    end
  end

  def symlink_if_exists(orig, dest, condition)
    symlink orig, dest if File.exists? condition
  end

  def remove_if_exists(path)
    FileUtils.rm_rf path if File.exists? path
  end

  def github_clone(repo, dest_path)
    Git.clone "git@github.com:#{repo}.git", path: dest_path
  end

  def github_install(repo, dest_path)
    remove_if_exists dest_path
    github_clone repo, dest_path
  end
end
