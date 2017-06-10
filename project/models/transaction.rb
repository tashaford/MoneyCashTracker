require_relative '../db/sql_runner'

class Transaction

  attr_reader :id, :amount, :description, :tag_id, :merchant_id, :user_id

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @description = options['description']
    @tag_id = options['tag'].to_i
    @merchant_id = options['merchant'].to_i
    @user_id = options['user_id'].to_i
  end

  def save()
    sql ="INSERT INTO transactions (amount, tag_id, description, merchant_id, user_id) VALUES (#{amount}, #{tag_id}, '#{description}', #{merchant_id}, #{user_id}) RETURNING * ;"
    transaction = SqlRunner.run(sql)
    @id = transaction[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions ; "
    transaction = SqlRunner.run(sql)
    result = transaction.map { |hash| Transaction.new(hash) }
    return result
  end

end