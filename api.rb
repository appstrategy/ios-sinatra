require 'sinatra'
require 'json'
require 'mongoid'

Mongoid.load!("mongoid.yml")
 
 
class Price
    include Mongoid::Document
    
    field :share_id, type: Integer
    field :date, type: Time
    field :open, type: Integer
    field :close, type: Integer
    field :high, type: Integer
    field :low, type: Integer
    field :volume, type: Integer
end
 
class Company
    include Mongoid::Document
    
    field :code, type: String
    field :sector,    type: String
    field :share_id, type: Integer
    field :jse_code, type: Integer
end
 
get '/companies.json' do
    content_type :json
    all_companies = Company.all
    all_companies.to_json
end
 
 
get '/companies/:code/prices.json' do
    content_type :json
    company = Company.where(code: params[:code])[0]
    
    Price.where('share_id' => company.share_id)
          .order_by('date', :desc)
          .to_a
          .reverse
          .to_json
end

