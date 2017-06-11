require_relative '../db/sql_runner'

class Merchant

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{name}') RETURNING * ; "
    user = SqlRunner.run(sql)
    @id = user[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants ;"
    merchant = SqlRunner.run(sql)
    result = merchant.map { |hash| User.new(hash) }
    return result
  end

end