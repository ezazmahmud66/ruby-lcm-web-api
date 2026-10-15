#Sinatra Web Server

require "sinatra/base"

class LCMWebAPI < Sinatra::Base

  configure do
    set :port, ENV.fetch("PORT", "4567").to_i
    set :bind, "127.0.0.1"
    set :show_exceptions, false
  end

  # Home endpoint
  get "/" do
    content_type :text
    "Hello from Ruby LCM API!"
  end

  # Simple HTTP GET endpoint
  get "/hello" do
    content_type :text
    "Sinatra HTTP GET is working!"
  end

  # Query parameter demonstration
  get "/demo" do
    content_type :text

    x = params["x"]
    y = params["y"]

    "Received x=#{x}, y=#{y}"
  end

  # Unknown routes
  not_found do
    content_type :text
    "404 - Route not found"
  end

  run! if app_file == $PROGRAM_NAME
end
