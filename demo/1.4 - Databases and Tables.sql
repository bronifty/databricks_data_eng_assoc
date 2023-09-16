-- Databricks notebook source
CREATE TABLE managed_default
  (width INT, length INT, height INT);

INSERT INTO managed_default
VALUES (4, 5, 6);


-- COMMAND ----------

INSERT INTO managed_default
VALUES (4, 5, 6);

-- COMMAND ----------

SELECT * FROM default.managed_default;

-- COMMAND ----------

DESCRIBE EXTENDED managed_default;

-- COMMAND ----------

CREATE TABLE external_default
(width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_default';
INSERT INTO external_default
VALUES (4, 5, 6);
DESCRIBE EXTENDED external_default;

-- COMMAND ----------

DROP TABLE managed_default;   

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/managed_default';

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/mnt/demo/external_default'

-- COMMAND ----------

DESCRIBE EXTENDED external_default;

-- COMMAND ----------

SELECT * FROM external_default;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/employees'

-- COMMAND ----------

DESCRIBE HISTORY managed_default;

-- COMMAND ----------

RESTORE TABLE managed_default TO VERSION AS OF 1
