require_relative("../db/sql_runner")

class Films

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"]
  end

def save()
  sql = "INSERT INTO films (title, price) VALUES ($1, $2)
  RETURNING id"
  values = [@title, @price]
  films = SqlRunner.run(sql, values).first
  @id = films['id'].to_i
end

def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON tickets.customers_id = customers.id
    WHERE films_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql,values)
    return customers.map { |customer_data| Films.new(customer_data)}
  end



def self.all
  sql = "SELECT * FROM films"
  films = SqlRunner.run(sql)
  result = films.map{|film| Films.new(film)}
  return result
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM films WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql)
end

def update
  sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
  values = [@title, @price, @id]
  SqlRunner.run(sql, values)
end

#
# def stars
#     sql = "SELECT stars.*
#     FROM stars INNER JOIN castings
#     ON castings.star_id = stars.id
#     WHERE movie_id = $1;"
#     values = [@id]
#     stars = SqlRunner.run(sql,values)
#     return stars.map { |star_data| Star.new(star_data)}
#   end
#
# def budget_remaining
#   sql = "SELECT castings.fee FROM castings WHERE movie_id = $1"
#   values = [@id]
#   fees = SqlRunner.run(sql,values)
#   fee_hash_array =fees.map{|fee_data| fee_data["fee"].to_i}.reduce(0){|sum, num| sum + num}
#
#   budget_remaining = @budget -= fee_hash_array
#   return budget_remaining
# end
#

end
