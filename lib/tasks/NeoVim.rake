require 'fileutils'
require 'open-uri'

def download(url, file, folder)
  destination = "#{folder}/#{file}"
  download = URI.open("#{url}#{file}")
  IO.copy_stream(download, destination)
  File.chmod(0777,destination)
end

namespace :neovim do

desc "Restore Neovim config"
task :config do
FileUtils.mkdir_p '/Users/#{%x[whoami].chomp}/.config/nvim'
download('https://raw.githubusercontent.com/rubenwap/neovim-config/master/','init.vim', '/Users/ruben/.config/nvim')

end
  
end
