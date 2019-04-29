require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("../models/publisher")
also_reload( '../models/*' )

get '/publishers' do
  @publishers = Publisher.all()
  erb (:"publishers/index")
end

get '/publishers/new' do
  erb(:"publishers/new")
end

post '/publishers' do
  Publisher.new(params).save
  redirect to '/publishers'
end
