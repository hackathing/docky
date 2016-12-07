require 'sinatra/base'

class SinatraDocky < Sinatra::Base

  # Available on local network
  set :bind, "0.0.0.0"

  get '/' do
    'Hello, from Sinatra!'
  end
end
