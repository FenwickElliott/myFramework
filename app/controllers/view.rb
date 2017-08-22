require 'bloc_record'

class Serve
    def self.get_table
        # puts @@db.count('third')
        # puts @@db.objectify_table('third')

        scm = @@db.schema('fourth')
    end

    def self.view_table(tbl)
        scm = @@db.schema(tbl)
        res = <<-RES
        <table style="width:100%">
            <tr>
        RES
        scm.keys.each {|k| res << "<th>#{k}</th>\n"}
        res << "</tr>"
    end

end