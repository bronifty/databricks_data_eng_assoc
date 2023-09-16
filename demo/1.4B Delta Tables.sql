-- Databricks notebook source
CREATE TABLE IF NOT EXISTS smartphones
(id INT, name STRING, brand STRING, year INT);

INSERT INTO smartphones
VALUES (1, 'iPhone 14', 'Apple', 2022),
      (2, 'iPhone 13', 'Apple', 2021),
      (3, 'iPhone 6', 'Apple', 2014),
      (4, 'iPad Air', 'Apple', 2013),
      (5, 'Galaxy S22', 'Samsung', 2022),
      (6, 'Galaxy Z Fold', 'Samsung', 2022),
      (7, 'Galaxy S9', 'Samsung', 2016),
      (8, '12 Pro', 'Xiaomi', 2022),
      (9, 'Redmi 11T Pro', 'Xiaomi', 2022),
      (10, 'Redmi Note 11', 'Xiaomi', 2021)

-- COMMAND ----------


SELECT * FROM hive_metastore.default.smartphones@v3;


-- COMMAND ----------

CREATE TABLE smartphone_clone
DEEP CLONE smartphones;

-- COMMAND ----------

SELECT * FROM smartphone_clone;

-- COMMAND ----------

CREATE TABLE smartphone_shallow_clone
SHALLOW CLONE smartphones;

-- COMMAND ----------

DELETE FROM smartphones;

-- COMMAND ----------

DESCRIBE DETAIL smartphones;

-- COMMAND ----------

SELECT * FROM smartphone_shallow_clone;

-- COMMAND ----------

DESCRIBE DETAIL smartphones;

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/smartphones'

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/smartphones/_delta_log/'

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/user/hive/warehouse/smartphones/_delta_log/00000000000000000000.json'

-- COMMAND ----------

-- MAGIC %fs head 'dbfs:/user/hive/warehouse/smartphones/_delta_log/00000000000000000000.json'

-- COMMAND ----------

DESCRIBE HISTORY smartphones;

-- COMMAND ----------

RESTORE TABLE smartphones TO VERSION AS OF 2;

-- COMMAND ----------

SELECT * FROM smartphones;
