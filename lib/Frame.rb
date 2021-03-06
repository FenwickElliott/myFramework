require_relative 'hold'
require_relative 'frame/util'
require 'erubis'
require 'pry'
require 'bloc_record'

class Serve
    def initialize
        @@app = @app = File.join(File.dirname(__FILE__), "..", "app")
        @@db = BlocRecord.new(File.join(@@app, "db", "data.db"))
    end
    
    def call(env)
        @@env = env
        @@path = env["PATH_INFO"]
        @temp_view = File.join(@@app, "views", @@path + ".html.erb")
        @temp_controller = File.join(@@app, "controllers", @@path + ".rb")

        if File.exist? @temp_controller
            require_relative @temp_controller
        end

        render
    end

    # def self.redirect(path, verb = "GET", qs = "")
    #     puts 'redirecting'
    #     @@env["PATH_INFO"] = path
    #     @@env["REQUEST_PATH"] = path
    #     @@env["REQUEST_URI"] = path
    #     @@env["REQUEST_METHOD"] = verb
    #     @@env["QUERY_STRING"] = qs

    #     call(@@env)
    # end

    def render
        # puts 'rendering'
        # puts @@env
        if File.exist? @temp_view
            res = 
            [ 
                Erubis::Eruby.new(
                File.read(File.join(@@app, "views", "template", "tem.html.erb")) +
                File.read(@temp_view) +
                File.read(File.join(@@app, "views", "template", "plate.html.erb"))
                ).result( binding )
            ]
            [200, {'Content-Type' => 'text/html'}, res]
        else
            res = 
            [ 
                Erubis::Eruby.new(
                File.read(File.join(@@app, "views", "template", "tem.html.erb")) +
                File.read(File.join(@@app, "views", "404.html.erb")) +
                File.read(File.join(@@app, "views", "template", "plate.html.erb"))
                ).result( binding )
            ]
            [404, {'Content-Type' => 'text/html'}, res]
        end
    end
end