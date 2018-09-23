DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;


CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE  screenings(
  id SERIAL4 PRIMARY KEY,
  start_time VARCHAR(255),
  empty_seats INT2,
  films_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE  tickets(
  id SERIAL4 PRIMARY KEY,
  films_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  customers_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  screenings_id INT4 REFERENCES screenings(id) ON DELETE CASCADE
);
