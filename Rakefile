require 'rake'
require 'erb'

$replace_all = false

namespace :install do
  desc "Install ruby related dotfiles"
  task :ruby do
    install("ruby")
  end

  desc "Install git related dotfiles"
  task :git => "generate:gitconfig" do
    install("git")
  end

  desc "Install shell related dotfiles"
  task :shell do
  end

  desc "Install all the dotfiles"
  task :all => [:ruby, :git, :shell]
end

namespace :generate do
  desc "Generates the gitconfig file"
  task :gitconfig do
    puts "generating gitconfig"
    File.open(File.join("git", "gitconfig"), 'w') do |new_file|
      new_file.write ERB.new(File.read(File.join("git", "gitconfig.erb"))).result(binding)
    end
  end
end

def install(folder)
  Dir["#{folder}/*"].each do |file|
    next if file =~ /.erb$/
    file_name = File.basename(file)
    if File.exist?(File.join(ENV['HOME'], ".#{file_name}"))
      if File.identical? file, File.join(ENV['HOME'], file_name)
        puts "identical ~/.#{fike}"
      elsif $replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file_name}? [ynaq] "
        case $stdin.gets.chomp
          when 'a'
            $replace_all = true
            replace_file(file)
          when 'y'
            replace_file(file)
          when 'q'
            exit
          else
            puts "skipping ~/.#{file_name}"
          end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{File.basename(file)}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{File.basename(file)}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{File.basename(file)}"}
end
