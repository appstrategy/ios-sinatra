require 'sinatra'
require 'json'

get '/' do
  erb :index
end

get '/sushi.json' do
  content_type :json
  return {:sushi => ["Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
end