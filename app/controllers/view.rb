require 'bloc_record'

class Serve
    def self.view_table
        tbl = @@env["QUERY_STRING"]
        scm = @@db.schema(tbl)
        res = <<-RES
        <table style="width:100%">
            <tr>
        RES
        scm.keys.each {|k| res << "<th>#{k}</th>"}
        res << "</tr>"

        for i in 1..@@db.count(tbl)
            res << "<tr style='text-align:center'>\n"
            @@db.objectify_row(tbl,i).values.each {|v| res << "<td>#{v}</td>"}
            res << "</tr>\n"
        end
        res
    end
end