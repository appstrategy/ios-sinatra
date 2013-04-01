require 'sinatra'
require 'json'

get '/' do
  erb :index
end

get '/sushi.json' do
  content_type :json
  return {
  	:sushi => [
  		"Maguro", 
  		"Hamachi", 
  		"Uni", 
  		"Saba", 
  		"Ebi", 
  		"Sake", 
  		"Tai"]}.to_json
end

get '/test.json' do
  content_type :json
  return {
  	:test => [
  		1, 
  		2, 
  		3, 
  		4, 
  		5, 
  		6, 
  		7]}.to_json
end

