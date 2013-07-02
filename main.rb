require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'sinatra/activerecord'

set :database, {adapter: "postgresql",
                database: "guitar_development_new",
                host: 'localhost'}


########################
## Guitars Collection ##
########################

#inherits from the ActiveRecord::Base class
class Guitar < ActiveRecord::Base
end

# This route shows entire list of guitar
get '/' do
  @guitars = Guitar.all
  erb :index
end

# This is the route that shows you the page to make new guitars
get '/guitars/new' do
  erb :new
end

# Shows a single guitar by ID number
get '/guitars/:id' do
  id = params[:id]
  @guitar = Guitar.find(id)
  erb :show
end

# This route creates a new guitar in the database
# The form for this one is in the GET '/guitars/new' route above
post '/guitars/new' do
  guitar = Guitar.create(params)
  redirect to "/guitars/#{guitar.id}"
end

get '/guitars/:id/edit' do
  id = params[:id]
  @guitar = Guitar.find(id)
  erb :edit
end

# This route updates a guitar record
# Form for this is the GET '/guitars/:id/edit above'
post '/guitars/:id/update' do
  # Pulling in the params from the data posted in the form
  id =    params[:id]
  make =  params[:make]
  model = params[:model]
  year =  params[:year]
  color = params[:color]

  guitar = Guitar.find(id)
  guitar.make = make
  guitar.model = model
  guitar.year = year
  guitar.color = color
  guitar.save
  redirect to "/guitars/#{guitar.id}"
end

# This route deletes a guitar record.
# This should probably be a DELETE or POST, but this is simpler for the moment
get '/guitars/:id/delete' do
  id = params[:id]
  Guitar.find(id).destroy
  redirect to '/'
end
