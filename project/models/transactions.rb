require_relative ',,/db/sql_runner'

class Transaction

  attr_reader :id, :amount, :tag, :description, :merchant, :user_id

  def initialize(options)
    @id = options['id'].to_i
    @amount = options['amount'].to_i
    @tag = options['tag']
    @description = options['description']
    @merchant = options['merchant']
    @user_id = options['user_id'].to_i
  end

  def save()
    sql ="INSERT INTO transactions (amount, tag, description, merchant, user_id) VALUES (#{amount}, '#{tag}', '#{description}', '#{merchant}', #{user_id}) RETURNING * ;"
    transaction = SqlRunner.run(sql)
    @id = transaction[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions ; "
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new(transaction) }
    return result
  end

end