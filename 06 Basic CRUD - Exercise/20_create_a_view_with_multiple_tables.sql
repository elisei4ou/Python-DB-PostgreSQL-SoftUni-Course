CREATE VIEW view_addresses AS
SELECT
       concat(first_name, ' ', last_name) AS full_name,
       department_id,
       concat(number, ' ', street) AS address
FROM employees e
JOIN addresses a
ON e.address_id = a.id
ORDER BY address
