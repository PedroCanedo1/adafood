-- Parte 2 do projeto Tendo como base o banco de dados dvd_rental disponível aqui,
-- elabore as consultas SQL necessárias para responder às seguintes perguntas

-- 1. Quais são os filmes (film.title), suas respectivas categorias (category.name)e idioma (language.name)?
SELECT film.title AS filme, category.name AS categoria, language.name AS idioma
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN language ON film.language_id = language.language_id;

-- 2. Quais foram os filmes alugados entre os dias 1 de fevereiro e 15 de março de 2006 na loja 1 (store.id = 1).
SELECT film.title AS filme, rental.rental_date
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
JOIN store ON inventory.store_id = store.store_id
WHERE rental.rental_date BETWEEN '2006-02-01' AND '2006-03-15'
AND store.store_id = 1;


-- 3. Qual a quantidade de vezes que cada filme foi alugado?
SELECT film.title AS filme, COUNT(rental.rental_id) AS total_alugado
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY total_alugado DESC;


-- 4.Para cada funcionário (staff.staff_id), qual é o valor total retornado em locações (payment.amount) e qual é a 
--quantidade total de locações (rental.rental_id)? 
SELECT staff.staff_id, SUM(payment.amount) AS total_valor, COUNT(rental.rental_id) AS total_locacoes
FROM staff
JOIN rental ON staff.staff_id = rental.staff_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY staff.staff_id
ORDER BY total_valor DESC;


/*
5. Qual é o nome de categoria de filme (category.name) que nos retorna mais dinheiro no total (payment.total)? 
Ordene sua consulta para mostrar o resultado em ordem de lucratividade, do nome de categoria mais lucrativo para o nome 
de categoria menos lucrativo e garanta que todos os nomes de categorias apareçam no resultado final, inclusive aquelas que 
não tiverem nenhuma locação associada a elas.  */
SELECT category.name AS categoria, SUM(payment.amount) AS total_ganho
FROM category
LEFT JOIN film_category ON category.category_id = film_category.category_id
LEFT JOIN inventory ON film_category.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY category.name
ORDER BY total_ganho DESC;

