namespace :iterm do
  
  desc "Configure iTerm2"
  task :configure do
    sh "open -a iterm"
    sh "osascript -e 'quit app \"iterm\"'"
    sh "defaults read lib/files/com.googlecode.iterm2.plist"
  end

  desc "Install Oh-My-Zsh"
  task :ohmyzsh do
    destination = './lib/files/oh-my-zsh.sh'
    require 'open-uri'
    download = URI.open('https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh')
    IO.copy_stream(download, destination)
    File.chmod(0777,destination)
    sh "/bin/bash -c #{destination}"
  end

antigenPlugins = %q{
source /usr/local/share/antigen/antigen.zsh
antigen theme romkatv/powerlevel10k
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git-flow
antigen bundle asdf
antigen apply

}

  desc "Antigen plugins"
  task :antigen do
    rd = IO.read '/Users/#{%x[whoami].chomp}/.zshrc'
    IO.write '/Users/#{%x[whoami].chomp}/.zshrc', antigenPlugins  + rd
    
  end
  

end

