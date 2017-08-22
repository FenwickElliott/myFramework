require 'bloc_record'

class Serve
    def self.create_table
        @@db ||= BlocRecord.new(File.join(@@app, "db", "data.db"))
        para = Rack::Request.new(@@env).params

        title = para["table_name"]
        scm = {
            para["col1"] => para["type1"]
        }
        @@db.create_table(title, scm)
    end
    self.create_table if @@env["REQUEST_METHOD"] == "POST"
end