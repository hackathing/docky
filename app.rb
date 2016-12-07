require 'sinatra/base'

class SinatraDocky < Sinatra::Base

  get '/' do
    'Hello, mum!'
  end
end
