require_relative "../config/environment.rb"

class FileMgmt
    @@EDITOR = "code"
    @@EXTENSIONS = {".rb": "#", ".html": "<!-", ".java": "//", ".js": "//", ".cpp": "//", ".h": "//", ".css": "//"}

    def self.editor
        @@EDITOR
    end

    def self.extensions
        @@EXTENSIONS
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

    def get_priority(comment)

    end

    #TODO: make sure scan only grabs commented todos and not todos in code.
    #TODO: go back and create .ignore file
    def self.scan(file_path)
        todo_hash = {}
        file = ProjectFile.find_or_create_by(file_path: file_path.path)
        # binding.pry
        if File.extname(file_path) != ".db" && self.changed?(file_path.path) || file.sha == nil
            file.update(sha: Digest::SHA1.file(file_path).hexdigest)
            File.foreach(file_path.path).with_index do |line, line_num|
                
                if line.include?("#{self.extensions[File.extname(file_path)]}TODO:")
                    text = "#{line}"
                    text.gsub!(/#{self.extensions[File.extname(file_path)]}TODO:/, '')
                    text.strip!
                    todo_hash[line_num+1] =  text
                end
            end
        end
        todo_hash
        # binding.pry
    end
    
    def self.scan_all(file_paths)
        all_todos_hash = {}
        file_paths.each do |file_path|
            tmp_holder = self.scan(file_path)
            if !tmp_holder.empty?
                all_todos_hash[file_path.path] = tmp_holder
            end
        end
        self.replace_old_todos(all_todos_hash)
        all_todos_hash
    end

    
    def self.open_at_line(line_num, file_path)
        if self.editor == 'code'
            exec("#{self.editor} --goto #{file_path}:#{line_num}")
        elsif self.editor == 'atom' || self.editor == 'subl'
            exec("#{self.editor} #{file_path}:#{line_num}")
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

    def self.persist_scans(scans)
        scans.each do |file_path, hash_of_todos|
            hash_of_todos.each do |line_num, comment|
                new_todo = User.logged_in_user.todos.build(comment:comment, line_number: line_num)
                new_todo.project_file = ProjectFile.find_by(file_path: file_path)
                new_todo.save
            end
        end
        scans
    end

    def self.replace_old_todos(all_todos_hash)
        all_todos_hash.each do |file_path, comments|
            todo_ids = User.logged_in_user.todos.map {|todo| todo.id}
            Todo.destroy(todo_ids)
        end
        self.persist_scans(all_todos_hash)
    end

    def self.changed?(file_path)
        file_sha = Digest::SHA1.file(file_path)
        ProjectFile.find_by(file_path: file_path).sha != file_sha.hexdigest
    end

end