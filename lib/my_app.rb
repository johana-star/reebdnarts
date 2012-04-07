require "sinatra/base"
require "sinatra/config_file"

class MyApp < Sinatra::Base
  helpers do
    def partial(template, *args)
      template_array = template.to_s.split('/')
      template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
      options = args.last.is_a?(Hash) ? args.pop : {}
      options.merge!(:layout => false)
      locals = options[:locals] || {}
      if collection = options.delete(:collection) then
        collection.inject([]) do |buffer, member|
          buffer << erb(:"#{template}", options.merge(:layout =>
          false, :locals => {template_array[-1].to_sym => member}.merge(locals)))
        end.join("\n")
      else
        erb(:"#{template}", options)
      end
    end
  end

  register Sinatra::ConfigFile
  config_file '../config/catalog.yml' # Loads the catalog
                                      # See http://www.sinatrarb.com/contrib/config_file.html
  get '/' do
    @beers = settings.beers
    erb :index
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end

