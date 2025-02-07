DELETE FROM distributors
WHERE name LIKE 'L%'
;

DELETE FROM ingredients
WHERE distributor_id NOT IN(
    SELECT
        id
    FROM distributors
    );

DELETE FROM products_ingredients
WHERE ingredient_id NOT IN(
    SELECT
        id
    FROM ingredients
    )