require 'bundler'
Bundler.require

require_relative 'lib/basic_helpers.rb'


class BasicApp < Sinatra::Base


  helpers BasicHelpers


  get '/' do
    erb :index, :locals => {:current_time => get_current_time}
  end


end
