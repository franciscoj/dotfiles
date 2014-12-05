require 'spec_helper'

describe InstallTask do
  describe '#task' do
    it 'installs all the dotfiles' do
      expect(subject).to receive(:install_ohmyzsh)
      expect(subject).to receive(:symlink_dotfiles)
      expect(subject).to receive(:install_prelude)
      expect(subject).to receive(:install_binaries)
    end

    after { subject.task }
  end

  describe '#install_my_zsh' do
    it 'installs oh-my-zsh' do
      expect(subject).to receive(:github_install)
      expect(subject).to receive(:symlink)
    end

    after { subject.install_ohmyzsh }
  end

  describe '#symlink_dotfiles' do
    before { File.stub(:exists?).and_return(true) }

    it 'installs the symlinks' do
      expect(subject).to receive(:symlink).exactly(10).times
    end

    after { subject.symlink_dotfiles }
  end

  describe '#install_prelude' do
    it 'installs prelude' do
      expect(subject).to receive(:github_install)
      expect(subject).to receive(:symlink).twice
    end

    after { subject.install_prelude }
  end
end
