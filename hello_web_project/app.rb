require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
    configure :development do 
        register Sinatra::Reloader 
    end

get '/' do
    return 'Hello!'
end

get '/posts' do
    name = params[:name] #params hash is preconfigured by Sinatra, so we access its keys in the square brackets to read back the values provided as parameters in the get request (in this case, Cassius and January)
    cohort = params[:cohort]

    return "Hello #{name}, you are in #{cohort} cohort"
    #Returns above string when sent this get query: http://localhost:9292/posts?name=Cassius&cohort=January
end
 
get '/hello' do
    name = params[:name]
    return "Hello #{name}"
end

get '/names' do
    names = params[:names]
    return names
end

post '/posts' do
    return 'Post was created'
end

post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you sent this message: #{message}"
end

post '/sort-names' do
    names = params[:names]

    names_array = names.split(",").sort!.join(",")
    return names_array
end

end


