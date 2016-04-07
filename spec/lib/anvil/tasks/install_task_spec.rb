require 'spec_helper'

describe InstallTask do
  describe '#task' do
    it 'installs all the dotfiles' do
      expect(subject).to receive(:install_ohmyzsh)
      expect(subject).to receive(:symlink_dotfiles)
      expect(subject).to receive(:install_spacemacs)
    end

    after { subject.task }
  end

  describe '#install_my_zsh' do
    it 'installs oh-my-zsh' do
      expect(subject).to receive(:github_install)
      expect(subject).to receive(:symlink).twice
    end

    after { subject.install_ohmyzsh }
  end

  describe '#symlink_dotfiles' do
    before { File.stub(:exists?).and_return(true) }

    it 'installs the symlinks' do
      expect(subject).to receive(:symlink).exactly(8).times
    end

    after { subject.symlink_dotfiles }
  end

  describe '#install_spacemacs' do
    it 'installs spacemacs' do
      expect(subject).to receive(:github_install)
      expect(subject).to receive(:symlink).twice
    end

    after { subject.install_spacemacs }
  end
end
