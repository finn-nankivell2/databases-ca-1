SELECT * FROM movies;

SELECT title, price FROM movies;

SELECT * FROM customers_movies WHERE return_date < "2023-03-30";

/* Get all movies only suitable for 12s and up */
SELECT * FROM movies WHERE age_rating >= 12 ORDER BY age_rating DESC;

/* Get all customers ordered by membership */
SELECT CONCAT(first_name, " ", second_name) AS full_name, membership 
FROM customers ORDER BY membership DESC;

/* Get movies by genre */
SELECT movies.title, genres.title as genre, movies.description
FROM movies
LEFT JOIN genres ON movies.genre_id = genres.id
ORDER BY genres.title;

/* Get all overdue movies and the name of the customer who took it out from the customers_movies table */
SELECT CONCAT(customers.first_name, " ", customers.second_name) AS full_name, customers_movies.return_date, movies.title
FROM customers_movies
LEFT JOIN customers ON customers_movies.customer_id = customers.id
LEFT JOIN movies ON customers_movies.movie_id = movies.id
WHERE customers_movies.return_date < "2023-03-30";

