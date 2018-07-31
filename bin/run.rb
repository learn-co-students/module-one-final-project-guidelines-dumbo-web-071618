require_relative '../config/environment'

all_file_paths = FileMgmt.get_all_files_in_dir
FileMgmt.scan_all(all_file_paths).each do |file, value|
  puts "\nfile: #{file}\n "
  value.each do |v|
    puts "#{v}"
  end
end



Pry.start
