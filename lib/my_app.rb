require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    erb :index
  end
  
  get '/2' do
    erb :index2
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

