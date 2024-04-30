DROP DATABASE IF EXISTS joins_exercise;

CREATE DATABASE joins_exercise;

\c joins_exercise

CREATE TABLE owners (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT);

CREATE TABLE vehicles (id SERIAL PRIMARY KEY, make TEXT, model TEXT, year INTEGER, price REAL, owner_id INTEGER REFERENCES owners (id));

INSERT INTO owners (first_name, last_name) VALUES ('Bob', 'Hope');
INSERT INTO owners (first_name, last_name) VALUES ('Jane', 'Smith');
INSERT INTO owners (first_name, last_name) VALUES ('Melody', 'Jones');
INSERT INTO owners (first_name, last_name) VALUES ('Sarah', 'Palmer');
INSERT INTO owners (first_name, last_name) VALUES ('Alex', 'Miller');
INSERT INTO owners (first_name, last_name) VALUES ('Shana', 'Smith');
INSERT INTO owners (first_name, last_name) VALUES ('Maya', 'Malarkin');

INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Corolla', 2002, 2999.99, 1);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Honda', 'Civic', 2012, 13000, 1);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Nissan', 'Altima', 2016, 24000, 2);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Subaru', 'Legacy', 2006, 5999.99, 2);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Ford', 'F150', 2012, 2599.99, 3);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('GMC', 'Yukon', 2016, 13000, 3);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('GMC', 'Yukon', 2014, 23000, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Avalon', 2009, 13000, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Toyota', 'Camry', 2013, 13000, 4);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Honda', 'Civic', 2001, 7999.99, 5);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Nissan', 'Altima', 1999, 1899.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('Lexus', 'ES350', 1998, 1599.99, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('BMW', '300', 2012, 23000, 6);
INSERT INTO vehicles (make, model, year, price, owner_id) VALUES ('BMW', '700', 2015, 53000, 6);

-- first query
SELECT * FROM owners o 
FULL OUTER JOIN vehicles v 
ON o.id=v.owner_id;

-- second query
SELECT first_name, last_name, COUNT(owner_id) FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY (first_name, last_name) 
ORDER BY first_name;

-- third query
SELECT first_name, last_name, ROUND(AVG(price)) as average_price, COUNT(owner_id) 
FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY (first_name, last_name) 
HAVING COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;