ALTER TABLE
    countries
ADD COLUMN
    capital_code CHAR(2);

UPDATE
    countries
SET capital_code = LEFT(capital, 2)
WHERE capital IS NOT NULL