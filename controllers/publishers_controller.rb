require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("../models/publisher")
also_reload( '../models/*' )

get '/publishers' do
  @publishers = Publisher.all()
  erb (:"publishers/index")
end

get '/publishers/list' do
  @publishers = Publisher.all()
  erb (:"publishers/list")
end

get '/publishers/new' do
  erb(:"publishers/new")
end

post '/publishers' do
  Publisher.new(params).save
  redirect to '/publishers'
end

get '/publishers/:id' do
  @publisher = Publisher.find(params['id'])
  erb(:"/publishers/show")
end

get '/publishers/:id/edit' do
  @publisher = Publisher.find(params['id'])
  erb(:"/publishers/edit")
end

post '/publishers/:id' do
  publisher = Publisher.new(params)
  publisher.update()
  redirect to "/publishers/#{params['id']}"
end

post '/publishers/:id/delete' do
  publisher = Publisher.find(params['id'])
  publisher.delete
  redirect to '/publishers'
end
