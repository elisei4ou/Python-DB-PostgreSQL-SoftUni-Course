SELECT
    SUBSTRING("River Information", '([0-9]{1,4})') as river_length
FROM view_river_info
