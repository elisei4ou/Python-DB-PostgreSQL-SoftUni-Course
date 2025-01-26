WITH "row_number" AS(
    SELECT
        first.country_name,
        COALESCE(first.peak_name, '(no highest peak)') AS highest_peak_name,
        COALESCE(first.elevation, 0) AS highest_peak_elevation,
        CASE
            WHEN peak_name IS NOT NULL THEN mountain_range
            ELSE '(no mountain)'
        END AS mountain
    FROM
        (
        SELECT
            country_name,
            peak_name,
            elevation,
            mountain_range,
            ROW_NUMBER() OVER (PARTITION BY country_name ORDER BY elevation DESC) AS winner

            FROM
                countries AS c
            LEFT JOIN
                mountains_countries AS mc USING (country_code)
            LEFT JOIN
                peaks AS p USING (mountain_id)
            LEFT JOIN
                mountains AS m ON mc.mountain_id = m.id
        ) AS first
    WHERE
        winner = 1
)

SELECT * FROM row_number
ORDER BY country_name,
         highest_peak_elevation