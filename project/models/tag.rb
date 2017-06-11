require_relative '../db/sql_runner'

class Tag

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{name}') RETURNING * ; "
    user = SqlRunner.run(sql)
    @id = user[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags ;"
    tag = SqlRunner.run(sql)
    result = tag.map { |hash| User.new(hash) }
    return result
  end

end