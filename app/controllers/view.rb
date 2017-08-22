require 'bloc_record'

class Serve
    def self.view_table
        tbl = @@env["QUERY_STRING"]
        scm = @@db.schema(tbl)
        res = <<-RES
        <table style="width:100%">
            <tr>
        RES
        scm.keys.each {|k| res << "<th>#{k}</th>\n"}
        res << "</tr>"
    end

end