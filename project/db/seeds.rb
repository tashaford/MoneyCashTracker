require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/merchant'
require_relative '../models/transaction'

user1 = User.new({
  "name" => "Natasha"
  })
user1.save()

# tag1 = Tag.new({
#   "name" => "eat out"
#   })
# tag1.save()

# tag2 = Tag.new({
#   "name" => "food"
#   })
# tag2.save()

# tag3 = Tag.new({
#   "name" => "travel"
#   })
# tag3.save()

# merchant1 = Merchant.new({
#   "name" => "ocho"
#   })
# merchant1.save()

# merchant2 = Merchant.new({
#   "name" => "tesco"
#   })
# merchant2.save()

# merchant3 = Merchant.new({
#   "name" => "first bus"
#   })
# merchant3.save()

transaction1 = Transaction.new({
  "amount" => 15.50,
  "description" => "Date night",
  "tag_id" => "eat out",
  "merchant_id" => "ocho",
  "user_id" => user1.id
  })
transaction1.save()

transaction2 = Transaction.new({
  "amount" => 32.45,
  "description" => "restocked freezer",
  "tag_id" => "food",
  "merchant_id" => "tesco",
  "user_id" => user1.id
  })
transaction2.save()

transaction3 = Transaction.new({
  "amount" => 14.50,
  "description" => "weekly bus ticket",
  "tag_id" => "travel",
  "merchant_id" => "first bus",
  "user_id" => user1.id
  })
transaction3.save()