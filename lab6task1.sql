--1a--
SELECT *
FROM dealer CROSS JOIN client;

--1b--
SELECT dealer.name, client.name, client.city, client.priority, sell.id, sell.date, sell.amount
FROM (client FULL JOIN dealer on client.dealer_id = dealer.id) FULL JOIN sell on client.id = sell.client_id;

--1c--
SELECT dealer.name, client.name, city
FROM client INNER JOIN dealer ON client.city = dealer.location;

--1d--
SELECT sell.id, amount, client.name, city
FROM sell INNER JOIN client ON sell.client_id = client.id AND sell.amount >= 100 AND sell.amount <= 500;
---1e---
SELECT * FROM client RIGHT JOIN dealer on client.dealer_id = dealer.id;

---1f---
SELECT client.name, client.city, dealer.name, dealer.charge
FROM dealer INNER JOIN client ON dealer.id = client.dealer_id;

---1g---
SELECT client.name, city, dealer.name, charge
FROM client INNER JOIN dealer ON client.dealer_id = dealer.id AND charge > 0.12;

---1h---
SELECT client.name, city, sell.id, date, amount, dealer.name,charge FROM (client FULL JOIN sell on client.id = sell.client_id) FULL JOIN dealer on dealer.id = client.dealer_id;

---1i---
SELECT client.name, client.priority, dealer.name, sell.id, sell.amount
FROM (dealer LEFT JOIN client ON dealer.id = client.dealer_id) LEFT JOIN sell ON client.id = sell.client_id
WHERE sell.amount >= 2000 AND client.priority IS NOT NULL;