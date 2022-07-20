USE sakila;
SELECT country.country, count(customer.customer_id) AS total_number_of_customer FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN  country ON city.country_id = country.country_id
GROUP BY country
ORDER BY country;

USE sakila;
SELECT country.country, city.city, count(address.address_id) AS total_number_of_customer FROM address
LEFT JOIN city ON address.city_id = city.city_id
LEFT JOIN  country ON city.country_id = country.country_id
GROUP BY city
ORDER BY country;

USE sakila;
SELECT concat(MONTHNAME(payment.payment_date),"-",YEAR(payment.payment_date)) AS month_and_year, sum(payment.amount) AS total_rental_amount, count(payment.amount) AS total_transaction, avg(payment.amount) AS average_rental_amount FROM payment
GROUP BY month_and_year
ORDER BY payment_date;

USE sakila;
SELECT TIME_FORMAT(payment.payment_date,'%h %p') AS hour_of_the_day, sum(payment.amount) AS total_payment_received FROM payment
GROUP BY hour_of_the_day
ORDER BY total_payment_received DESC LIMIT 10;
