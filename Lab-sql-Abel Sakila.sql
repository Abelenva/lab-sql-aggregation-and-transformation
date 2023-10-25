USE sakila;
-- shortest and longest movie
SELECT  MIN(length) AS min_duration,
MAX(length) AS max_duration FROM film;
    
-- average duration 
SELECT FLOOR(AVG(length)/60) AS hours, ROUND(AVG(length)%60) AS minutes 
FROM film;
    
  -- number of days the company has been operating
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating 
FROM rental;
    
    -- month and weekday of the rental
SELECT rental_date, MONTH(rental_date) AS month_number, DAYNAME(rental_date) AS rental_weekday 
FROM rental 
LIMIT 20;
    
-- film titles and their rental duration
SELECT title, 
IFNULL(CAST(length AS CHAR), 'Not Available') AS rental_duration 
FROM film ORDER BY title ASC;

-- Challenge 2

-- total number of films released
SELECT COUNT(*) AS total_films FROM film;
    
-- films and ratings sorted
SELECT rating, COUNT(*) AS film_count 
FROM film 
GROUP BY rating 
ORDER BY film_count DESC;
    
-- mean film duration for each rating
SELECT rating, ROUND(AVG(length), 2) AS avg_duration 
FROM film GROUP BY rating 
ORDER BY avg_duration DESC;

-- which ratings have a mean duration of over two hours
SELECT rating, ROUND(AVG(length), 2) AS avg_duration 
FROM film GROUP BY rating 
HAVING avg_duration > 120;

-- bonus
SELECT last_name FROM actor GROUP BY last_name 
HAVING COUNT(*) = 1;