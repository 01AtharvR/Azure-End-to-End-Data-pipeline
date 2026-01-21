--CREATE MASTER KEY  ENCRYPTION BY PASSWORD ='atharv@123' --
CREATE DATABASE SCOPED CREDENTIAL cred_atharv26
WITH IDENTITY = 'managed identity'
   

   CREATE EXTERNAL DATA SOURCE source_silver28
   with (
    LOCATION = 'https://awstorageproj2607.blob.core.windows.net/silver',
    CREDENTIAL = cred_atharv26
   )

    CREATE EXTERNAL DATA SOURCE source_gold28
   with (
    LOCATION = 'https://awstorageproj2607.blob.core.windows.net/gold',
    CREDENTIAL = cred_atharv26
   )


   CREATE EXTERNAL FILE FORMAT format_parquet29
   WITH (
    FORMAT_TYPE =PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
   )


CREATE EXTERNAL TABLE gold.extnew2
   WITH(
   LOCATION = 'extnew2/' ,
   DATA_SOURCE =source_gold28 ,
   FILE_FORMAT= format_parquet29
    
   )
   AS SELECT * FROM gold.sales27 