class Serve
    def self.insert
        tbl = @@env["QUERY_STRING"]
        scm = @@db.schema(tbl)
    # end

    # def self.build_form
        res = <<-FORM
        <h1> Inserting into #{tbl} </h1>
        <form action="/insert" method="POST">
        FORM
        scm.delete('id')
        scm.keys.each do |k|
            res << <<-CELL
                #{k} <input type="text" name="#{k}">
                <br/>
            CELL
        end
        res << <<-FORM
            <input type="submit">
            </form>
        FORM
        puts res
        res
    end
end