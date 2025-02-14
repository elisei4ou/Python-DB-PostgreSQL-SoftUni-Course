CREATE TABLE deleted_employees
    (employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
     first_name VARCHAR(20),
     last_name VARCHAR(20),
     middle_name VARCHAR(20),
     job_title VARCHAR(50),
     department_id INT,
     salary NUMERIC(19, 4)
    )
;

CREATE FUNCTION fn_deleted_employees()
RETURNS TRIGGER
AS
$$
    BEGIN
        INSERT INTO deleted_employees(first_name, last_name, middle_name, job_title, department_id, salary)
        VALUES
            (old.first_name, old.last_name, old.middle_name, old.job_title, old.department_id, old.salary);
        RETURN old;
    END
$$
LANGUAGE plpgsql;

CREATE TRIGGER deleted_employees_trigger
AFTER DELETE
ON employees
FOR EACH ROW
EXECUTE FUNCTION fn_deleted_employees();
