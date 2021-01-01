Dir.glob('lib/tasks/*.rake').each { |r| load r}

desc "Start everything."
multitask :start => [ 'basetools:xcode', 'basetools:brew', 'brew:install', 'asdf:plugins', 'iterm:configure', 'iterm:ohmyzsh', 'iterm:antigen', 'python:pip', 'neovim:config' ]