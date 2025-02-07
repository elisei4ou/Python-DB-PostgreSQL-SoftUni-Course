SELECT
    p.title,
    CASE
        WHEN rating <= 3.5 THEN 'poor'
        WHEN rating > 8.00 THEN 'excellent'
        ELSE 'good'
    END AS rating,
    CASE
        WHEN has_subtitles IS TRUE THEN 'Bulgarian'
        ELSE 'N/A'
    END,
    COUNT(pa.actor_id)
FROM
    productions_info AS pi
JOIN
    productions AS p
ON
    pi.id = p.production_info_id
JOIN
    productions_actors AS pa
ON
    p.id = pa.production_id
GROUP BY p.title, pi.has_subtitles, rating
ORDER BY rating,
         COUNT(pa.actor_id) DESC,
         title
