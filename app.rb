require 'bundler'
Bundler.require

class BasicApp < Sinatra::Base

  get '/' do
    erb :index
  end

end
