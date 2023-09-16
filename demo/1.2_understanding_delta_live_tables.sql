-- Databricks notebook source
-- MAGIC %sql
-- MAGIC CREATE TABLE employees
-- MAGIC -- USING DELTA
-- MAGIC (id INT, name STRING, salary DOUBLE);

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC INSERT INTO employees
-- MAGIC VALUES 
-- MAGIC   (1, "Adam", 3500.0),
-- MAGIC   (2, "Sarah", 4020.5),
-- MAGIC   (3, "John", 2999.3),
-- MAGIC   (4, "Thomas", 4000.3),
-- MAGIC   (5, "Anna", 2500.0),
-- MAGIC   (6, "Kim", 6200.3)

-- COMMAND ----------


SELECT * FROM employees;

-- COMMAND ----------

DESCRIBE DETAIL employees;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC INSERT INTO employees
-- MAGIC VALUES 
-- MAGIC   (1, "Adam", 3500.0),
-- MAGIC   (2, "Sarah", 4020.5),
-- MAGIC   (3, "John", 2999.3),
-- MAGIC   (4, "Thomas", 4000.3),
-- MAGIC   (5, "Anna", 2500.0),
-- MAGIC   (6, "Kim", 6200.3)

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees/_delta_log/'

-- COMMAND ----------

-- MAGIC %python
-- MAGIC spark.read.format("delta").load("dbfs:/user/hive/warehouse/employees/_delta_log/00000000000000000000.crc")
-- MAGIC

-- COMMAND ----------

UPDATE employees 
SET salary = salary + 100
WHERE name LIKE "A%"

-- COMMAND ----------

SELECT * FROM employees;

-- COMMAND ----------

DESCRIBE DETAIL  employees;

-- COMMAND ----------

SELECT * FROM employees;

-- COMMAND ----------

DESCRIBE HISTORY employees;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees/_delta_log'

-- COMMAND ----------

-- MAGIC %fs head 'dbfs:/user/hive/warehouse/employees/_delta_log/'

-- COMMAND ----------

DESCRIBE HISTORY employees;

-- COMMAND ----------

SELECT sum(salary)
FROM employees@v3
;

-- COMMAND ----------

SELECT sum(salary)
FROM employees@v2;

-- COMMAND ----------

DELETE FROM employees;

-- COMMAND ----------

SELECT * FROM employees;

-- COMMAND ----------

RESTORE TABLE employees TO VERSION AS OF 4;

-- COMMAND ----------

SELECT * FROM employees;

-- COMMAND ----------

DESCRIBE HISTORY employees;

-- COMMAND ----------

DESCRIBE DETAIL employees;

-- COMMAND ----------

OPTIMIZE employees
ZORDER BY (id);


-- COMMAND ----------

DESCRIBE DETAIL employees;

-- COMMAND ----------

DESCRIBE HISTORY employees;

-- COMMAND ----------

SET spark.databricks.delta.retentionDurationCheck.enabled = false;

-- COMMAND ----------

VACUUM employees RETAIN 0 HOURS;

-- COMMAND ----------

DESCRIBE HISTORY employees; 

-- COMMAND ----------

DESCRIBE DETAIL employees;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees/_delta_log/';

-- COMMAND ----------

DESCRIBE HISTORY employees;

-- COMMAND ----------

SELECT * FROM employees@v2;

-- COMMAND ----------

DESCRIBE HISTORY employees;
