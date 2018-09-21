require_relative("../db/sql_runner")

class Tickets

  attr_reader :id
  attr_accessor :films_id, :customers_id, :screenings_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @films_id = options["films_id"].to_i if options["films_id"]
    @customers_id = options["customers_id"].to_i if options["customers_id"]
    @screenings_id = options["screenings_id"].to_i if options["screenings_id"]
  end

def save()
  sql = "INSERT INTO tickets (films_id, customers_id, screenings_id) VALUES ($1, $2, $3)
  RETURNING id"
  values = [@films_id, @customers_id, @screenings_id]
  tickets = SqlRunner.run(sql, values).first
  @id = tickets['id'].to_i
end


def self.all
  sql = "SELECT * FROM tickets"
  tickets = SqlRunner.run(sql)
  result = tickets.map{|ticket| Tickets.new(ticket)}
  return result
end

def self.delete_all
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM tickets WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql)
end

def update
  sql = "UPDATE tickets SET (films_id, customer_id, screening_id) = ($1, $2, $3) WHERE id = $4"
  values = [@films_id, @customers_id, @screenings_id, @id]
  SqlRunner.run(sql, values)
end


end
