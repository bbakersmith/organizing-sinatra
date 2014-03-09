require './app'

map '/second-app' do
  run SecondApp
end

map '/' do
  run BasicApp
end
