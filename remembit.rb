require 'rubygems'
require 'sinatra'
require 'active_record'
require 'active_support'

dbconfig = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection dbconfig['production']

class Item < ActiveRecord::Base
  
end

get '/' do
  @items = Item.all
  erb :index
end

post '/' do
  Item.create(:body => params[:body])
  redirect '/'
end

delete '/:id' do
  Item.delete(params[:id])
  redirect '/'
end
