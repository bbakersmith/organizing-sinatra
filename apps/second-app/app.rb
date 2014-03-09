class SecondApp < Sinatra::Base


  set :root, File.dirname(__FILE__)


  get '/' do
    erb :index
  end


end
