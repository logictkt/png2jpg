require 'bundler'
Bundler.require
require 'fileutils'

puts 'Start png2jpg ...'

def run_rmagic(dir, file_names, folder_name)
  file_names = Naturally.sort(file_names)
  file_names.each do |file_name|
    i = Magick::Image.read(file_name).first
    i.format = 'JPEG'
    new_name = File.basename(file_name)
    ext = File.extname(new_name)
    new_name.gsub!(ext, '.jpg')
    i.write(File.join(dir, new_name)) { self.quality = 100 }
  end
end

def convert_png_2_jpg(dir)
  folder_name = File.basename(dir)
  puts "Convert png2jpg --> #{dir}"
  file_names = Dir.glob("#{dir}/*.{png,PNG}")
  run_rmagic(dir, file_names, folder_name) unless file_names.count.zero?
  puts file_names
  FileUtils.rm_rf(file_names)
end

def search_dir_convert_png_2_jpg(path)
  dirs = Naturally.sort(Dir.glob("#{path}/**/"))
  if dirs.empty?
    convert_png_2_jpg(path)
  else
    dirs.each { |dir| convert_png_2_jpg(dir) }
  end
end

ARGV.each do |path|
  search_dir_convert_png_2_jpg(path)
end

puts "Finish png2jpg"
