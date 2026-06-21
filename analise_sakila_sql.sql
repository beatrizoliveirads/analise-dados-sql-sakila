SELECT f.title, COUNT(r.rental_id) AS total_alugueis
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_alugueis DESC
LIMIT 10;

SELECT c.name AS categoria, 
SUM(p.amount) AS faturamento_total
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY faturamento_total DESC;

SELECT c.first_name, c.last_name, 
SUM(p.amount) AS total_gasto
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_gasto DESC
LIMIT 10;

SELECT DATE_FORMAT(payment_date, '%Y-%m') AS mes,
SUM(amount) AS faturamento
FROM payment
GROUP BY mes
ORDER BY mes;