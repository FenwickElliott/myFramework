require 'bloc_record'

class Serve
    def self.create_table
        para = Rack::Request.new(@@env).params

        title = para["table_name"]
        scm = {
            para["col1"] => para["type1"]
        }
        @@db.create_table(title, scm)
    end
    self.create_table if @@env["REQUEST_METHOD"] == "POST"

    def self.build_form(n)
        res = ""
        for i in 1..n do
            res << "<b>Column #{i}:</b>"
            res << <<-CMD
                name: <input type="text" name="col#{i}"> type: <input type="text" name="type#{i}">
            CMD
            res << "<br/>"
        end
        res
    end

    def self.ping(res)
        res
    end
end