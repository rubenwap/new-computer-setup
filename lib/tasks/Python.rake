namespace :python do
desc "Install pip dependencies"
  task :pip do
    sh "pip3 install -r ./lib/files/requirements.txt"  
  end
end
