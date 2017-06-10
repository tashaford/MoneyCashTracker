require_relative '../models/transactions'
require_relative '../models/user'

transaction1 = Transaction.new({
  "amount" => 15.50,
  "description" => "Date night",
  "tag" => "eat out",
  "merchant" => "ocho",
  "user_id" => user1.id
  })
transaction1.save()

transaction2 = Transaction.new({
  "amount" => 32.45,
  "description" => "restocked freezer",
  "tag" => "food",
  "merchant" => "tesco",
  "user_id" => user1.id
  })
transaction2.save()

transaction3 = Transaction.new({
  "amount" => 14.50,
  "description" => "weekly bus ticket",
  "tag" => "travel",
  "merchant" => "first bus",
  "user_id" => user1.id
  })
transaction3.save()

user1 = User.new({
  "name" => "Natasha"
  })
user1.save()

