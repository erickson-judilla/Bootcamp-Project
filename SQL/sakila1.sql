
USE sakila;
SELECT * FROM customer WHERE customer_id = 20;

USE sakila;
SELECT * FROM customer WHERE customer_id BETWEEN 20 AND 60;

USE sakila;
SELECT * FROM customer WHERE first_name LIKE 'L%';

USE sakila;
SELECT * FROM customer WHERE first_name LIKE '%L%';

USE sakila;
SELECT * FROM customer WHERE first_name LIKE '%L';

USE sakila;
SELECT * FROM customer WHERE last_name LIKE 'C%' ORDER BY create_date;

USE sakila;
SELECT * FROM customer WHERE last_name LIKE '%NN%' ORDER BY create_date DESC LIMIT 5;

USE sakila;
SELECT customer_id, first_name, last_name, email FROM customer WHERE customer_id IN (515, 181, 582, 503, 29, 85);

USE sakila;
SELECT *, email AS email_Address FROM customer WHERE store_id =2;

USE sakila;
SELECT first_name, last_name, email FROM customer ORDER BY email DESC;

USE sakila;
SELECT customer_id, first_name, last_name, email FROM customer WHERE MONTH(create_date) = 2;

USE sakila;
SELECT email, LENGTH(email) AS email_length FROM customer;

USE sakila;
SELECT * FROM customer ORDER BY LENGTH(email) ASC LIMIT 100;

