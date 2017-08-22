require 'bloc_record'

class Serve
    def self.create_table
        para = Rack::Request.new(@@env).params
        scm = {}
        for i in 1..para.length
            if para["col#{i}"] && para["col#{i}"].length > 0
                scm.store( para["col#{i}"] , para["type#{i}"] )
            end
        end
        @@db.create_table(para["table_name"], scm)
        puts 'table created'
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
end