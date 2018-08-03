require_relative "../config/environment.rb"

class FileMgmt
    @@EXTENSIONS = {".rb" => "#", ".html" => "<!-", ".java" => "//", ".js" => "//", ".cpp" => "//", ".h" => "//", ".css" => "//"}

    def self.editor
        User.logged_in_user.default_editor
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

    #TODO:10: make sure scan only grabs commented todos and not todos in code.
    #TODO:-11: go back and create .ignore file
    def self.scan(file_path)
        todo_hash = {}
        file = ProjectFile.find_or_initialize_by(file_path: file_path.path)
        file.user = User.logged_in_user
        file.save
        # binding.pry
        if File.extname(file_path) != ".db" && self.changed?(file_path.path) || file.sha == nil
            self.remove_old_todos(file_path.path)
            file.update(sha: Digest::SHA1.file(file_path).hexdigest)
            File.foreach(file_path.path).with_index do |line, line_num|
                if line.include?("#{self.extensions[File.extname(file_path)]}TODO:")
                    # binding.pry
                    text = "#{line}"
                    text.gsub!(/#{self.extensions[File.extname(file_path)]}TODO:/, '')
                    text.strip!
                    todo_hash[line_num+1] =  text
                end
            end
        end
        todo_hash
    end

    #TODO:3: Testing.

    def self.scan_all(file_paths)
        all_todos_hash = {}
        file_paths.each do |file_path|
            tmp_holder = self.scan(file_path)
            if !tmp_holder.empty?
                all_todos_hash[file_path.path] = tmp_holder
            end
        end
        self.persist_scans(all_todos_hash)
        all_todos_hash
    end


    def self.open_at_line(line_num, file_path)
        if self.editor == 'code'
            exec("#{self.editor} --goto #{file_path}:#{line_num}")
        elsif self.editor == 'atom' || self.editor == 'subl'
            exec("#{self.editor} #{file_path}:#{line_num}")
        end
    end

    #TODO:2: Testing.

    def self.set_editor(selection)
        if selection == 1
            u = User.logged_in_user
            u.default_editor = 'code'
            puts "Your editor is now set to: Visual Studio Code"
        elsif selection == 2
            u = User.logged_in_user
            u.default_editor = 'atom'
            puts "Your editor is now set to: Atom"
        elsif selection == 3
            u = User.logged_in_user
            u.default_editor = 'subl'
            puts "Your editor is now set to: Sublime"
        end
    end

    def self.priority_bounds(priority_comment_split_size)
        if priority_comment_split_size > 5
            return 5
        elsif priority_comment_split_size < 1
            return 1
        end
        priority_comment_split_size
    end

    #TODO:4: Testing.

    def self.persist_scans(scans)
        scans.each do |file_path, hash_of_todos|
            hash_of_todos.each do |line_num, comment|
                priority_comment_split = comment.split(':')
                # binding.pry
                if priority_comment_split.size == 1
                    new_todo = User.logged_in_user.todos.build(comment: comment, line_number: line_num, priority: 0)
                    new_todo.project_file = ProjectFile.find_by(file_path: file_path)
                elsif priority_comment_split.size == 2
                    # binding.pry
                    priority_comment_split[0] = self.priority_bounds(priority_comment_split[0].to_i)
                    new_todo = User.logged_in_user.todos.build(comment:priority_comment_split[1], line_number: line_num, priority:priority_comment_split[0])
                    new_todo.project_file = ProjectFile.find_by(file_path: file_path)

                end
                if new_todo != nil
                    new_todo.project_file_id = ProjectFile.find_by(file_path: file_path).id
                    new_todo.save
                end
            end
        end
        scans
    end

    #TODO: MORE FUCKING TESTS1
    #TODO: MORE FUCKING TESTS2
    #TODO: MORE FUCKING TESTS3
    #TODO: MORE FUCKING TESTS4
    #TODO: MORE FUCKING TESTS5
    #TODO: testttttt
    def self.remove_old_todos(file_path)
        files_todos = User.logged_in_user.project_files.find_by(file_path: file_path)
        if !ProjectFile.all.where(file_path: file_path).first.user.todos.empty?
            binding.pry
            todo_ids = files_todos.todos.map{|todo| todo.id}
            Todo.destroy(todo_ids)
        end
    end

    def self.changed?(file_path)
        file_sha = Digest::SHA1.file(file_path)
        ProjectFile.find_by(file_path: file_path).sha != file_sha.hexdigest
    end

end
