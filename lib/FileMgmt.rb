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

    #TODO: Do we need this?
    def self.print_file_name
        self.get_all_files_in_dir.each do |file|
            puts file.path
        end
    end

    #TODO: this is a test
    def self.scan_file(file_path)
        result = {}
        File.foreach(file_path).with_index do |line, line_num|
            if line.include?("#TODO:")
                text = "#{line}"
                text.gsub!(/#TODO:/, '')
                text.strip!
                result[line_num] =  text
            end
        end
        result
    end

    def self.open_at_line(line_num, file_path)
        exec("code #{file_path}:#{line_num}")
    end
end