require 'fileutils'

Dir.glob("*.jpg") do |filename|
  newname = filename.gsub(/^(\d+)/, sprintf("%04d", $1.to_i))
  FileUtils.mv(filename, newname)
end
