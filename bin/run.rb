require_relative '../config/environment'

all_file_paths = FileMgmt.get_all_files_in_dir
puts FileMgmt.scan_all(all_file_paths)

puts FileMgmt.scan_file("/Users/agent/Development/code/module-one-final-project-guidelines-dumbo-web-071618/Thorfile")



Pry.start
