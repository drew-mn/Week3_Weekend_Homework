require_relative( 'models/films')
require_relative( 'models/customers')
require_relative( 'models/tickets')
require_relative( 'models/screenings')

require('pry')

# Films.delete_all()
# Customers.delete_all()
# Tickets.delete_all()
# Screenings.delete_all()
# customer1.name = "Joe Bloggs"
# customer3.name = "Jane Bloggs"
# film1.title = "Incredibles 2"
# film2.title = "Christopher Robin"
# customer1.funds = 100
# customer3.funds = 200
# customer1.tickets_bought
# film3.tickets_sold

film1 = Films.new({'title' => 'A Simple Favour', 'price' => '10'})
film1.save()
film2 = Films.new({'title' => 'King of Thieves', 'price' => '9'})
film2.save()
film3 = Films.new({'title' => 'Mile 22', 'price' => '8'})
film3.save()

customer1 = Customers.new({'name' => 'Drew', 'funds' => '30'})
customer1.save()
customer2 = Customers.new({'name' => 'Lauren', 'funds' => '40'})
customer2.save()
customer3 = Customers.new({'name' => 'Judith', 'funds' => '50'})
customer3.save()

screening1 = Screenings.new({'start_time' => '18:00', 'empty_seats' => '10', 'films_id' => film1.id})
screening1.save()
screening2 = Screenings.new({'start_time' => '19:00', 'empty_seats' => '20', 'films_id' => film1.id})
screening2.save()
screening3 = Screenings.new({'start_time' => '15:00', 'empty_seats' => '15', 'films_id' => film2.id})
screening3.save()
screening4 = Screenings.new({'start_time' => '20:00', 'empty_seats' => '10', 'films_id' => film2.id})
screening4.save()
screening5 = Screenings.new({'start_time' => '17:00', 'empty_seats' => '5', 'films_id' => film3.id})
screening5.save()
screening6 = Screenings.new({'start_time' => '20:00', 'empty_seats' => '25', 'films_id' => film3.id})
screening6.save()

ticket1 = Tickets.new({'films_id' => film1.id, 'customers_id' => customer1.id, 'screenings_id' => screening1.id})
ticket1.save()
ticket2 = Tickets.new({'films_id' => film1.id, 'customers_id' => customer2.id, 'screenings_id' => screening2.id})
ticket2.save()
ticket3 = Tickets.new({'films_id' => film2.id, 'customers_id' => customer3.id, 'screenings_id' => screening3.id})
ticket3.save()
ticket4 = Tickets.new({'films_id' => film2.id, 'customers_id' => customer2.id, 'screenings_id' => screening4.id})
ticket4.save()
ticket5 = Tickets.new({'films_id' => film3.id, 'customers_id' => customer1.id, 'screenings_id' => screening5.id})
ticket5.save()
ticket6 = Tickets.new({'films_id' => film3.id, 'customers_id' => customer3.id, 'screenings_id' => screening6.id})
ticket6.save()


binding.pry
nil
