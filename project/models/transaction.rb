require_relative '../db/sql_runner'
require_relative './user'
# require_relative './tag'
# require_relative './merchant'

class Transaction

  attr_reader :id, :amount, :description, :tag_id, :merchant_id, :user_id

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @description = options['description']
    @tag_id = options['tag_id']#.to_i
    @merchant_id = options['merchant_id']#.to_i
    @user_id = options['user_id'].to_i
  end

  def save()
    sql ="INSERT INTO transactions
    (amount, description, tag_id, merchant_id, user_id) VALUES
    (#{amount}, '#{description}', '#{tag_id}', '#{merchant_id}', #{user_id}) RETURNING * ;"
    transaction = SqlRunner.run(sql)
    @id = transaction[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions ; "
    transaction = SqlRunner.run(sql)
    result = transaction.map { |hash| Transaction.new(hash) }
    return result
  end

  def user
    sql = "SELECT * FROM users WHERE id = #{user_id} ;"
    result = SqlRunner.run(sql)
    return User.new(result.first())
  end

  def tag
    sql = "SELECT * FROM tags WHERE id = #{tag_id} ;"
    result = SqlRunner.run(sql)
    return User.new(result.first())
  end

  def merchant
    sql = "SELECT * FROM merchants WHERE id = #{merchant_id} ;"
    result = SqlRunner.run(sql)
    return User.new(result.first())
  end

end