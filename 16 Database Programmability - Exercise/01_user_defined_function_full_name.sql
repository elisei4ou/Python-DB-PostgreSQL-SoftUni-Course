CREATE OR REPLACE FUNCTION
    fn_full_name(first_name varchar, last_name varchar)
RETURNS varchar
AS
$$
    BEGIN
        RETURN concat(initcap(first_name), ' ', initcap(last_name));
    END
$$
LANGUAGE
    plpgsql;

