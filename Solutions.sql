-- Netflix Data Analysis using SQL
-- Solutions for the business problems

-- 1. Count the number of Movies vs. TV Shows.
SELECT 
	type,
	COUNT(*) AS total_count
FROM netflix
GROUP BY 1;

-- 2. Find the most common rating for Movies and TV Shows.

SELECT
	type,
	rating AS most_frequent_rating
FROM
(
	SELECT
		type,
		rating,
		COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
	FROM netflix
	GROUP BY 1, 2
) AS t1
WHERE 
	ranking = 1;

-- 3. List all Movies released in a specific year (e.g., 2020).

SELECT * 
FROM netflix
WHERE
	type = 'Movie'
	AND
	release_year = 2020;

-- 4. Find the top 5 countries with the most content on Netflix.

SELECT * 
FROM
(
	SELECT 
		-- country,
		TRIM(UNNEST(STRING_TO_ARRAY(country, ','))) as country,
		COUNT(*) as total_content
	FROM netflix
	GROUP BY 1
) AS t1
WHERE country IS NOT NULL
ORDER BY total_content DESC
LIMIT 5;

-- 5. Identify the longest Movie.

SELECT 
	title AS longest_movie,
	duration
FROM netflix
WHERE 
    type = 'Movie'
    AND duration IS NOT NULL
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INT) DESC
LIMIT 1;

-- 6. Find content added in the last 5 years.

SELECT *
FROM netflix
WHERE 
	TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

-- 7. Find all Movies and TV Shows directed by 'Karan Johar'.

SELECT *
FROM netflix
WHERE
	director ILIKE '%Karan Johar%';

-- 8. List all TV Shows with more than 5 seasons.

SELECT *
FROM netflix
WHERE 
	type = 'TV Show'
	AND
	CAST(SPLIT_PART(duration, ' ', 1) AS INT) > 5;

-- 9. Count the number of content items in each genre.

SELECT 
	TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) as genre,
	COUNT(*) as total_content
FROM netflix
GROUP BY 1;

-- 10. For each year, find the average number of content releases in India on Netflix.
--	   Return the top 5 years with the highest (annual) average content releases.

SELECT 
    EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) AS year,
    COUNT(*) AS yearly_content_released,
    ROUND(
        COUNT(*)::NUMERIC / 
        (SELECT COUNT(DISTINCT EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY'))) 
         FROM netflix WHERE country = 'India' AND date_added IS NOT NULL),
        2
    ) AS avg_content_per_year
FROM netflix
WHERE country = 'India' AND date_added IS NOT NULL
GROUP BY year
ORDER BY yearly_content_released DESC
LIMIT 5;

-- 11. List all Movies that are documentaries.

SELECT * FROM netflix
WHERE listed_in ILIKE '%Documentaries%';

-- 12. Find all content items without a director.

SELECT * FROM netflix
WHERE director IS NULL;

-- 13. Count how many Movies actor 'Shahid Kapoor' appeared in during the last 10 years.

SELECT * FROM netflix
WHERE 
	casts ILIKE '%Shahid Kapoor%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

-- 14. Find the top 10 actors who have appeared in the highest number of Movies produced in India.

SELECT 
	TRIM(UNNEST(STRING_TO_ARRAY(casts, ','))) AS actor,
	COUNT(*) AS total_content
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

/*
15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. 
	- Label content containing these keywords as 'Bad' and all other content as 'Good'. 
	- Count how many items fall into each category.
*/

WITH new_table AS (
	SELECT *,
		CASE 
			WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad Content'
			ELSE 'Good Content'
		END AS category
	FROM netflix
)
SELECT 
	category,
	COUNT(*) AS total_content
FROM new_table
GROUP BY 1;

-- End of report