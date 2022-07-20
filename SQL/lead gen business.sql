
USE lead_gen_business;
SELECT sites.domain_name, sites.client_id FROM sites WHERE sites.client_id=15;

USE lead_gen_business;
SELECT client_id, COUNT(DATE_FORMAT(sites.created_datetime, "%M %Y")) AS number_of_website, MONTHNAME(sites.created_datetime) AS month_created, YEAR(sites.created_datetime) AS year_created FROM sites WHERE MONTH(sites.created_datetime)= '6' AND YEAR(sites.created_datetime)= '2011'
GROUP BY DATE_FORMAT(sites.created_datetime, "%M %Y");

USE lead_gen_business;
SELECT MONTHNAME(billing.charged_datetime) AS month, sum(billing.amount) as revenue FROM billing WHERE MONTH(billing.charged_datetime)= '11' AND YEAR(billing.charged_datetime)= '2012'
GROUP BY MONTH(billing.charged_datetime);

USE lead_gen_business;
SELECT client_id, COUNT(DATE_FORMAT(sites.created_datetime, "%M %Y")) AS number_of_website, MONTHNAME(sites.created_datetime) AS month_created, YEAR(sites.created_datetime) AS year_created FROM sites WHERE sites.client_id=1
GROUP BY DATE_FORMAT(sites.created_datetime, "%M %Y");

USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, billing.amount as revenue, DATE_FORMAT(billing.charged_datetime, '%M') AS month_charge, YEAR(billing.charged_datetime) AS year_charge FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
LEFT JOIN billing ON billing.client_id = clients.client_id
GROUP BY client_name, month_charge, year_charge
ORDER BY client_name DESC, month_charge, year_charge;

USE lead_gen_business;
SELECT sites.domain_name AS website, count(leads.site_id) AS number_of_leads, DATE_FORMAT(leads.registered_datetime, '%M %d, %Y') AS date_generated FROM sites
LEFT JOIN leads ON leads.site_id = sites.site_id
WHERE registered_datetime>'2011/03/15' AND registered_datetime<'2011/04/15'
GROUP BY date_generated;

USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.site_id) AS number_of_leads FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
GROUP BY website;

USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) as client_name, COUNT(clients.client_id) AS number_of_leads, MONTHNAME(leads.registered_datetime) AS month_generated, YEAR(leads.registered_datetime) AS year_generated FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
WHERE YEAR(leads.registered_datetime) = 2012
GROUP BY registered_datetime;

USE lead_gen_business;
SELECT CONCAT(clients.first_name,' ',clients.last_name) as client_name, COUNT(leads.site_id) AS total_leads FROM clients
LEFT JOIN sites ON sites.client_id = clients.client_id
LEFT JOIN leads ON leads.site_id = sites.site_id
WHERE leads.registered_datetime>'2011/01/01' AND leads.registered_datetime<'2011/06/31'
GROUP BY client_name;

SELECT CONCAT(clients.first_name,' ',clients.last_name) AS client_name, GROUP_CONCAT(DISTINCT sites.domain_name SEPARATOR ' / ') AS sites FROM leads
LEFT JOIN sites ON sites.site_id = leads.site_id
LEFT JOIN clients ON clients.client_id = sites.client_id
LEFT JOIN billing ON billing.client_id = clients.client_id
GROUP BY client_name;


