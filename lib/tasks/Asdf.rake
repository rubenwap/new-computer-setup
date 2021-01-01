namespace :asdf do
  
  desc "Install plugins"
  task :plugins do
    sh "asdf plugin add ruby"
    sh "asdf plugin add erlang"
    sh "asdf plugin add elixir"
    sh "asdf plugin add python" 
    sh "asdf plugin add java"  
    sh "asdf plugin add scala"  
  end

end
