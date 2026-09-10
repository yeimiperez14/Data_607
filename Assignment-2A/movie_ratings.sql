SELECT *
FROM ratings;
--Insert the collected movie ratings into the ratings table
INSERT INTO ratings (user_id, movie_id, rating)
VALUES
-- Jeimi (user_id = 1)
(1, 1, 5),
(1, 2, 4),
(1, 3, 5),
(1, 4, 4),
(1, 5, 4),
(1, 6, 5),

-- Eduard (user_id = 2)
(2, 1, 4),
(2, 2, 4),
(2, 3, 4),
(2, 5, 5),

-- Amber (user_id = 3)
(3, 1, 5),
(3, 4, 5),

-- Gian (user_id = 4)
(4, 2, 5),
(4, 3, 4),
(4, 4, 4),

-- Brennan (user_id = 5)
(5, 1, 4),
(5, 3, 5),
(5, 4, 4),

-- Karina (user_id = 6)
(6, 3, 4),
(6, 4, 5),
(6, 5, 4),
(6, 6, 5);

SELECT *
FROM ratings;
--show me all columns and rows from ratings

SELECT rating
FROM ratings;
--show me only rating columns

SELECT *
FROM ratings
WHERE rating = 5;
--show me only rows where the rating is 5

SELECT *
FROM ratings
WHERE user_id = 1;
--show me all ratings from user 1/Jeimi

SELECT *
FROM ratings
ORDER BY rating DESC;
--show me all ratings sorted from highest to lowest

--Now lets move on to the JOIN query to connect related tables together
SELECT
    r.user_id,
    u.name,
    r.rating
FROM ratings r
JOIN users u
ON r.user_id = u.user_id;
--I want to display the following columns: user id, user name, and rating
--Start from/with the rating table and call the table r
--Lets bring in the users table and call it u
--Lets match each rating to the correctt person/ show each person with the rating that they gave

SELECT
    u.name,
    m.title,
    r.rating
FROM ratings r
JOIN users u
    ON r.user_id = u.user_id
JOIN movies m
    ON r.movie_id = m.movie_id
ORDER BY u.name, m.title;
--Lets display person's name, show me the movie title and the rating.
--Lets connect the users table with JOIN, match rating to the correct user and connect table.
--Match ratings to the correct movie
--Let's Sort the final results alphabetically by person's name, then by movie title.

SELECT
    m.title,
    AVG(r.rating) AS average_rating
FROM ratings r
JOIN movies m
    ON r.movie_id = m.movie_id
GROUP BY m.title
ORDER BY average_rating DESC;
--Calculate the average rating
--Name the new column 'average_rating'
--Lets put together all ratings for the same movie before calculating the average
--Sort the highest-rated movies first

SELECT
    m.title,
    COUNT(r.rating) AS number_of_ratings
FROM ratings r
JOIN movies m
    ON r.movie_id = m.movie_id
GROUP BY m.title
ORDER BY number_of_ratings DESC;
--Lets count how many ratings each movie got and name the new column "number of ratings"
--Lets group all ratings that belong to the same movie and show the ones with the most ratings first

SELECT
    u.name,
    m.title,
    r.rating
FROM users u
CROSS JOIN movies m
LEFT JOIN ratings r
    ON u.user_id = r.user_id
    AND m.movie_id = r.movie_id;
--Here we can see the missing ratings as Null
