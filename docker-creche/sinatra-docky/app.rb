require 'sinatra/base'

class SinatraDocky < Sinatra::Application

  get '/' do
    'Hello, from Sinatra!'
  end
end
