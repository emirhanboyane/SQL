CREATE TABLE companies1
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies1 VALUES(100, 'IBM', 12000);
INSERT INTO companies1 VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies1 VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies1 VALUES(103, 'APPLE', 21000);

SELECT * FROM companies1;

--1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.
update companies1
set number_of_Employees=9999
where company='IBM'


CREATE OR REPLACE FUNCTION  toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC 
LANGUAGE plpgsql
AS
$$
BEGIN

RETURN x+y;

END
$$

SELECT * FROM toplamaF(4 , 6) AS toplam;















