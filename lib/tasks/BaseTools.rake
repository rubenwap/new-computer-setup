namespace :basetools do

desc "Install Xcode Build Tools"
task :xcode do 
  sh "xcode-select --install"
end

desc "Install Homebrew"
task :brew do
  destination = './lib/files/brew.sh'
  require 'open-uri'
  download = URI.open('https://raw.githubusercontent.com/Homebrew/install/master/install.sh')
  IO.copy_stream(download, destination)
  File.chmod(0777,destination)
  sh "/bin/bash -c #{destination}"
end

end