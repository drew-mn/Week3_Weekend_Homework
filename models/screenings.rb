require_relative("../db/sql_runner")

class Screenings

  attr_reader :id
  attr_accessor :start_time, :empty_seats, :films_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @start_time = options["start_time"]
    @empty_seats = options["empty_seats"]
    @films_id = options["films_id"].to_i if options["films_id"]
  end

def save()
  sql = "INSERT INTO screenings (start_time, empty_seats, films_id) VALUES ($1, $2, $3)
  RETURNING id"
  values = [@start_time, @empty_seats, @films_id]
  screenings = SqlRunner.run(sql, values).first
  @id = screenings['id'].to_i
end

def self.all
  sql = "SELECT * FROM screenings"
  screenings = SqlRunner.run(sql)
  result = screenings.map{|screening| Screenings.new(screening)}
  return result
end

def self.delete_all
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM screenings WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql)
end

def update
  sql = "UPDATE screenings SET (start_time, empty_seats, films_id) = ($1, $2, $3) WHERE id = $4"
  values = [@start_time, @empty_time, @films_id, @id]
  SqlRunner.run(sql, values)
end

def tickets_total()
  return tickets.length
end

end
