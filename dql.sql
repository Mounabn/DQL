--1: Afficher toutes les données des clients :
SELECT * FROM customer;

--2 Afficher le nom_du_produit et la catégorie pour les produits dont le prix est compris entre 5000 et 10000
SELECT product_name, category FROM product WHERE price BETWEEN 5000 AND 10000;

--3 Affichez toutes les données des produits triés par ordre décroissant de prix :
SELECT * FROM product ORDER BY price DESC;

--4 Afficher le nombre total de commandes, le montant moyen, le montant total le plus élevé et le montant total inférieur. Pour chaque product_id, afficher le nombre de commandes :
SELECT product_id,
       COUNT(*) AS total_orders,
       AVG(total) AS average_amount,
       MAX(total) AS highest_total_amount,
       MIN(total) AS lowest_total_amount
FROM orders
GROUP BY product_id;


--5 Afficher le customer_id qui a plus de 2 commandes :
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;


--6 Pour chaque mois de l'année 2020, affichez le nombre de commandes :
SELECT MONTH(orderDate) AS month,
       COUNT(*) AS number_of_orders
FROM orders
WHERE YEAR(orderDate) = 2020
GROUP BY MONTH(orderDate);


--7 Pour chaque commande, affichez le nom_produit, le nom_client et la date de la commande :
SELECT product.product_name, customer.customer_name, orders.orderDate
FROM orders
JOIN product ON orders.product_id = product.product_id
JOIN customer ON orders.customer_id = customer.customer_id;



--8 Afficher toutes les commandes passées il y a trois mois
SELECT *
FROM orders
WHERE orderDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

--9 Afficher les clients (customer_id) qui n'ont jamais commandé de produit 
SELECT customer_id
FROM customer
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);



