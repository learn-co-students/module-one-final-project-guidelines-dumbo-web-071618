require_relative "../config/environment.rb"
class FileMgmt

    def self.get_all_files_in_dir(dir_path = Dir.pwd)
        files_array = []
        Dir.foreach(dir_path) do |item|
            # binding.pry
            if item == '.' || item == '..' || item == '.git'
                next
            elsif File.directory? "#{dir_path}/#{item}"
                # binding.pry
                files_array << FileMgmt.get_all_files_in_dir("#{dir_path}/#{item}")
            else
                # binding.pry
                files_array << File.new("#{dir_path}/#{item}", "r+")
            end
        end
        files_array.flatten
    end

    def self.print_file_name
        self.get_all_files_in_dir.each do |file|
            puts file.read
        end
    end
end