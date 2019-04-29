require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/games_controller')
require_relative('controllers/publishers_controller')

get '/' do
  erb( :index )
end
