SELECT
    id,
    concat(first_name, ' ', middle_name, ' ', last_name),
    hire_date
FROM employees
ORDER BY hire_date
OFFSET 9