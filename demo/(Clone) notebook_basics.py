# Databricks notebook source
print("yes hello this is dog");

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM samples.nyctaxi.trips

# COMMAND ----------

# MAGIC %md
# MAGIC # Title
# MAGIC

# COMMAND ----------



# COMMAND ----------

# MAGIC %run ../includes/setup

# COMMAND ----------

print(full_name);

# COMMAND ----------

# MAGIC %fs ls '/databricks-datasets'

# COMMAND ----------

dbutils.fs.help();

# COMMAND ----------

files = dbutils.fs.ls('/databricks-datasets');
print(files);

# COMMAND ----------

display(files);
