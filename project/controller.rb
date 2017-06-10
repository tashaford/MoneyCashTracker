require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/transaction'

get '/transactions' do
  @transactions = Transaction.all()
  erb(:index)
end

get 'transaction/new' do
  erb(:new)
end

post 'transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:create)
end