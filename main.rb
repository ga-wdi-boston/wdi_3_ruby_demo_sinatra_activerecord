require 'pg'
require 'pry' if development?
require 'sinatra'
require 'sinatra/reloader' if development?

helpers do

end

########################
## Guitars Collection ##
########################

# This route shows entire list of guitar
get '/' do
end

# Shows a single guitar by ID number
get '/guitars/:id' do
end

get '/guitars/new' do
end

# This route creates a new guitar in the database
# The form for this one is in the GET '/guitars/new' route above
post '/guitars/new' do
end

get '/guitars/:id/edit' do
end

# This route updates a guitar record
# Form for this is the GET '/guitars/:id/edit above'
put '/guitars/:id' do
end

# This route deletes a guitar record
delete '/guitars/:id' do
end
