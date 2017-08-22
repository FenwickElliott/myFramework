class Serve
    def self.decide
        return self.build_form if @@env["REQUEST_METHOD"] == "GET"
        self.insert if @@env["REQUEST_METHOD"] == "POST"
        # redirect_here
    end

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
            <input type="hidden" name="tbl" value="#{tbl}">
            <input type="submit">
            </form>
        FORM
        res
    end

    def self.insert
        para = Rack::Request.new(@@env).params
        tbl = para.delete("tbl")
        begin
            @@db.insert(tbl, para)
        rescue => e
            puts e
        end
    end
end