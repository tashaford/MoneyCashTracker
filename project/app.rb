require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/transactions_controller')
require_relative('controllers/user_controller')

get '/' do
  erb(:index)
end