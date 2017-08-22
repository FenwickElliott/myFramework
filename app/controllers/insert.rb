class Serve
    def self.build_form
        tbl = @@env["QUERY_STRING"]
        scm = @@db.schema(tbl)

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
        res
    end

    def self.insert
        para = Rack::Request.new(@@env).params
        puts para

    end
    self.insert if @@env["REQUEST_METHOD"] == "POST"
end