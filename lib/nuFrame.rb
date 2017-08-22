require_relative 'hold'
require_relative 'nuframe/util'
require 'erubis'
require 'pry'

class Serve
    def initialize
        @@app = @app = File.join(File.dirname(__FILE__), "..", "app")
    end
    
    def call(env)
        @@env = @env = env
        @path = @path = env["PATH_INFO"]
        # @verb = env["REQUEST_METHOD"]
        @temp_view = File.join(@app, "views", @path + ".html.erb")
        @temp_controller = File.join(@app, "controllers", @path + ".rb")

        if File.exist? @temp_controller
            require_relative @temp_controller
        end

        render
    end

    def render

        if File.exist? @temp_view
            res = 
            [ 
                Erubis::Eruby.new(
                File.read(File.join(@app, "views", "template", "tem.html.erb")) +
                File.read(@temp_view) +
                File.read(File.join(@app, "views", "template", "plate.html.erb"))
                ).result( binding )
            ]
            [200, {'Content-Type' => 'text/html'}, res]
        else
            res = 
            [ 
                Erubis::Eruby.new(
                File.read(File.join(@app, "views", "template", "tem.html.erb")) +
                File.read(File.join(@app, "views", "404.html.erb")) +
                File.read(File.join(@app, "views", "template", "plate.html.erb"))
                ).result( binding )
            ]
            [404, {'Content-Type' => 'text/html'}, res]
        end
    end
end