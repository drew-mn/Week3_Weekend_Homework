require_relative("../db/sql_runner")

class Customers

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end

def save()
  sql = "INSERT INTO customers (name, funds) VALUES ($1, $2)
  RETURNING id"
  values = [@name, @funds]
  customers = SqlRunner.run(sql, values).first
  @id = customers['id'].to_i
end

def films
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.films_id = films.id
    WHERE customers_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql,values)
    return films.map { |film_data| Films.new(film_data)}
  end


#   def funds_remaining
#   sql = "SELECT films.price FROM films WHERE films_id = $1"
#   values = [@id]
#   price = SqlRunner.run(sql,values)
#   price_hash_array = price.map{|price_data| price_data["price"].to_i}.reduce(0){|sum, num| sum + num}
#
#   funds_remaining = @funds -= price_hash_array
#   return funds_remaining
# end

def self.all
  sql = "SELECT * FROM customers"
  customers = SqlRunner.run(sql)
  result = customers.map{|customer| Customers.new(customer)}
  return result
end

def self.delete_all
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM customers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql)
end

def update
  sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)
end

end
