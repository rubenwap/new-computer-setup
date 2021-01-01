namespace :brew do

  desc "Install brew packages"
  task :install do
    sh "brew bundle --file=lib/files/brew.txt"  
  end
  
end
  