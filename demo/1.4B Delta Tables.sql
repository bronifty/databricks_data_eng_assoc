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

-- COMMAND ----------

DROP SCHEMA db_y CASCADE;
CREATE SCHEMA db_y
LOCATION 'dbfs:/custom/path/db_y.db'; -- specify the data/logs location

USE db_y; -- create tables under db_y schema in hive repo
CREATE TABLE table_1
(width INT, length INT, height INT); -- will be managed table
CREATE TABLE table_2
(width INT, length INT, height INT)
LOCATION 'dbfs:/some/path_1/table_2'; -- will be external table
INSERT INTO table_2
VALUES (1,2,3);


-- COMMAND ----------

-- DESCRIBE EXTENDED table_1; -- dbfs:/custom/path/db_y.db/table_1
DESCRIBE EXTENDED table_2; -- dbfs:/some/path_1/table_2
