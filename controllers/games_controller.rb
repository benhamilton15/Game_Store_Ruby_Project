require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("../models/game")
also_reload( '../models/*' )

get '/games' do
  @games = Game.all()
  erb (:"games/index")
end

get '/games/new' do
  @publishers = Publisher.all()
  erb(:"games/new")
end

post '/games' do
  Game.new(params).save
  redirect to '/games'
end

get '/games/:id' do
  @game = Game.find(params['id'])
  erb(:"/games/show")
end
