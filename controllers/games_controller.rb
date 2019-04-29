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

get '/games/:id/edit' do
  @game = Game.find(params['id'])
  @publishers = Publisher.all()
  erb(:"/games/edit")
end

post '/games/:id' do
  publisher = Game.new(params)
  publisher.update()
  redirect to "/games/#{params['id']}"
end
