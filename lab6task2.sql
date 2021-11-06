---2a---
CREATE VIEW a AS SELECT date,count(distinct client_id), avg(amount), sum(amount) FROM sell1 GROUP BY date;

SELECT * FROM a;

DROP VIEW a;

---2b----
CREATE VIEW b AS SELECT date, sum(amount) FROM sell GROUP BY date ORDER BY sum(amount) DESC LIMIT 5;

SELECT * FROM b;

DROP VIEW b;


---2c-----
CREATE VIEW c1 AS SELECT dealer.name, count(sell.id), avg(amount), sum(amount) FROM (dealer INNER JOIN sell ON dealer.id = sell.dealer_id) GROUP BY dealer.name;

SELECT * FROM c1;

DROP VIEW c1;

---2d----
CREATE VIEW d1 AS SELECT location, sum(amount), sum(amount)*(dealer.charge) FROM (dealer INNER JOIN sell ON dealer.id = sell.dealer_id) GROUP BY location, charge;

SELECT * FROM d1;

DROP VIEW d1;

---2e-----
CREATE VIEW e1 AS SELECT location, count(sell.id), sum(amount), avg(amount) FROM (dealer INNER JOIN sell ON dealer.id = sell.dealer_id) GROUP BY dealer.location;

SELECT * FROM e1;

DROP VIEW e1;

---2f----
CREATE VIEW f1 AS SELECT city, count(sell.id), sum(amount), avg(amount) FROM (client INNER JOIN sell ON client.id = sell.client_id) GROUP BY city;

SELECT * FROM f1;

DROP VIEW f1;

---2g----
CREATE VIEW g1 AS SELECT *
FROM (SELECT city, sum(amount) AS city_expenses FROM client INNER JOIN sell ON client.id = sell.client_id GROUP BY city) P
INNER JOIN
     (SELECT location, sum(amount) AS location_sales FROM dealer INNER JOIN sell ON dealer.id = sell.dealer_id GROUP BY location) O
ON city_expenses > location_sales AND P.city = O.location;

SELECT * FROM g1;

DROP VIEW g1;