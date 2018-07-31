require_relative "../config/environment.rb"

class FileMgmt
    @@EDITOR = "atom"

    def self.editor
        @@EDITOR
    end

    def self.get_all_files_in_dir(dir_path = Dir.pwd)
        files_array = []
        Dir.foreach(dir_path) do |item|
            if item == '.' || item == '..' || item == '.git'
                next
            elsif File.directory? "#{dir_path}/#{item}"
                files_array << FileMgmt.get_all_files_in_dir("#{dir_path}/#{item}")
            else
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

    def self.scan(file_path)
        todo_hash = {}
        File.foreach(file_path).with_index do |line, line_num|
            if line.include?("#TODO:")
                text = "#{line}"
                text.gsub!(/#TODO:/, '')
                text.strip!
                todo_hash[line_num] =  text
            end
        end
        todo_hash
    end

    def self.scan_all(file_paths)
        all_todos_hash = {}
        file_paths.each do |file_path|
            tmp_holder = self.scan(file_path)
            if !tmp_holder.empty?
                all_todos_hash[file_path.path] = tmp_holder
            end
        end
        all_todos_hash
    end

    def self.open_at_line(line_num, file_path)
        if self.editor == 'code'
            exec("$EDITOR --goto #{file_path}:#{line_num}")
        elsif self.editor == 'atom' || self.editor == 'subl'
            exec("$EDITOR #{file_path}:#{line_num}")
        end
    end

    def self.set_editor(selection)
        if selection == 1
            @@EDITOR = 'code'
        elsif selection == 2
            @@EDITOR = 'atom'
        elsif selection == 3
            @@EDITOR = 'subl'
        end
    end
end