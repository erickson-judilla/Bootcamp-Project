USE sakila;
SELECT * FROM customer;

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address FROM customer
INNER JOIN address ON address.address_id = customer.address_id;

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id;


USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id
ORDER BY country.country;


USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE country.country = 'Bolivia';

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE country.country IN('Bolivia', 'Germany', 'Greece');

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE city.city = 'Baku';


USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, address.address, city.city, country.country FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE city.city IN('Baku', 'Beira', 'Bergamo');

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, country.country, LENGTH(country.country) AS country_name_length, LENGTH(concat(customer.first_name," ",customer.last_name)) AS full_name_length FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE LENGTH(country.country) < 5
ORDER BY LENGTH(Concat(customer.first_name,customer.last_name)) DESC;

/*Get all the list of customers who live in a city name whose length is more than 10.  Order the result so that the customers who live in the same country are shown together.*/
USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, country.country, city.city, LENGTH(city.city) AS city_name_length FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE LENGTH(city.city) > 10
ORDER BY country.country;


USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, city.city FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
WHERE city.city LIKE '%BA%';

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, city.city, LENGTH(city.city) AS city_name_length FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
WHERE city.city LIKE '% %'
ORDER BY LENGTH(city.city) DESC;

USE sakila;
SELECT concat(customer.first_name," ",customer.last_name) AS customer_name, city.city, country.country, LENGTH(city.city) AS city_name_length, LENGTH(country.country) AS country_name_length FROM customer
INNER JOIN address ON address.address_id = customer.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id 
WHERE LENGTH(city.city) < LENGTH(country.country);


