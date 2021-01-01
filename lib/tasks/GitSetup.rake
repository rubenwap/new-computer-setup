namespace :git do

  desc "Configure git"
  task :configure do
    print "Enter your git display name: "
    name = $stdin.gets.chomp
    print "Enter your git email: "
    email = $stdin.gets.chomp
    sh "git config --global user.name #{name}"
    sh "git config --global user.email #{email}"
    sh "ssh-keygen -t rsa -b 4096 -C #{email}"
    sh "ssh-add -K ~/.ssh/id_rsa"
    sh "cat ~/.ssh/id_rsa.pub | pbcopy"
    puts "YOUR PUBLIC KEY HAS BEEN COPIED. PASTE IT IN GITHUB/GITLAB/BITBUCKET TO COMPLETE THE OPERATION"
  end
  
  
end
