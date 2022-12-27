-- //1.Örnek: "workers" adında bir table oluşturup "worker_id, worker_name, worker_salary" sütunlarını ekleyin.

CREATE TABLE workers(workers_id VARCHAR(20),workers_name VARCHAR(20),workers_salary INT);

SELECT * FROM workers

--//2.Örnek: Table'a worker_address sütunu ekleyerek alter yapın.

ALTER TABLE workers ADD worker_address VARCHAR(80);

--//3.Örnek: workers table'ını silin

DROP TABLE workers;