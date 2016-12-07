require 'sinatra/base'

class DockyOne < Sinatra::Base

  get '/' do
    'Hello, mum!'
  end
end
