require_relative '../db/sql_runner'
require_relative './user'
require_relative './tag'
require_relative './merchant'


class Transaction

  attr_reader :id, :amount, :description, :tag_id, :merchant_id, :user_id, :date

  def initialize(options)
    @id           = options['id'].to_i
    @amount       = options['amount'].to_f.round(2)
    @description  = options['description']
    @tag_id       = options['tag_id'].to_i
    @merchant_id  = options['merchant_id'].to_i
    @user_id      = options['user_id'].to_i
    @date         = options['date']
  end

  def save()
    sql ="INSERT INTO transactions
    (amount, description, tag_id, merchant_id, user_id, date)
    VALUES
    (#{@amount}, '#{@description}', #{@tag_id}, #{@merchant_id}, #{@user_id}, '#{@date}') RETURNING * ;"
    transaction = SqlRunner.run(sql)
    @id = transaction.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions ; "
    transaction = SqlRunner.run(sql)
    result = transaction.map { |hash| Transaction.new(hash) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id} ;"
    transaction = SqlRunner.run(sql)
    result = Transaction.new(transaction.first())
    return result
  end

  def self.total()
    sql = "SELECT SUM(amount) FROM transactions;"
    result = SqlRunner.run(sql)[0]["sum"]
    if result == nil
      return 0
    else
      return '%.2f'% result.to_f()
    end
  end

  def self.total_month(month)
    sql = "SELECT SUM(amount) FROM transactions WHERE EXTRACT(MONTH FROM date) = #{month};"
    result = SqlRunner.run(sql)[0]["sum"]
    if result == nil
      return 0
    else
      return '%.2f'% result.to_f()
    end
  end

  def self.total_tag(tag_id)
    sql = "SELECT SUM(amount) FROM transactions WHERE tag_id = #{tag_id};"
    result = SqlRunner.run(sql)[0]["sum"]
    if result == nil
      return 0
    else
      return '%.2f'% result.to_f()
    end
  end

  def user
    sql = "SELECT * FROM users WHERE id = #{user_id} ;"
    result = SqlRunner.run(sql)
    return User.new(result.first())
  end

  def tag
    sql = "SELECT * FROM tags WHERE id = #{tag_id} ;"
    result = SqlRunner.run(sql)
    return Tag.new(result.first())
  end

  def merchant
    sql = "SELECT * FROM merchants WHERE id = #{merchant_id} ;"
    result = SqlRunner.run(sql)
    return Merchant.new(result.first())
  end

  def update(options)
    sql = "UPDATE transactions SET
    amount        = '#{options['amount']}',
    description   = '#{options['description']}',
    tag_id        = '#{options['tag_id']}',
    merchant_id   = '#{options['merchant_id']}',
    user_id       = '#{options['user_id']}',
    date          = '#{options['date']}'
    WHERE id      = '#{options['id']}' ;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = #{@id} ;"
    SqlRunner.run(sql)
  end

  def budget(amount)
    budget = 200
    if budget < amount
      puts "You are over budget this month!"
    elsif budget > amount
      puts "You are underbudget, good job!"
    end
  end

end