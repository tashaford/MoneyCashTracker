require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/transaction'

get '/transactions' do
  @transactions = Transaction.all()
  erb(:"transactions/index")
end

get '/transaction/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @users = User.all()
  erb(:"transactions/new")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb(:create)
end

get '/transaction/total' do
  @transaction = Transaction.total()
  erb(:"transactions/show_total")
end

get '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

get '/transaction/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @tags= Tag.all()
  @merchants = Merchant.all()
  @users = User.all()
  erb(:"transactions/edit")
end

post '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  @transaction.update(params)
  redirect to "transaction/#{params[:id]}"
end


