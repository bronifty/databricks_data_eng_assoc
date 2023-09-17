-- Databricks notebook source
CREATE TEMPORARY VIEW temp_view_phones_brands
AS SELECT DISTINCT brand 
FROM hive_metastore.default.smartphones;

SELECT * FROM temp_view_phones_brands;

-- COMMAND ----------

SHOW TABLES;

-- COMMAND ----------

CREATE GLOBAL TEMPORARY VIEW latest_phones
AS SELECT * FROM smartphones
WHERE year > 2020
ORDER BY year DESC;

-- COMMAND ----------

SHOW TABLES;

-- COMMAND ----------

SELECT * FROM global_temp.latest_phones;

-- COMMAND ----------

SHOW TABLES IN global_temp
