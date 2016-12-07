require 'sinatra/base'

class SinatraDocky < Sinatra::Base

  get '/' do
    'Hello, from Sinatra!'
  end
end
